//+------------------------------------------------------------------+
//|                                             CCI CrossOver EA.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

extern string group1= "---GENERAL EA SETTINGS---";
extern string EA_NAME="CCI_MA";
extern int TakeProfit=30;
extern double lotsize =0.01;
extern int MagicNumber=123456;
extern int TrailingStop=20;
extern int TrailingStep=5; 
//-------------------------------------------------------------------
extern string group2= "---STOP LOSS SETTINGS---";
enum choose{ Bellow_21MA=0, LowofPrevCandleOrPipsSet=1};
extern choose Set_SL_at=Bellow_21MA;
extern ENUM_MA_METHOD Bellow21_Method=MODE_SMA;
extern int Bellow21_Period=21;
extern int PipsToSetSL=20;
//--------------------------------------------------------------------
extern string group3 ="---EMA SETTINS---";
extern ENUM_MA_METHOD _21MA_Method=MODE_SMA;
extern ENUM_MA_METHOD _51MA_Method=MODE_SMA;
extern ENUM_MA_METHOD _200MA_Method=MODE_SMA;
//--------------------------------------------------------------------
extern  string group4= "---CCI INDICATOR SETTINGS---";
extern int CCI_PERIODValue=51;
extern ENUM_MA_METHOD CCI_MA_Method=MODE_SMA;
extern int CCI_MA_PERIODValue=30;
enum APPLY_TO
  {
   APPLY_TO_Close=PRICE_CLOSE,         //Close
   APPLY_TO_Open=PRICE_OPEN,           //Open
   APPLY_TO_High=PRICE_HIGH,           //High
   APPLY_TO_Low=PRICE_LOW,             //Low
   APPLY_TO_Median=PRICE_MEDIAN,       //Median
   APPLY_TO_Typical=PRICE_TYPICAL,     //Typical
   APPLY_TO_Weighted=PRICE_WEIGHTED,   //Weighted
   APPLY_TO_CCI,                       //Commodity Channel Index
   //APPLY_TO_RSI                        //Relative Strength Index
  };  
input APPLY_TO ApplyTo=APPLY_TO_Close;
double pips;
int ticket,result;
int Gi_324 = 65535;
int Gi_328 = 65535;
int Gi_332 = 16776960;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   
  
   double ticksize=MarketInfo(Symbol(),MODE_TICKSIZE);
      if(ticksize==0.00001 || ticksize==0.001)
      pips=ticksize*10;
      else pips=ticksize;
//---
 
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
    DrawBox(EA_NAME, clrBlack, clrWhite, 0, 300,15, 214);
   f0_9();
   TraillingStop();
   double MA21 = iMA(Symbol(),Period(),21,0,_21MA_Method,PRICE_CLOSE,1);
   double MA51 = iMA(Symbol(),Period(),51,0,_51MA_Method,PRICE_CLOSE,2);
   double MA200 = iMA(Symbol(),Period(),200,0,_200MA_Method,PRICE_CLOSE,3);
   
   static double CCIMA2;
   static double CCI2;
   double CCIMA1 = iCustom(Symbol(),Period(),"CCI_MA1",CCI_MA_PERIODValue,CCI_MA_Method,CCI_PERIODValue,ApplyTo,0,0);
      //double CCIMA2 = iMA(Symbol(),Period(),CCI_MA_PERIODValue,0,CCI_MA_Method,PRICE_CLOSE,2);
   double CCI1 = iCustom(Symbol(),Period(),"CCI_MA1",CCI_MA_PERIODValue,CCI_MA_Method,CCI_PERIODValue,ApplyTo,1,0);
  // double CCI2 = iCCI(Symbol(),Period(),CCI_MA_PERIODValue,PRICE_CLOSE,2);
   
  
   //static int isCrossed=Crossed(CCI1,CCIMA1);
   
   double StopLoss=StopLoss();
   string signal="";
   if(CCI1>CCIMA1 && CCI2<=CCIMA2){
      exitbuys();
      signal="sell";
      }
   if(CCI1<CCIMA1 && CCI2>=CCIMA2){
      exitsells();
      signal="buy";
      }
      
    //isCrossed = Crossed (CCI,CCIMA);
   if((OrdersTotal()==0)&&(Ask>MA21)&&(Ask>MA51)&&(Ask>MA200)&&(CCI1>0)&&(signal=="buy"))
          {
            //exitsells();
            ticket = OrderSend(Symbol(), OP_BUY, lotsize , Ask, 3, 0, 
                               Ask + TakeProfit*10*_Point, EA_NAME, MagicNumber, 0, Green);
            if(ticket > 0)
              {
                if(OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES)) 
                    Print("BUY order opened : ",OrderOpenPrice());
                //isCrossed=0;
              }
            else 
                Print("Error opening BUY order : ", GetLastError()); 
            
         }
      else if((OrdersTotal()==0)&&(Bid<MA21)&&(Bid<MA51)&&(Bid<MA200)&&(CCI1<0) && (signal =="sell"))
          {
            //exitbuys();
            int ticket1 = OrderSend(Symbol(), OP_SELL,lotsize, Bid, 3, 0, 
                               Bid - TakeProfit*10*_Point, EA_NAME, MagicNumber, 0, Red);
            if(ticket1 > 0)
              {
                if(OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES)) 
                    Print("SELL order opened : ", OrderOpenPrice());
                //isCrossed=0;
              }
            else 
                Print("Error opening SELL order : ",GetLastError()); 
            
          }             
  
  //return(0);
  }
//+------------------------------------------------------------------+
//| FUNTION TO MOMDIFY SL                                            |
//+------------------------------------------------------------------+
void ModifyStopLoss(double ldStopLoss) {
  bool fm;

  fm=OrderModify(OrderTicket(),OrderOpenPrice(),ldStopLoss,OrderTakeProfit(),0,clrAliceBlue);
 
}
//+------------------------------------------------------------------+
//| FUNCTION FOR TRAILING STOP                                       |
//+------------------------------------------------------------------+
void TraillingStop () {
  for (int i=0; i<OrdersTotal(); i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      TrailingPositions();
    }
  }
}
//+------------------------------------------------------------------+
//|   FUNTION FOR TRAILING STOP POSITIONS                            |
//+------------------------------------------------------------------+
void TrailingPositions() {
  double pBid, pAsk, pp;

  pp = MarketInfo(OrderSymbol(), MODE_POINT);
  if (OrderType()==OP_BUY) {
    pBid = MarketInfo(OrderSymbol(), MODE_BID);
    if ( (pBid-OrderOpenPrice())>TrailingStop*pp*10) {
      if (OrderStopLoss()<pBid-(TrailingStop+TrailingStep-1)*pp*10) {
        ModifyStopLoss(pBid-TrailingStop*pp*10);
        return;
      }
    }
  }
  if (OrderType()==OP_SELL) {
    pAsk = MarketInfo(OrderSymbol(), MODE_ASK);
    if ( OrderOpenPrice()-pAsk>TrailingStop*pp*10) {
      if (OrderStopLoss()>pAsk+(TrailingStop+TrailingStep-1)*pp*10 || OrderStopLoss()==0) {
        ModifyStopLoss(pAsk+TrailingStop*pp*10);
        return;
      }
    }
  }
}
//+-------------------------------------------------------------------+
//|  FUNTION TO CALCULATE STOPLOSS                                    |
//+-------------------------------------------------------------------+
double StopLoss()
   { 
     double StopLoss=0;
     
     double BellowMA21 = iMA(Symbol(),PERIOD_CURRENT,Bellow21_Period,0,Bellow21_Method,PRICE_CLOSE,1);
      if(Bellow_21MA)
         {  
            if(OrderType()==OP_BUY)
            {
            if((BellowMA21<last_high()<last_low() ))StopLoss=last_high();
            if((BellowMA21<last_low()<last_high())) StopLoss=last_low();
            }
            if(OrderType()==OP_SELL)
            {
               if((BellowMA21>last_high()>last_low() ))StopLoss=last_high();
               if((BellowMA21>last_low()>last_high())) StopLoss=last_low();
            }
           }
      else if (LowofPrevCandleOrPipsSet)
         { 
            if(OrderType()==OP_BUY)
               {
                  if(Low[1]<(Ask-(PipsToSetSL*pips))) StopLoss=Low[1];
                  if(Low[1]>(Ask-(PipsToSetSL*pips))) StopLoss=(Ask-(PipsToSetSL*pips));
                }
             if(OrderType()==OP_SELL)
               {
                  if(High[1]<(Bid+(PipsToSetSL*pips))) StopLoss=High[1];
                  if(High[1]>(Bid+(PipsToSetSL*pips))) StopLoss=(Bid+(PipsToSetSL*pips));
                }
              }
             
        return(StopLoss);
     }
//+------------------------------------------------------------------+
//|  FUNTION TO CHECK IF CCI HAS CROSSED THE CCIMA                   |
//+------------------------------------------------------------------+
int Crossed (double line1 , double line2)
  {
    static int last_direction = 0;
    static int current_direction = 0;
    //Don't work in the first load, wait for the first cross!
    static bool first_time = true;
    if(first_time == true)
      {
        first_time = false;
        return (0);
      }
//----
    if(line1 > line2)
        current_direction = 1;  //up
    if(line1 < line2)
        current_direction = 2;  //down
//----
    if(current_direction != last_direction)  //changed 
      {
        last_direction = current_direction;
        return(last_direction);
      }
    else
      {
        return (0);  //not changed
      }
  }
//+------------------------------------------------------------------+
//|  FUNCTION TO CLOSE BUY ORDERS                                    |
//+------------------------------------------------------------------+
void exitbuys()
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY && OrderSymbol()==Symbol() && OrderComment()==EA_NAME && OrderMagicNumber()==MagicNumber)
           {
            result=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),3,clrAntiqueWhite);
            if(result!=true)//if it did not close
              {
                Print("LastError = ",GetLastError());//get the reason why it didn't close
              }

           }
        }

     }
  }
//+------------------------------------------------------------------+
//|    FUNTION TO CLOSE SELL ORDERS                                  |
//+------------------------------------------------------------------+
void exitsells()
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {

         if(OrderType()==OP_SELL && OrderSymbol()==Symbol() && OrderComment()==EA_NAME && OrderMagicNumber()==MagicNumber)
           {
            result=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),3,clrAquamarine);
            if(result!=true)//if it did not close
              {
                Print("LastError = ",GetLastError());//get the reason why it didn't close
              }

           }
        }

     }
  }
//+-----------------------------------------------------------------------+
//|   FUNTIONS TO CHECK THE MOST RECENT FRACTALS                          |
//+-----------------------------------------------------------------------+
double last_high() {

   int j = 3;
   double fractal = 0;
   
   fractal = iFractals(Symbol(), Period(), MODE_UPPER, j);
   
   if (fractal == 0) {
      while (fractal == 0) {
         j = j + 1;
         fractal = iFractals(Symbol(), Period(), MODE_UPPER, j);
      }
   }
   
   return (fractal);
}


double last_low() {

   int j = 3;
   double fractal = 0;
   
   fractal = iFractals(Symbol(), Period(), MODE_LOWER, j);
   
   if (fractal == 0) {
      while (fractal == 0) {
         j = j + 1;
         fractal = iFractals(Symbol(), Period(), MODE_LOWER, j);
      }
   }
   
   return (fractal);
}
//+-----------------------------------------------------------------------+
//|        FUNCTION TO DRABOX                                             |
//+-----------------------------------------------------------------------+
void f0_9() {
   color color_0;
   int Li_4 = 65280;
   if (AccountEquity() - AccountBalance() < 0.0) Li_4 = 255;
   if (Seconds() >= 0 && Seconds() < 10) color_0 = Red;
   if (Seconds() >= 10 && Seconds() < 20) color_0 = Violet;
   if (Seconds() >= 20 && Seconds() < 30) color_0 = Orange;
   if (Seconds() >= 30 && Seconds() < 40) color_0 = Blue;
   if (Seconds() >= 40 && Seconds() < 50) color_0 = Yellow;
   if (Seconds() >= 50 && Seconds() <= 59) color_0 = Aqua;
   string Ls_8 = "-------------------------------------------";
   f0_6("L01", "Arial", 12, 10, 10, Gi_328, 0, Ls_8);
   f0_6("L02", "Verdana", 15, 10, 25, color_0, 0, EA_NAME);
   f0_6("L0i", "Verdana", 12, 10, 45, Gi_324, 0, "CrossOver ");
   f0_6("L03", "Arial", 12, 10, 60, Gi_328, 0, Ls_8);
   f0_6("L04", "Arial", 12, 10, 75, Gi_332, 0, " Account Company : " + AccountCompany());
   f0_6("L05", "Arial", 12, 10, 90, Gi_332, 0, " Name Server  : " + AccountServer());
   f0_6("L06", "Arial", 12, 10, 105, Gi_332, 0, " Account Name  : " + AccountName());
   f0_6("L07", "Arial", 12, 10, 120, Gi_332, 0, " Name Number  : " + AccountNumber());
   f0_6("L08", "Arial", 12, 10, 135, Gi_332, 0, " Account Leverage  : 1:" + AccountLeverage());
   f0_6("L09", "Arial", 12, 10, 150, Gi_332, 0, " Time Server  : " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS));
   f0_6("L14", "Arial", 12, 10, 210, Li_4, 0, " Profit / Loss  : $ " + DoubleToStr(AccountEquity() - AccountBalance(), 2));
   f0_6("L11", "Arial", 12, 10, 180, Gi_332, 0, " Account Balance  : $ " + DoubleToStr(AccountBalance(), 2));
   f0_6("L12", "Arial", 12, 10, 195, Gi_332, 0, " Account Equity  : $ " + DoubleToStr(AccountEquity(), 2));
   f0_6("L13", "Arial", 12, 10, 165, Gi_332, 0, " Total open Orders : " + DoubleToStr(OrdersTotal(), 0));
   
   ObjectCreate("j", OBJ_LABEL, 0, 0, 0);
   ObjectSet("j", OBJPROP_CORNER, 3);
   ObjectSet("j", OBJPROP_XDISTANCE, 10);
   ObjectSet("j", OBJPROP_YDISTANCE, 10);
   ObjectSetText("j", ". ", 15, "Mistral", color_0);
}

void f0_6(string A_name_0, string A_fontname_8, int A_fontsize_16, int A_x_20, int A_y_24, color A_color_28, int A_corner_32, string A_text_36) {
   if (ObjectFind(A_name_0) < 0) ObjectCreate(A_name_0, OBJ_LABEL, 0, 0, 0);
   ObjectSetText(A_name_0, A_text_36, A_fontsize_16, A_fontname_8, A_color_28);
   ObjectSet(A_name_0, OBJPROP_CORNER, A_corner_32);
   ObjectSet(A_name_0, OBJPROP_XDISTANCE, A_x_20);
   ObjectSet(A_name_0, OBJPROP_YDISTANCE, A_y_24);
}


void DrawBox(string nm, color BackColor, color BorderColor, int x, int xsize, int y, int ysize)
{

if(!ObjectCreate(0, nm, OBJ_RECTANGLE_LABEL, 0, 1, 1, 1, 1))
{
Print(__FUNCTION__,
"failed to create rectangle! Error code: = ", GetLastError());
return;
}
ObjectCreate(0, nm, OBJ_RECTANGLE_LABEL, 0, 1, 1, 1, 1); // Create a label
ObjectSetInteger(0, nm, OBJPROP_XDISTANCE, x); // X-coordinate
ObjectSetInteger(0, nm, OBJPROP_YDISTANCE, y); // Y-coordinate
ObjectSetInteger(0, nm, OBJPROP_XSIZE, xsize); // label width
ObjectSetInteger(0, nm, OBJPROP_YSIZE, ysize); // label height
ObjectSetInteger(0, nm, OBJPROP_BGCOLOR, BackColor); // background color
ObjectSetInteger(0, nm, OBJPROP_BORDER_TYPE, BORDER_RAISED); // border type
ObjectSetInteger(0, nm, OBJPROP_CORNER, CORNER_LEFT_UPPER); // anchor angle
ObjectSetInteger(0, nm, OBJPROP_BORDER_COLOR, BorderColor); // frame color
ObjectSetInteger(0, nm, OBJPROP_BACK, false); // in the background - true
ObjectSetInteger(0, nm, OBJPROP_SELECTABLE, false); // move the label with the mouse, true - you can
ObjectSetInteger(0, nm, OBJPROP_SELECTED, false); // mark selection by mouse, true - you can
ObjectSetInteger(0, nm, OBJPROP_HIDDEN, true); // hide in object list - true
}
//+-----------------------------------------------------------------------+
//|     FUNCTION TO CHECK NEW BAR                                         |
//+-----------------------------------------------------------------------|
bool NewBar()
   {
      static datetime current=0;
      datetime        now= iTime(Symbol(),Period(),0);
      if(now==current) return(false);
      return(true);
      }
//+-----------------------------------------------------------------------+
//|                          #END                                         |
//+-----------------------------------------------------------------------+