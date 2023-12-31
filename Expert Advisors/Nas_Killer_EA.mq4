//+------------------------------------------------------------------+
//|                                                    Nas_Killer_EA ¡                                                           +
//+------------------------------------------------------------------+
#property copyright "Copyright 2022 - Justinbucci"
#property version   "2.0"
#property strict
enum onoff
  {
   on=1, // On
   off=0,// Off
  };
extern string   Nas_Killer__Settings           = "==========================";
input   int     magic_number                   = 250717; //Magic Number of EA
input   int     max_trades                     = 3;
input   double  lots                           = 0.01;
input   int     take_profit_pips               = 60;
input   int     stop_loss_pips                 = 30;
extern  string  Trailing_Stop_Settings         = "===Trailing Stop settings===";
extern  bool    enable_trailin_stop            = on;
input   int     trailing_stop_pips             = 40;
input   onoff   buy_order                      = on;
input   onoff   sell_order                     = off;
input   onoff   dmi_indicator                  = off;
input   onoff   ma_indicator                   = on;
input   onoff   awesome_indicator              = on;
input   bool    wick_at_the_top                = false;
input   bool    wick_at_the_bottom             = false;
extern  string  EMA_Settings                   = "===EMA Indicator settings===";
extern  int     period_ema                     = 20;
extern  ENUM_MA_METHOD  method_ema             = MODE_EMA;
extern  int     shift_ema                      = 0;
extern  ENUM_APPLIED_PRICE applied_price       = PRICE_CLOSE;
extern  string  DMI_Settings                   = "===DMI Indicator settings===";
extern  int     period_dmi                     = 14;
extern  ENUM_APPLIED_PRICE applied_price_dmi   = PRICE_CLOSE;
extern  string  Martingale_Settings            = "========================= ";
input   bool    martingale                     = true;
input   double  factor_margingale              = 2.0;
input   int     distance_martingale            = 20;
extern  string  Day_Week_Settings              = "========================= ";
input   onoff   sunday                         = on;
input   onoff   monday                         = on;
input   onoff   tuesday                        = on;
input   onoff   wednesday                      = on;
input   onoff   thursday                       = on;
input   onoff   friday                         = on;
input   onoff   saturday                       = on;
extern  string  Trading_Hours                  = "===Trading Hours settings===";
extern  string  StartTime                      = "00:00";    
extern  string  EndTime                        = "23:30"; 
input   bool    information_account            = true;  

//+----------------------------------------------------------
//+----------------------------------------------------------

int         trailing_stop;
double      PositionSizeb,PositionSizes;
int         mypoint,id1;
string      comment;
double      SL_Entry00_S,TP_Entry00_S1,SL_Entry01_S1,TP_Entry01_S1,SL_Entry00_S1,ema1[];
datetime    CheckTime,CheckEntryTime;
static int  TimeFrame  = 0;
bool        OneEntryPerBar = true,first_time_objects=true;
int         barsback  = 1000;
double      last_distance=0,new_lots=0;
double      initial_balance,max_dd;

//********************************************************************
int Corner          = 0;
int Move_X          = 0;
int Move_Y          = 0;
string B00000       = "============";
string Font_Type    = "Arial Bold";
color Font_Color    = White;
int Font_Size       = 10;
string B00001       = "============";
int Button_Width    = 150;
color Button_Color  = Red;
color Button_Border = Red;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   if(MarketInfo(Symbol(), MODE_DIGITS)==3||MarketInfo(Symbol(), MODE_DIGITS)==5)
   mypoint=10;
   else mypoint=1;
   comment = "";
   Comment(" ");
   initial_balance = NormalizeDouble(AccountBalance(),2);
   ObjectsDeleteAll(0);  
   CreateButtons();
   ToolTips_Text ("CloseALL_btn");
   return(0);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
   DeleteButtons();
   ObjectsDeleteAll();
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
{
      
     int iTotalOrders,iCrossed;
     RefreshRates();
     
     ChartRedraw();
 
     Comment(TimeToString(TimeCurrent()));    
     
     if (information_account==true) draw_information(); 

     //Restrictions values to take profit , stop loss and trailin stop,
     
     if (take_profit_pips == 0 || take_profit_pips < 0 || stop_loss_pips == 0 || stop_loss_pips < 0)
     {
 
         Comment("Take profit and Stop loss must be greater than zero.");
         return(0);
     }    
     
     if (trailing_stop_pips < 0)
     {
 
         Comment("Trailing Stop must be greater or equal than zero.");
         return(0);
     }  
     
     if (enable_trailin_stop==1) trailing_stop = trailing_stop_pips;
     else trailing_stop = 0;
     iTotalOrders  = Count(magic_number);
     iCrossed      = CheckSignal();
        
     if ((Newbar() == true) && (iCrossed > 0) && (CheckTime()==true) && (check_week_day() == true))
     {
         RefreshRates();PlaceOrder(iCrossed,lots);
     }
     
     if (iTotalOrders > 0)
     {
         if (trailing_stop > 0)
         {
            TrailingStop(iTotalOrders);            
         }
              
     }      
     check_close_sell_orders(); 
     check_close_buy_orders(); 
     
     
     return(0);
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

bool CheckTime() 
{    
   
     string time_with_seconds = TimeToString(iTime(Symbol(),Period(),1),TIME_MINUTES | TIME_SECONDS);
     
        
     if (time_with_seconds >= StartTime && time_with_seconds <= EndTime)
     {   
        return(true);
     }   
     else
     {
         return(false);
     } 
    
     return(true);  
}  
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool Newbar()                           
{                                    
   if(OneEntryPerBar)
      {
        if(CheckEntryTime==iTime(NULL,TimeFrame,0)) return(false); 
        else {CheckEntryTime = iTime(NULL,TimeFrame,0); return(true);}
      } 
    return(true);  
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool check_week_day()                           
{                                    
    if ((DayOfWeek() == 0 && sunday    == 1) ||
        (DayOfWeek() == 1 && monday    == 1) ||
        (DayOfWeek() == 2 && tuesday   == 1) ||
        (DayOfWeek() == 3 && wednesday == 1) ||
        (DayOfWeek() == 4 && thursday  == 1) ||
        (DayOfWeek() == 5 && friday    == 1) ||
        (DayOfWeek() == 6 && saturday  == 1))     
         
         return(true);
    else return(false);     
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void PlaceOrder(int iSignal, double iLots)
{
   int iTicket;
   double SL01 = 0,TP01 = 0;

   if ((iSignal == 1)) // Buy Signal
   {
      TP01 = TP_Entry01_S1;
      SL01 = SL_Entry01_S1;
      iLots = PositionSizeb;
   }
   
   if ((iSignal == 2))// Sell Signal
   {
      TP01 = TP_Entry00_S1;
      SL01 = SL_Entry00_S1;
      iLots = PositionSizes; 
   }

   RefreshRates();  
   if(iSignal == 1)
   {
      iTicket=OrderSend(Symbol(),OP_BUY,iLots,Ask,3,0.0,0.0,comment,magic_number,0,Green);
      if(iTicket>0)
      {
         if(OrderSelect(iTicket,SELECT_BY_TICKET,MODE_TRADES)) Print("BUY order opened : ",
         OrderOpenPrice(),",",SL01,",",TP01);
         
         int x1 = OrderModify(OrderTicket(),OrderOpenPrice(),SL01,TP01,0,Green);
      }
      else
      {
         Print("Error opening BUY order : ",GetLastError());
      }
   }
   
   if(iSignal == 2)
   {
      iTicket=OrderSend(Symbol(),OP_SELL,iLots,Bid,3,0.0,0.0,comment,magic_number,0,Red);
      if(iTicket>0)
      {
         if(OrderSelect(iTicket,SELECT_BY_TICKET,MODE_TRADES)) Print("SELL order opened : ",OrderOpenPrice());
         
         int x2 = OrderModify(OrderTicket(),OrderOpenPrice(),SL01,TP01,0,Red);
      }
      else
      {
        Print("Error opening SELL order : ",GetLastError());
      }
   }
} 
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void TrailingStop(int iTotal)
  {
   int cnt,total;
   total  = OrdersTotal();
 //  Print("Trailing");
       for(cnt=total-1;cnt>= 0;cnt--)  
      {
         int x3 = OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);

         if(OrderType()<=OP_SELL && OrderSymbol()==Symbol()&& ((OrderMagicNumber()== magic_number)))
         {
            if(OrderType()==OP_BUY)   //<-- Long position is opened
            {
               TrailOrder(OrderType());  //<-- Trailling the order
            }
            if(OrderType()==OP_SELL) //<-- Go to short position
            {
               TrailOrder(OrderType()); //<-- Trailling the order
            }
         }
      }

   
  }

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void TrailOrder(int type)
{
   int total2  = OrdersTotal();
   if(trailing_stop>0)
   {
      if ((OrderMagicNumber() == magic_number))
      {
      
         if(type==OP_BUY)
         {
            if(Bid-OrderOpenPrice()>Point*mypoint*trailing_stop)
            {
               if(OrderStopLoss()<Bid-Point*mypoint*trailing_stop)
               {
                  int x4 = OrderModify(OrderTicket(),OrderOpenPrice(),Bid-Point*mypoint*trailing_stop,OrderTakeProfit(),0,Green);
                  for(int cnt1=total2-1;cnt1>= 0;cnt1--){
                  int x6 = OrderSelect(cnt1, SELECT_BY_POS, MODE_TRADES);
                  if ((OrderType()==OP_BUY)&& OrderSymbol()==Symbol()&& ((OrderMagicNumber()== magic_number)))
                  int v5 = OrderModify(OrderTicket(),OrderOpenPrice(),Bid-Point*mypoint*trailing_stop,OrderTakeProfit(),0,Green);
               }
               }
            }
         }
         if(type==OP_SELL)
         {
            if((OrderOpenPrice()-Ask)>(Point*mypoint*trailing_stop))
            {
              if((OrderStopLoss()>(Ask+Point*mypoint*trailing_stop)) || (OrderStopLoss()==0))             
              {
                  int x7 = OrderModify(OrderTicket(),OrderOpenPrice(),Ask+Point*mypoint*trailing_stop,OrderTakeProfit(),0,Red);
                  for(int cnt2=total2-1;cnt2>= 0;cnt2--){
                  int x8 = OrderSelect(cnt2, SELECT_BY_POS, MODE_TRADES);
                  if ((OrderType()==OP_SELL)&& OrderSymbol()==Symbol()&& ((OrderMagicNumber()== magic_number)))
                  int x9 = OrderModify(OrderTicket(),OrderOpenPrice(),Ask+Point*mypoint*trailing_stop,OrderTakeProfit(),0,Red);
              }
              }
            }
         }
      }
   }
}

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
int CheckSignal()
{
   static int siCurrentDirection = 0;
   siCurrentDirection = 0;


   double aw0     = iAO(Symbol(),Period(),1);
   double aw1     = iAO(Symbol(),Period(),2);
   double di01    = iADX(Symbol(),Period(),period_dmi,applied_price_dmi,MODE_PLUSDI,1);
   double di02    = iADX(Symbol(),Period(),period_dmi,applied_price_dmi,MODE_MINUSDI,1);
   double di01_p  = iADX(Symbol(),Period(),period_dmi,applied_price_dmi,MODE_PLUSDI,2);
   double di02_p  = iADX(Symbol(),Period(),period_dmi,applied_price_dmi,MODE_MINUSDI,2);
  
   double ma      = iMA(Symbol(),Period(),period_ema,shift_ema,method_ema,applied_price,1);
   double close   = iClose(Symbol(),Period(),1);
   double open    = iOpen(Symbol(),Period(),1);
   double low     = iLow(Symbol(),Period(),1);
   double high    = iHigh(Symbol(),Period(),1);
   double ispread = MarketInfo(Symbol(),MODE_SPREAD)/10;
   double digits  = MarketInfo(Symbol(),MODE_DIGITS);
   
  
   
      //Buy module without wick & DMI (1,1,1) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 1 && close > ma && wick_at_the_bottom == false &&
          awesome_indicator == 1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      } 
           
      
      //Sell module without wick and DMI (1,1,1)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 1 && close < ma && wick_at_the_top == false &&
          awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      }
      
      //Buy module without wick & DMI (1,0,1) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 0 && wick_at_the_bottom == false &&
          awesome_indicator == 1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      } 
           
      
      //Sell module without wick and DMI (1,0,1)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 0 && wick_at_the_top == false &&
          awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      }
      
      //Buy module without wick & DMI (1,1,0) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 1 && close > ma && wick_at_the_bottom == false &&
          awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      } 
           
      
      //Sell module without wick and DMI (1,1,0)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 1 && close < ma && wick_at_the_top == false &&
          awesome_indicator == 0  &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      }
   
      //Buy module without wick & DMI (1,0,0) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 0 && wick_at_the_bottom == false &&
          awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      } 
           
      
      //Sell module without wick and DMI (1,0,0)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 0 && wick_at_the_top == false &&
          awesome_indicator == 0  &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }      
      }
      
      
      //*******************************************************************************************
      
      //Buy module with wick (1,1,1) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 1 && close > ma && wick_at_the_bottom &&
          low == open && awesome_indicator == 1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      //Sell module wick (1,1,1) ------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 1 && close < ma && wick_at_the_top &&
          high == open && awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module with wick (1,0,1) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 0 && wick_at_the_bottom &&
          low == open && awesome_indicator == 1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      //Sell module wick (1,0,1) ------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 0 && wick_at_the_top &&
          high == open && awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module wick (1,1,0) ------------------------------------------------------------//
      if (buy_order == 1 && dmi_indicator == 1 && di01_p < di02_p && di01 > di02 && ma_indicator == 1 && close > ma && wick_at_the_bottom &&
          low == open && awesome_indicator == 0  && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      //Sell module wick (1,1,0) ------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 1 && close < ma && wick_at_the_top &&
          high == open && awesome_indicator == 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module wick (1,0,0) ------------------------------------------------------------//
      if (buy_order == 1 && dmi_indicator == 1  && di01_p < di02_p && di01 > di02 && ma_indicator == 0 && wick_at_the_bottom &&
          low == open && awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      //Sell module wick (1,0,0) ------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 1 && di01_p > di02_p && di01 < di02 && ma_indicator == 0 && wick_at_the_top &&
          high == open && awesome_indicator == 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //********************************************************************************************************
      //Buy module without wick and not dmi (0,1,1) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator == 1 && close > ma && wick_at_the_bottom == false &&
          awesome_indicator == 1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
           
      
      //Sell module without wick and not dmi (0,1,1)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 1 && close < ma && wick_at_the_top == false &&
          awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module without wick and not dmi (0,0,1) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_bottom == false &&
          awesome_indicator == 1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
           
      
      //Sell module without wick and not dmi (0,0,1)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_top == false &&
          awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module without wick and not dmi (0,1,0) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator == 1 && close > ma && wick_at_the_bottom == false &&
          awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
           
      
      //Sell module without wick and not dmi (0,1,0)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 1 && close < ma && wick_at_the_top == false &&
          awesome_indicator == 0  &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module without wick and not dmi (0,0,0) ------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_bottom == false &&
          awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
           
      
      //Sell module without wick and not dmi (0,0,0)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_top == false &&
          awesome_indicator == 0  &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
   
      //***********************************************************************************************
      
      //Buy module wick and not dmi(0,1,1)------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator== 1 && close > ma && wick_at_the_bottom &&
          low == open && awesome_indicator ==1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      
      //Sell module wick and not dmi (0,1,1)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 1 && close < ma && wick_at_the_top &&
          high == open && awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      //Buy module wick and not dmi (0,0,1)------------------------------------------------------------//
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator== 0 && wick_at_the_bottom &&
          low == open && awesome_indicator ==1 && aw0 > aw1 && aw0 > 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      
      //Sell module wick and not dmi (0,1,1)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_top &&
          high == open && awesome_indicator == 1 && aw0 < aw1 && aw0 < 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module wick and not dmi(0,1,0)------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator== 1 && close > ma && wick_at_the_bottom &&
          low == open && awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      
      //Sell module wick and not dmi (0,1,0)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 1 && close < ma && wick_at_the_top &&
          high == open && awesome_indicator == 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }
      
      //Buy module wick and not dmi(0,0,0)------------------------------------------------------------//
      
      if (buy_order == 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_bottom &&
          low == open && awesome_indicator == 0 && Countbuy(Symbol(),magic_number) < max_trades)
      {
          if(!martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             PositionSizeb      = lots;
             comment            = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection = 1;
             SL_Entry01_S1      = 0;//Ask - (stop_loss_pips+ispread)*Point*10;
             TP_Entry01_S1      = Ask + (take_profit_pips+ispread)*Point*10;
             MartingaleSizeb(TP_Entry01_S1);
             if (last_distance == 1)   PositionSizeb      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      } 
      
      
      //Sell module wick and not dmi (0,0,0)------------------------------------------------------------//
   
           
      if (sell_order== 1 && dmi_indicator == 0 && ma_indicator == 0 && wick_at_the_top &&
          high == open && awesome_indicator == 0 &&  Countsell(Symbol(),magic_number) < max_trades)
          
      {
          if(!martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             PositionSizes           = lots;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }
          if(martingale)
          {
             siCurrentDirection      = 2;
             SL_Entry00_S1           = 0;//Bid + (stop_loss_pips+ispread)*Point*10;
             TP_Entry00_S1           = Bid - (take_profit_pips+ispread)*Point*10;
             MartingaleSizes(TP_Entry00_S1);
             if (last_distance == 1)   PositionSizes      = new_lots;
             if (last_distance == 0)   siCurrentDirection = 0;
             comment                 = "Nas Killer 2.0";
             return (siCurrentDirection);
          }   
      }

   return (siCurrentDirection);
}  
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
int Count(int Magic)
{
 int count=0;
 int trade;
 for(trade=OrdersTotal()-1;trade>=0;trade--)
 {
  int x17 =  OrderSelect(trade,SELECT_BY_POS,MODE_TRADES);
  if(OrderSymbol()==Symbol() && OrderMagicNumber()==Magic)
     count++;
 }
 return(count);
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
int Countbuy(string symbol,int Magic)
{
 int count=0;
 int trade;
 for(trade=OrdersTotal()-1;trade>=0;trade--)
 {
  int x80 = OrderSelect(trade,SELECT_BY_POS,MODE_TRADES);
       
  if(OrderSymbol()==symbol && OrderMagicNumber()==Magic && OrderType()==OP_BUY)
   count++;
 }
 return(count);
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
int Countsell(string symbol,int Magic)
{
 int count=0;
 int trade;
 for(trade=OrdersTotal()-1;trade>=0;trade--)
 {
  int x81 = OrderSelect(trade,SELECT_BY_POS,MODE_TRADES);
  if(OrderSymbol()==symbol && OrderMagicNumber()==Magic && OrderType()==OP_SELL)
   count++;
 }
 return(count);
}
//+------------------------------------------------------------------+
//| Calculates a Martingale Buy style position size                      |
//+------------------------------------------------------------------+
void MartingaleSizeb(double new_tp)
{
   
   int index;
   last_distance = 0;
   new_lots      = lots;
  
   index = OrdersTotal() - 1;
   
   for (index = OrdersTotal() - 1; index >= 0; index--)
   {
   
      int x18 = OrderSelect(index, SELECT_BY_POS, MODE_TRADES);
      
      if (OrderSymbol() == Symbol()&& OrderMagicNumber() == magic_number &&
          OrderType()   == OP_BUY && (OrderOpenPrice()-Bid>Point*mypoint*distance_martingale))
      {
           last_distance = 1;
           //int x90 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),new_tp,0,Green);
           new_lots = OrderLots() * factor_margingale;
           index = -1;
      }
   }
   
   if (Countbuy(Symbol(),magic_number) == 0)
   {   
      last_distance = 1;
      new_lots      = lots;
   }   
}
//+------------------------------------------------------------------+
//| Calculates a Martingale Buy style position size                      |
//+------------------------------------------------------------------+
void MartingaleSizes(double new_tp)
{
   
   int index;
   last_distance = 0;
   new_lots      = lots;
  
   index = OrdersTotal() - 1; 
   int x18 = OrderSelect(index, SELECT_BY_POS, MODE_TRADES);
      
   if (OrderSymbol() == Symbol()&& OrderMagicNumber() == magic_number &&
          OrderType()   == OP_SELL && (Ask-OrderOpenPrice())>(Point*mypoint*distance_martingale))
      {
           last_distance = 1;
           //int x90 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),new_tp,0,Green);
           new_lots = OrderLots() * factor_margingale;
           Print("Martingale sell new lots: ", new_lots);
           index = -1;
      }
   
   
   if (Countsell(Symbol(),magic_number) == 0)
   {   
      last_distance = 1;
      new_lots      = lots;
   }   
 
}
//**************************************************************************
//**************************************************************************
void check_close_sell_orders()
{

   int index;
   index = OrdersHistoryTotal() - 1;;
   int x18 = OrderSelect(index, SELECT_BY_POS, MODE_HISTORY);
   if (OrderSymbol() == Symbol()&& OrderMagicNumber() == magic_number &&
          OrderType()   == OP_SELL && (OrderProfit() > 0) && Countsell(Symbol(),magic_number) > 0)
   {
           close_sell_orders();
   }

}
//**************************************************************************
//**************************************************************************
void check_close_buy_orders()
{

   int index;
   index = OrdersHistoryTotal() - 1;;
   int x18 = OrderSelect(index, SELECT_BY_POS, MODE_HISTORY);
   if (OrderSymbol() == Symbol()&& OrderMagicNumber() == magic_number &&
          OrderType()   == OP_BUY && (OrderProfit() > 0) && Countbuy(Symbol(),magic_number) > 0)
   {
           close_buy_orders();
   }

}
//+------------------------------------------------------------
//+------------------------------------------------------------
int close_sell_orders()
{   
   
   int ticket;
   for (int i = OrdersTotal() - 1; i >= 0; i--)
   {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
           if (OrderType() == 1 && OrderMagicNumber()==magic_number)
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), MarketInfo (OrderSymbol(), MODE_ASK), 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ",  GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
            }   
         }
   }
   return(0);
}
//+------------------------------------------------------------
//+------------------------------------------------------------
int close_buy_orders()
{   
   
   int ticket;
   for (int i = OrdersTotal() - 1; i >= 0; i--)
   {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
           if (OrderType() == 0 && OrderMagicNumber()==magic_number)
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), MarketInfo (OrderSymbol(), MODE_BID), 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ",  GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
            }   
         }
   }
   return(0);
}
//+-------------------------------------------------------- 
//+--------------------------------------------------------  
void draw_information()
{
     
     int    orders_total        = OrdersTotal();
     double diff_balance_equity = NormalizeDouble(AccountEquity(),2);
     double profit              = NormalizeDouble(AccountProfit(),2);
     double percentage_profit   = NormalizeDouble((profit/diff_balance_equity)*100,2);
     
     if (percentage_profit < max_dd)  max_dd = percentage_profit;
     
     double pf    = NormalizeDouble(percentage_profit,2);
     double maxdd = NormalizeDouble(max_dd,2);
     double ea    = NormalizeDouble(AccountEquity(),2);
     double ib    = NormalizeDouble(initial_balance,2);
 
     ObjectCreate("sp44", OBJ_LABEL,0, 0, 0);
     ObjectSetText("sp44","Orders Total: "+IntegerToString(orders_total),9,"Verdana", clrRed);
     ObjectSet("sp44", OBJPROP_CORNER, 1);
     ObjectSet("sp44", OBJPROP_XDISTANCE, 20);
     ObjectSet("sp44", OBJPROP_YDISTANCE, 0);
     
     ObjectCreate("sp45", OBJ_LABEL,0, 0, 0);
     ObjectSetText("sp45","% Drawdown: "+DoubleToString(pf,2),9,"Verdana", clrRed);
     ObjectSet("sp45", OBJPROP_CORNER, 1);
     ObjectSet("sp45", OBJPROP_XDISTANCE, 20);
     ObjectSet("sp45", OBJPROP_YDISTANCE, 30);
     
     ObjectCreate("sp46", OBJ_LABEL,0, 0, 0);
     ObjectSetText("sp46","% Max DD : "+DoubleToString(maxdd,2),9,"Verdana", clrRed);
     ObjectSet("sp46", OBJPROP_CORNER, 1);
     ObjectSet("sp46", OBJPROP_XDISTANCE, 20);
     ObjectSet("sp46", OBJPROP_YDISTANCE, 60);
     
     ObjectCreate("sp47", OBJ_LABEL,0, 0, 0);
     ObjectSetText("sp47","Initial Balance : "+DoubleToString(ib,2),9,"Verdana", clrRed);
     ObjectSet("sp47", OBJPROP_CORNER, 1);
     ObjectSet("sp47", OBJPROP_XDISTANCE, 20);
     ObjectSet("sp47", OBJPROP_YDISTANCE, 90);
     
     ObjectCreate("sp48", OBJ_LABEL,0, 0, 0);
     ObjectSetText("sp48","Equity : "+DoubleToString(ea,2),9,"Verdana", clrRed);
     ObjectSet("sp48", OBJPROP_CORNER, 1);
     ObjectSet("sp48", OBJPROP_XDISTANCE, 20);
     ObjectSet("sp48", OBJPROP_YDISTANCE, 120);
}
//+------------------------------------------------------------------+
//Functions button close all trades
//+------------------------------------------------------------------+
void OnChartEvent (const int id, const long &lparam, const double &dparam, const string &sparam)
    {
     ResetLastError();
     if (id == CHARTEVENT_OBJECT_CLICK) {if (ObjectType (sparam) == OBJ_BUTTON) {ButtonPressed (0, sparam);}}
    }
//+-----------------------------------------------------
//+-----------------------------------------------------    
void CreateButtons()
    {
     int Button_Height = Font_Size*2.8;
     if (!ButtonCreate (0, "CloseALL_btn", 0, Move_X + 010, Move_Y + 020, Button_Width, Button_Height, Corner, "Close All Trades", Font_Type, Font_Size, Font_Color, Button_Color, Button_Border)) return;
     ChartRedraw();
    }
//+-----------------------------------------------------
//+-----------------------------------------------------
void DeleteButtons()
    {
     ButtonDelete (0, "CloseALL_btn");
    }
//+-----------------------------------------------------
//+-----------------------------------------------------
void ButtonPressed (const long chartID, const string sparam)
    {
     ObjectSetInteger (chartID, sparam, OBJPROP_BORDER_COLOR, Black);
     ChartRedraw();
     if (sparam == "CloseALL_btn") CloseAll_Button (sparam);
     Sleep (100);
     ObjectSetInteger (0, sparam, OBJPROP_BORDER_COLOR, Silver);
     ChartRedraw();
    }
//+-----------------------------------------------------
//+-----------------------------------------------------    
void ToolTips_Text(const string sparam)
  {
   if (sparam == "CloseALL_btn")   {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Close ALL Open Trades");}
  }
//+--------------------------------------------
//+--------------------------------------------
int CloseAll_Button (const string sparam)
  {   
   //Comment("Hello All Event: ,",iHigh(Symbol(),Period(),1));
   int ticket;
   if (OrdersTotal() == 0) return(0);
   for (int i = OrdersTotal() - 1; i >= 0; i--)
      {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
          if (OrderType() == 0 && OrderMagicNumber()==magic_number)
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), MarketInfo (OrderSymbol(), MODE_BID), 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ", GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
             GlobalVariableSet(Symbol()+"-Tradesbuy",0);     
            }
          if (OrderType() == 1 && OrderMagicNumber()==magic_number)
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), MarketInfo (OrderSymbol(), MODE_ASK), 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ",  GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
             GlobalVariableSet(Symbol()+"-Tradessell",0); 
            }   
         }
      }
   return(0);
  }
//+-----------------------------------------------------
//+-----------------------------------------------------
bool ButtonCreate (const long chart_ID = 0, const string name = "Button", const int sub_window = 0, const int x = 0, const int y = 0, const int width = 500,
                   const int height = 18, int corner = 0, const string text = "Button", const string font = "Arial Bold",
                   const int font_size = 10, const color clr = clrBlack, const color back_clr = White, const color border_clr = clrNONE,
                   const bool state = false, const bool back = false, const bool selection = false, const bool hidden = true, const long z_order = 0)
  {
   ResetLastError();
   if (!ObjectCreate (chart_ID,name, OBJ_BUTTON, sub_window, 0, 0))
     {
      Print (__FUNCTION__, ": Unable to create the button! Error code = ", GetLastError());
      return(false);
     }
   ObjectSetInteger (chart_ID, name, OBJPROP_XDISTANCE, x+10);
   ObjectSetInteger (chart_ID, name, OBJPROP_YDISTANCE, y+20);
   ObjectSetInteger (chart_ID, name, OBJPROP_XSIZE, width);
   ObjectSetInteger (chart_ID, name, OBJPROP_YSIZE, height);
   ObjectSetInteger (chart_ID, name, OBJPROP_CORNER, corner);
   ObjectSetInteger (chart_ID, name, OBJPROP_FONTSIZE, font_size);
   ObjectSetInteger (chart_ID, name, OBJPROP_COLOR, clr);
   ObjectSetInteger (chart_ID, name, OBJPROP_BGCOLOR, back_clr);
   ObjectSetInteger (chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
   ObjectSetInteger (chart_ID, name, OBJPROP_BACK, back);
   ObjectSetInteger (chart_ID, name, OBJPROP_STATE, state);
   ObjectSetInteger (chart_ID, name, OBJPROP_SELECTABLE, selection);
   ObjectSetInteger (chart_ID, name, OBJPROP_SELECTED, selection);
   ObjectSetInteger (chart_ID, name, OBJPROP_HIDDEN, hidden);
   ObjectSetInteger (chart_ID, name, OBJPROP_ZORDER,z_order);
   ObjectSetString  (chart_ID, name, OBJPROP_TEXT, text);
   ObjectSetString  (chart_ID, name, OBJPROP_FONT, font);
   return(true);
  }
//+-----------------------------------------------------
//+-----------------------------------------------------  
bool ButtonDelete (const long chart_ID = 0, const string name = "Button")
  {
   ResetLastError();
   if (!ObjectDelete (chart_ID,name))
     {
      Print (__FUNCTION__, ": Unable to delete the button! Error code = ", GetLastError());
      return(false);
     }
   return(true);
  }
  
//+--------------------------------------------
//+--------------------------------------------
int CloseAll()
  {   
   int ticket;
   if (OrdersTotal() == 0) return(0);
   for (int i = OrdersTotal() - 1; i >= 0; i--)
      {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
          if (OrderType() == 0 && OrderMagicNumber()==magic_number)
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), MarketInfo (OrderSymbol(), MODE_BID), 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ", GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
              
            }
          if (OrderType() == 1 && OrderMagicNumber()==magic_number)
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), MarketInfo (OrderSymbol(), MODE_ASK), 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ",  GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
              
            }   
         }
      }
   return(0);
  }
//+-----------------------------------------------------
//+-----------------------------------------------------    