//+------------------------------------------------------------------+
//|                                                   TROY EA.mq4 |
//|                                         Copyright 2021,5STAREA.COM.|
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "5STAREA.COM"
#property version "1.0"
#property link      "TROY EA"
#property strict

extern string Password = "Enter the password";

input string s1 = " OnlyForXAUUSD ";//CurrencyPairs



extern bool EnableLotMultiplier=false;
extern double LotMultiplier = 2.0;
//THis Lotsize is used if MM is false...
extern bool TradeClosingMechanism =true;
double Distance=13.0;
extern double TargetProfit=3.3;
extern int Max_OpenTradesAllowed=13;
extern bool ExtraSecurity=true;
extern double SLpips=0.0;
extern double TPpips=0.0;
//+------------------------------------------------------------------+

double slippage=5.0;// Slippage
extern double  FixedLotsize=0.1;
string text11="Money Management";//" "
bool MoneyManagement=false;
// Percentage of Account Balance you want to use in Lotsize Calculation
double AccountBalanceRiskPercent=2.0;
// Number of Digits after Decimal Point for each Calculated Lotsize
double LotDigits=2;
// Maximum Allowed Lotsize
double MaximumLotsizeEACanUse=333;
string SuffixForSpecialBrokers = NULL;
extern bool UseSLOnAllOpenTrades=false;
extern double SLPercentOfAccount=50.0;
extern int WaitingHoursAfterSLEnforced = 8;
extern double EquityProtectionLimit=0.0;
extern double Max_Spread=50.0;
//+------------------------------------------------------------------+
enum OrderUpdate
  {
   None=1,
   Trailing=2,
   Breakeven=3,
   Both=4
  };
OrderUpdate TradeSLMovementType=1;
double TrailingStop=53.0;
double BreakEven=33.0;
extern bool AlertSwitch=true;
extern int MagicNumber=737222;
extern string TradeComments="TROY EA";
extern string ExternalIndicator1 = "TROY 1";
extern string ExternalIndicator2 = "TROY 2";
//+------------------------------------------------------------------+
extern string text="Daily GMT Time Range "; // ""
extern int GMTofyourCountry = 5;
extern bool IsGMTPlus = true;
extern int Monday_Open_Hrs=1;
extern int Monday_closing_Hrs=23;
extern int Tuesday_Open_Hrs=1;
extern int Tuesday_closing_Hrs= 23;
extern int Wednesday_Open_Hrs = 1;
extern int Wednesday_closing_Hrs=23;
extern int Thursday_Open_Hrs=1;
extern int Thursday_closing_Hrs=23;
extern int Friday_Open_Hrs=1;
extern int Friday_closing_Hrs=23;
//------------------------------------------------------------
enum OrderKind
  {
   Buy=1,
   Sell=2,
   BothTrades=3
  };
extern OrderKind AllowedTrades=3;


int cbars=0,dist=24,p;
bool maxOrders,flag;
double spread,profit,loss,ModifiedStopLoss,StopLevel,point,
       digits,newTP,BreakEvenPrice,OrderCurrentPrice,latestTradePrice,prevTradeLotsize = 0.0;

static datetime hardstoplossHitTime = NULL;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

int four_digits_to_add_password=9526;
bool success = false;

int OnInit()
  {
   if(Period()!=15)
   {
   Alert("EA only works on M15");
   return(INIT_FAILED);
   }
    int acc_nu=AccountNumber();
   
   int last_four_digits=acc_nu % 10000;
   int pas=four_digits_to_add_password+last_four_digits;
  
   pas = pas + 3978;
   //Print("Key before "+Key);
   StringReplace(Password," ","");
   
   //Print("Key after "+Key);
   if(pas == Password)
   {
      success = true;
   }
   else
   {
      Alert("Please enter correct Key");
   }
   /*if(ObjectGetInteger(0,"METADOR EA",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15)==TRUE)
   //{
   success=true;
   }
   else 
   {
   Alert("The bot works on M15 only. Please install it on 15 minute timeframe!!");
   }*/
   if(success)
   {
   DrawBox("METADOR EA", clrBlack, clrWhite, 0, 255,25, 170);
   if(Digits==5 || Digits==3)
     {
      SLpips=SLpips*10;
      TPpips=TPpips*10;
      TrailingStop=TrailingStop*10;
      BreakEven=BreakEven*10;
      Max_Spread=Max_Spread*10;
      Distance=Distance*10;
     }
   SLPercentOfAccount = SLPercentOfAccount / 100.0;

   GMTofyourCountry = MathAbs(GMTofyourCountry);

   ResetLastError();
   PriceBorderSignal(3);
   if(GetLastError()==ERR_INDICATOR_CANNOT_LOAD)
     {
      Alert("Custom Indicator "+ ExternalIndicator1 +" Not Found, EA Terminated.");
      return(INIT_FAILED);
     }

   ResetLastError();
   GetHeichenAshiValue(true,3);
   if(GetLastError()==ERR_INDICATOR_CANNOT_LOAD)
     {
      Alert("Custom Indicator "+ ExternalIndicator2 +" Not Found, EA Terminated.");
      return(INIT_FAILED);
     }
   }
   return (INIT_SUCCEEDED);
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
int start()
  {
    
  if(success)
  {
  
   datetime countryTime;
   datetime incDate=datetime(StringFormat("1970.01.01 %d:00:00",GMTofyourCountry));
   if(IsGMTPlus)
     {
      countryTime = TimeGMT()+incDate;
     }
   else
     {
      countryTime = TimeGMT()-incDate;
     }
     color color_0;
   int Li_4 = 65280;
   if (AccountEquity() - AccountBalance() < 0.0) Li_4 = 255;
   if (Seconds() >= 0 && Seconds() < 10) color_0 = Red;
   if (Seconds() >= 10 && Seconds() < 20) color_0 = Violet;
   if (Seconds() >= 20 && Seconds() < 30) color_0 = Orange;
   if (Seconds() >= 30 && Seconds() < 40) color_0 = Blue;
   if (Seconds() >= 40 && Seconds() < 50) color_0 = Yellow;
   if (Seconds() >= 50 && Seconds() <= 59) color_0 = Aqua; 
   if(!IsTradeAllowed())
     {
      ObjectCreate(ChartID(),"tradingstatus",OBJ_LABEL,0,Time[3],High[3]);
      ObjectSet("tradingstatus",OBJPROP_CORNER,0);
      ObjectSet("tradingstatus",OBJPROP_COLOR,clrGold);
      ObjectSet("tradingstatus",OBJPROP_XDISTANCE,5);
      ObjectSet("tradingstatus",OBJPROP_YDISTANCE,40);
      ObjectSet("tradingstatus",OBJPROP_BACK,FALSE);
      ObjectSetText("tradingstatus","Auto Trading Disabled",15,FONT_ITALIC,clrGold);
     }
   else
     {
      ObjectCreate(ChartID(),"Name",OBJ_LABEL,0,Time[3],High[3]);
      ObjectSet("Name",OBJPROP_CORNER,0);
      ObjectSet("Name",OBJPROP_COLOR,clrGold);
      ObjectSet("Name",OBJPROP_XDISTANCE,5);
      ObjectSet("Name",OBJPROP_YDISTANCE,65);
      ObjectSet("Name",OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,"Name",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText("Name","Name: "+AccountName(),15,FONT_ITALIC,color_0);
     }

   if(UseSLOnAllOpenTrades && hardstoplossHitTime!=NULL && TimeCurrent()<=hardstoplossHitTime+(WaitingHoursAfterSLEnforced*60*60))
     {
      ObjectCreate(ChartID(),"Current Spread",OBJ_LABEL,0,0,0);
      ObjectSetText("Current Spread","Trading Terminated For "+WaitingHoursAfterSLEnforced+" Hours, Because SL Enforced.",13,FONT_ITALIC,clrGold);
      return(0);
     }
   else
     {
      spread=MarketInfo(Symbol(),MODE_SPREAD);
      ObjectCreate(ChartID(),"Current Spread",OBJ_LABEL,0,0,0);
      ObjectSet("Current Spread",OBJPROP_CORNER,0);
      ObjectSet("Current Spread",OBJPROP_COLOR,clrGold);
      ObjectSet("Current Spread",OBJPROP_XDISTANCE,5);
      ObjectSet("Current Spread",OBJPROP_YDISTANCE,145);
      ObjectSet("Current Spread",OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,"Current Spread",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText("Current Spread","Current Spread: "+spread,15,FONT_ITALIC,color_0);
     }
     
     string EA_Name="TROY EA";
      ObjectCreate(ChartID(),"EA_Name",OBJ_LABEL,0,0,0);
      ObjectSet("EA_Name",OBJPROP_CORNER,0);
      ObjectSet("EA_Name",OBJPROP_COLOR,color_0);
      ObjectSet("EA_Name",OBJPROP_XDISTANCE,5);
      ObjectSet("EA_Name",OBJPROP_YDISTANCE,40);
      ObjectSet("EA_Name",OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,"EA_Name",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText("EA_Name","EA_Name: "+EA_Name,15,FONT_ITALIC,color_0);
     
    
      ObjectCreate(ChartID(),"Broker",OBJ_LABEL,0,0,0);
      ObjectSet("Broker",OBJPROP_CORNER,0);
      ObjectSet("Broker",OBJPROP_COLOR,clrGold);
      ObjectSet("Broker",OBJPROP_XDISTANCE,5);
      ObjectSet("Broker",OBJPROP_YDISTANCE,95);
      ObjectSet("Broker",OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,"Broker",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText("Broker","Broker: "+AccountCompany(),15,FONT_ITALIC,color_0);
     
     ObjectCreate(ChartID(),"Pair",OBJ_LABEL,0,0,0);
      ObjectSet("Pair",OBJPROP_CORNER,0);
      ObjectSet("Pair",OBJPROP_COLOR,clrGold);
      ObjectSet("Pair",OBJPROP_XDISTANCE,5);
      ObjectSet("Pair",OBJPROP_YDISTANCE,170);
      ObjectSet("Pair",OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,"Pair",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText("Pair","Pair: "+Symbol(),15,FONT_ITALIC,color_0);
     
     ObjectCreate(ChartID(),"Balance",OBJ_LABEL,0,0,0);
      ObjectSet("Balance",OBJPROP_CORNER,0);
      ObjectSet("Balance",OBJPROP_COLOR,clrGold);
      ObjectSet("Balance",OBJPROP_XDISTANCE,5);
      ObjectSet("Balance",OBJPROP_YDISTANCE,120);
      ObjectSet("Balance",OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,"Balance",OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText("Balance","Balance: "+AccountBalance(),15,FONT_ITALIC,color_0);
     
     string Ls_8 = "-----------------";
     ObjectCreate(ChartID(),Ls_8,OBJ_LABEL,0,0,0);
      ObjectSet(Ls_8,OBJPROP_CORNER,0);
      ObjectSet(Ls_8,OBJPROP_XDISTANCE,5);
      ObjectSet(Ls_8,OBJPROP_YDISTANCE,25);
      ObjectSet(Ls_8,OBJPROP_COLOR,clrGold);
      ObjectSet(Ls_8,OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,Ls_8,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText(Ls_8,Ls_8 +Ls_8,15,FONT_ITALIC,color_0);
      
     string Ls_7 ="----------------";
     ObjectCreate(ChartID(),Ls_7,OBJ_LABEL,0,0,0);
      ObjectSet(Ls_7,OBJPROP_CORNER,0);
      ObjectSet(Ls_7,OBJPROP_COLOR,clrGold);
      ObjectSet(Ls_7,OBJPROP_XDISTANCE,5);
      ObjectSet(Ls_7,OBJPROP_YDISTANCE,52);
      ObjectSet(Ls_7,OBJPROP_BACK,FALSE);
      ObjectSetInteger(0,Ls_7,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
      ObjectSetText(Ls_7,Ls_7 +Ls_7,15,FONT_ITALIC,color_0);
   if(SaveHalfAccount())
     {
      Alert("EA is going to be Removed...Because Account Equity Becomes Low.");
      Alert("If you want to Restart EA...Make Sure you adjust Equity input parameter according to equity available.");
      ExpertRemove();
     }

// Hard Stop loss Logic
   if(UseSLOnAllOpenTrades && CalculateLossForClose())
     {
      flag=CloseAllOpenTrades(5,500);
      if(flag)
        {
         Alert("All Pairs Orders are closed successfully due to Hard Stop Loss Hit.");
        }
      else
        {
         Print("Check Manually that all Pairs Orders are Closed due to Hard Stop Loss Hit.");
        }
      Alert("EA stop Trading for "+WaitingHoursAfterSLEnforced+" Hours...Because Hard Stop Loss Hit.");
      hardstoplossHitTime = TimeCurrent();
     }

   if(TradeClosingMechanism)
     {
      profit=0;
      p=OrdersTotal()-1;
      for(int i=p; i>=0; i--)
        {
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
            profit=OrderProfit()+OrderSwap()+OrderCommission()+profit;
        }

      if(profit>=TargetProfit)
        {
         for(int i=0; i<OrdersTotal(); i++)
           {
            OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
            RefreshRates();
            if(OrderType()==OP_BUY && OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
               OrderClose(OrderTicket(),OrderLots(),Bid,3,Blue);
           }
        }
     }

// Check Total Opened Order of Robot currently
   maxOrders=CheckEAOpenedTrades();

   RefreshRates();
   double sig=iLowest(Symbol(),PERIOD_CURRENT,MODE_LOW,dist,0);
   if(spread<=Max_Spread && maxOrders && cbars!=Bars && PriceBorderSignal(1)==1
      && MathAbs(NormalizeDouble(latestTradePrice-Ask,Digits))>=(Distance*Point()) && CheckTiming(TimeHour(countryTime),TimeDayOfWeek(countryTime)))
     {
      if(!ExtraSecurity || sig==1)
        {
         placeBuyTrade();
         string AN="ArrBuy "+TimeToStr(TimeCurrent());
         ObjectCreate(AN,OBJ_ARROW,0,Time[1],Low[1]-6*Point,0,0,0,0);
         ObjectSet(AN,OBJPROP_ARROWCODE,233);
         ObjectSet(AN,OBJPROP_COLOR,Green);
        }
     }
   if(TradeClosingMechanism)
     {
      profit=0;
      p=OrdersTotal()-1;
      for(int i=p; i>=0; i--)
        {
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderType()==OP_SELL && OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
            profit=OrderProfit()+OrderSwap()+OrderCommission()+profit;
        }

      if(profit>=TargetProfit)
        {
         for(int i=0; i<OrdersTotal(); i++)
           {
            OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
            RefreshRates();
            if(OrderType()==OP_SELL && OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
               OrderClose(OrderTicket(),OrderLots(),Ask,3,Magenta);
           }
        }
     }
   sig=iHighest(Symbol(),PERIOD_CURRENT,MODE_HIGH,dist,0);
   if(spread<=Max_Spread && maxOrders && cbars!=Bars && PriceBorderSignal(-1)==-1
      && MathAbs(NormalizeDouble(latestTradePrice-Bid,Digits))>=(Distance*Point()) && CheckTiming(TimeHour(countryTime),TimeDayOfWeek(countryTime)))
     {
      if(!ExtraSecurity || sig==1)
        {
         placeSellTrade();
         string AN="ArrSell "+TimeToStr(TimeCurrent());
         ObjectCreate(AN,OBJ_ARROW,0,Time[1],High[1]+6*Point,0,0,0,0);
         ObjectSet(AN,OBJPROP_ARROWCODE,234);
         ObjectSet(AN,OBJPROP_COLOR,Red);
        }
     }
   cbars=Bars;
   AddTrailingAndBreakEven();
   
   }
   return(0);
  }
//+------------------------------------------------------------------+
bool placeBuyTrade()
  {
   int BuyTicket;
   double tp,ask,sl,GetStopLevel;

   if(AllowedTrades==1 || AllowedTrades==3)
     {
      GetStopLevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      if(SLpips==0.0)
        {
         sl=0.0;
        }
      else
        {
         sl=NormalizeDouble(Ask-((GetStopLevel+SLpips)*Point()),Digits);
        }
      BuyTicket=OrderSend(Symbol(),OP_BUY,SmartLotsize((MathAbs(Bid-sl))*(MathPow(10,Digits)),Symbol()),Ask,slippage,0.0,0.0,TradeComments,MagicNumber,0,clrAliceBlue);
      if(BuyTicket==-1)
        {
         int error=GetLastError();
         OrderFailedNotification(error);
         if(error==134 || error==131)
           {
            RefreshRates();
            BuyTicket=OrderSend(Symbol(),OP_BUY,FixedLotsize,Ask,slippage,0.0,0.0,TradeComments,MagicNumber,0,clrAliceBlue);
           }
         if(BuyTicket==-1)
           {
            OrderFailedNotification(GetLastError());
            return(false);
           }
         return(false);
        }
      else
        {
         Print("Buy Trade placed successfully...");
         if(OrderSelect(BuyTicket,SELECT_BY_TICKET))
           {
            RefreshRates();
            prevTradeLotsize = OrderLots();
            ask=OrderOpenPrice();
            if(TPpips==0.0)
              {
               tp=0.0;
              }
            else
              {
               tp=NormalizeDouble(ask+((GetStopLevel+TPpips)*Point()),Digits);
              }
            if(sl!=0.0 || tp!=0.0)
              {
               OrderModify(BuyTicket,ask,sl,tp,0);
              }
           }
         return(true);
        }
     }
   else
     {
      if(AlertSwitch)
        {
         Alert("Buy Trades are Disabled...");
        }
      else
        {
         Print("Buy Trades are Disabled...");
        }
      return(true);
     }
  }
//+------------------------------------------------------------------+
bool placeSellTrade()
  {
   int SellTicket;
   double tp,bid,sl,GetStopLevel;

   if(AllowedTrades==2 || AllowedTrades==3)
     {
      RefreshRates();
      GetStopLevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      if(SLpips==0.0)
        {
         sl=0.0;
        }
      else
        {
         sl=NormalizeDouble(Bid+((GetStopLevel+SLpips)*Point()),Digits);
        }
      SellTicket=OrderSend(Symbol(),OP_SELL,SmartLotsize((MathAbs(sl-Ask))*(MathPow(10,Digits)),Symbol()),Bid,slippage,0.0,0.0,TradeComments,MagicNumber,0,clrRed);
      if(SellTicket==-1)
        {
         int error=GetLastError();
         OrderFailedNotification(error);
         if(error==134 || error==131)
           {
            RefreshRates();
            SellTicket=OrderSend(Symbol(),OP_SELL,FixedLotsize,Bid,slippage,0.0,0.0,TradeComments,MagicNumber,0,clrRed);
           }
         if(SellTicket==-1)
           {
            OrderFailedNotification(GetLastError());
            return(false);
           }
         return(false);
        }
      else
        {
         Print("Sell Trade placed successfully..");
         if(OrderSelect(SellTicket,SELECT_BY_TICKET))
           {
            prevTradeLotsize = OrderLots();
            RefreshRates();
            bid=OrderOpenPrice();
            if(TPpips==0.0)
              {
               tp=0.0;
              }
            else
              {
               tp=NormalizeDouble(bid-((GetStopLevel+TPpips)*Point()),Digits);
              }
            if(sl!=0.0 || tp!=0.0)
              {
               OrderModify(SellTicket,bid,sl,tp,0);
              }
           }
         return(true);
        }
     }
   else
     {
      if(AlertSwitch)
        {
         Alert("Sell Trades are Disabled...");
        }
      else
        {
         Print("Sell Trades are Disabled...");
        }
      return(true);
     }
  }
//+------------------------------------------------------------------+
bool CheckEAAlteast1TradeOpened()
  {
   for(int j=0; j<OrdersTotal(); j++)
     {
      if(OrderSelect(j,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
           {
            return(true);
           }
        }
      else
        {
         Print("Order Selection Error at CheckEAAlteast1TradeOpened function.");
        }
     }
   return (false);
  }
//+------------------------------------------------------------------+
bool CheckEAOpenedTrades()
  {
   int count=0;
   datetime latestTime=NULL;
   for(int j=0; j<OrdersTotal(); j++)
     {
      if(OrderSelect(j,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
           {
            count++;
            // getting latest trade time just for checking pips difference in Tick method
            if(OrderOpenTime()>latestTime)
              {
               latestTime=OrderOpenTime();
               latestTradePrice=OrderOpenPrice();
              }
           }
        }
      else
        {
         Print("Order Selection Error at CheckEATrade function.");
        }
     }
   if(count<Max_OpenTradesAllowed)
     {
      return (true);
     }
   else
     {
      return (false);
     }
  }
//+------------------------------------------------------------------+
bool CalculateLossForClose()
  {
   loss=0.0;
   for(int j=0; j<OrdersTotal(); j++)
     {
      if(OrderSelect(j,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber()==MagicNumber && StringCompare(OrderSymbol(),Symbol())==0)
           {
            loss=loss+OrderProfit();
           }
        }
      else
        {
         Print("Order Selection Error at Close Open Order function.");
        }
     }
   if(loss<0.0 && MathAbs(loss)>=(AccountBalance()*SLPercentOfAccount))
     {
      return(true);
     }
   else
     {
      return(false);
     }
  }
//+------------------------------------------------------------------+
bool SaveHalfAccount()
  {
   RefreshRates();
   if(AccountEquity()<=EquityProtectionLimit)
     {
      flag=CloseAllOpenTrades(5,500);
      if(flag)
        {
         Print("All Orders are closed successfully due to Specified Maximum Loss.");
        }
      else
        {
         Print("Check Manually that all Orders are Closed due to Specified Maximum Loss.");
        }
      return(true);
     }
   return(false);
  }
//+------------------------------------------------------------------+
bool AddTrailingAndBreakEven()
  {
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS))
        {
         if(OrderMagicNumber()==MagicNumber && OrderSymbol()==Symbol())
           {
            // Trailing Stop
            if(TradeSLMovementType==2 || TradeSLMovementType==4)
              {
               if(OrderType()==OP_BUY)
                 {
                  RefreshRates();
                  StopLevel=MarketInfo(OrderSymbol(),MODE_STOPLEVEL);
                  point=MarketInfo(OrderSymbol(),MODE_POINT);
                  digits=MarketInfo(OrderSymbol(),MODE_DIGITS);
                  ModifiedStopLoss=NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID)-(point*(StopLevel+TrailingStop)),digits);
                  if((OrderStopLoss()!=0.0 && ModifiedStopLoss>OrderStopLoss()) || (OrderStopLoss()==0.0 && ModifiedStopLoss>OrderOpenPrice()))
                    {
                     if(OrderStopLoss()!=0.0 && OrderTakeProfit()!=0.0)
                       {
                        newTP=OrderTakeProfit()+(ModifiedStopLoss-OrderStopLoss());
                       }
                     else
                       {
                        newTP=MarketInfo(Symbol(),MODE_ASK)+(ModifiedStopLoss-OrderOpenPrice());
                       }
                     // Modify the Selected Buy Order
                     flag=OrderModify(OrderTicket(),OrderOpenPrice(),ModifiedStopLoss,OrderTakeProfit(),0);
                     if(flag)
                       {
                        Print("Buy Order Modified Successfully.");
                       }
                     else
                       {
                        Print("Error in Modifying Buy Order. ErrorCode: "+GetLastError());
                       }
                    }
                 }
               else
                  if(OrderType()==OP_SELL)
                    {
                     RefreshRates();
                     StopLevel=MarketInfo(OrderSymbol(),MODE_STOPLEVEL);
                     point=MarketInfo(OrderSymbol(),MODE_POINT);
                     digits=MarketInfo(OrderSymbol(),MODE_DIGITS);
                     ModifiedStopLoss=NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK)+(point*(StopLevel+TrailingStop)),digits);
                     if((OrderStopLoss()!=0.0 && ModifiedStopLoss<OrderStopLoss()) || (OrderStopLoss()==0.0 && ModifiedStopLoss<OrderOpenPrice()))
                       {
                        if(OrderStopLoss()!=0.0 && OrderTakeProfit()!=0.0)
                          {
                           newTP=OrderTakeProfit()-(OrderStopLoss()-ModifiedStopLoss);
                          }
                        else
                          {
                           newTP=MarketInfo(Symbol(),MODE_BID)-(OrderOpenPrice()-ModifiedStopLoss);
                          }
                        // Modify the Selected Sell Order
                        flag=OrderModify(OrderTicket(),OrderOpenPrice(),ModifiedStopLoss,OrderTakeProfit(),0);
                        if(flag)
                          {
                           Print("Sell Order Modified Successfully.");
                          }
                        else
                          {
                           Print("Error in Modifying Sell Order. ErrorCode: "+GetLastError());
                          }
                       }
                    }
              }
            // Break Even
            if(TradeSLMovementType==3 || TradeSLMovementType==4)
              {
               if(OrderType()==OP_BUY && (OrderStopLoss()==0.0 || OrderStopLoss()<OrderOpenPrice()))
                 {
                  RefreshRates();
                  StopLevel=MarketInfo(OrderSymbol(),MODE_STOPLEVEL);
                  point=MarketInfo(OrderSymbol(),MODE_POINT);
                  digits=MarketInfo(OrderSymbol(),MODE_DIGITS);
                  OrderCurrentPrice=NormalizeDouble((MarketInfo(OrderSymbol(),MODE_BID)-(StopLevel*point)),digits);
                  BreakEvenPrice=NormalizeDouble(OrderOpenPrice()+(point*(BreakEven)),digits);
                  if(OrderCurrentPrice>BreakEvenPrice)
                    {
                     // Modify the Selected Buy Order
                     flag=OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(),0);
                     if(flag)
                       {
                        Print("Buy Order Modified Successfully.");
                       }
                     else
                       {
                        Print("Error in Modifying Buy Order. ErrorCode: "+GetLastError());
                       }
                    }
                 }
               if(OrderType()==OP_SELL && (OrderStopLoss()==0.0 || OrderStopLoss()>OrderOpenPrice()))
                 {
                  RefreshRates();
                  StopLevel=MarketInfo(OrderSymbol(),MODE_STOPLEVEL);
                  point=MarketInfo(OrderSymbol(),MODE_POINT);
                  digits=MarketInfo(OrderSymbol(),MODE_DIGITS);
                  OrderCurrentPrice=NormalizeDouble((MarketInfo(OrderSymbol(),MODE_ASK)+(StopLevel*point)),digits);
                  BreakEvenPrice=NormalizeDouble(OrderOpenPrice()-(point*(BreakEven)),digits);
                  if(OrderCurrentPrice<BreakEvenPrice)
                    {
                     // Modify the Selected Buy Order
                     flag=OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice(),OrderTakeProfit(),0);
                     if(flag)
                       {
                        Print("Sell Order Modified Successfully.");
                       }
                     else
                       {
                        Print("Error in Modifying Sell Order. ErrorCode: "+GetLastError());
                       }
                    }
                 }
              }
           }
        }
      else
        {
         Print("Order Selection Error at AddTrailingAndBreakEven function.");
        }
     }
   return(true);
  }
//+------------------------------------------------------------------+
bool CloseAllOpenTrades(int tries,int pause)
  {
   bool result=true;

   for(int j=OrdersTotal()-1; j>=0; j--)
     {
      if(OrderSelect(j,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber()==MagicNumber && StringCompare(OrderSymbol(),Symbol())==0)
           {
            flag=false;
            for(int i=0; i<tries; i++)
              {
               RefreshRates();
               flag=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),slippage);

               if(flag)
                 {
                  break;
                 }
               else
                 {
                  Print("Error Code in Closing Order: "+GetLastError());
                  result=false;
                  Sleep(pause);
                  RefreshRates();
                  continue;
                 }
              }
           }
        }
      else
        {
         Print("Order Selection Error at Close Open Order function.");
         result=false;
        }
     }
   return (result);
  }
//+------------------------------------------------------------------+
int PriceBorderSignal(int signal)
  {
   double buysignalprice=NormalizeDouble(GetHeichenAshiValue(1,1)-6*Point,Digits);
   double sellsignalprice= NormalizeDouble(GetHeichenAshiValue(0,1)+6*Point,Digits);
   const double upperband=iCustom(Symbol(),PERIOD_CURRENT,ExternalIndicator1,1,1);
   const double lowerband=iCustom(Symbol(),PERIOD_CURRENT,ExternalIndicator1,2,1);
   if(!ExtraSecurity || (signal==1 && buysignalprice<lowerband))
     {
      if(GetHeichenAshiValue(1,1)<GetHeichenAshiValue(1,2) && GetHeichenAshiValue(3,1)<lowerband)
        {
         return(1);
        }
     }
   if(!ExtraSecurity || (signal==-1 && sellsignalprice>upperband))
     {
      if(GetHeichenAshiValue(0,1)>GetHeichenAshiValue(0,2) && GetHeichenAshiValue(3,1)>upperband)
        {
         return(-1);
        }
     }
   return(0);
  }
//+------------------------------------------------------------------+
double GetHeichenAshiValue(int signal,int bar)
  {
   const double high=iCustom(Symbol(),PERIOD_CURRENT,ExternalIndicator2,0,bar);
   const double low=iCustom(Symbol(),PERIOD_CURRENT,ExternalIndicator2,1,bar);
   const double open=iCustom(Symbol(),PERIOD_CURRENT,ExternalIndicator2,2,bar);
   const double close=iCustom(Symbol(),PERIOD_CURRENT,ExternalIndicator2,3,bar);

   if(signal==0) // 0 means High Price needed
     {
      if(open<close)
        {
         return(low); // Bullish Candle High Price
        }
      else
        {
         return(high); // Bearish Candle High Price
        }
     }
   else
      if(signal==1) // 1 means Low Price needed
        {
         if(open<close)
           {
            return(high); // Bullish Candle High Price
           }
         else
           {
            return(low); // Bearish Candle High Price
           }
        }
      else
         if(signal==2) // 2 means Open Price needed
           {
            return(open);
           }
         else // 3 means Close Price needed
           {
            return(close);
           }
  }
//+------------------------------------------------------------------+
bool CheckTiming(int hour,int day)
  {
   if(day==1)
     {
      return(hour>=Monday_Open_Hrs && hour<Monday_closing_Hrs);
     }
   else
      if(day==2)
        {
         return(hour>=Tuesday_Open_Hrs && hour<Tuesday_closing_Hrs);
        }
      else
         if(day==3)
           {
            return(hour>=Wednesday_Open_Hrs && hour<Wednesday_closing_Hrs);
           }
         else
            if(day==4)
              {
               return(hour>=Thursday_Open_Hrs && hour<Thursday_closing_Hrs);
              }
            else
               if(day==5)
                 {
                  return(hour>=Friday_Open_Hrs && hour<Friday_closing_Hrs);
                 }
   return(false);
  }
//+------------------------------------------------------------------+
double SmartLotsize(const double stoploss, const string symbol)
  {
//  sl coming in points in the currency format e.g 0.23453
   double minlot = MarketInfo(symbol, MODE_MINLOT);
   double maxlot = MarketInfo(symbol, MODE_MAXLOT);
   double lots;
   if(MoneyManagement)
     {
      // Lotsize calculation Formula Used in Robot
      lots=FixedLotsize;
      if(AccountBalanceRiskPercent!=0.0)
        {
         if(stoploss!=0)
           {
            // this division by 10 is converting stoploss in pips (actually it should be division by 100
            // because of risk is nnot divided by 100, so actually it is multiplying sl with 10)
            lots=NormalizeDouble(((((AccountBalance()/10.0)*AccountBalanceRiskPercent)/(currencyCalculations(symbol,SuffixForSpecialBrokers)*stoploss))),LotDigits);
           }
         else
           {
            lots=NormalizeDouble(AccountBalance()*AccountBalanceRiskPercent/100/1000.0,LotDigits);
            //Alert(lots);
           }
         if(lots<minlot)
           {
            lots=minlot;
           }
         else
            if(lots>maxlot)
              {
               lots=maxlot;
              }
         if(lots>MaximumLotsizeEACanUse)
           {
            lots=MaximumLotsizeEACanUse;
           }
        }
     }
   else
     {
      lots=NormalizeDouble(FixedLotsize,LotDigits);
     }
   if(EnableLotMultiplier && CheckEAAlteast1TradeOpened() && prevTradeLotsize>0.0)
     {
      lots = NormalizeDouble(prevTradeLotsize*LotMultiplier,2);
     }
   return(lots);
  }
//+------------------------------------------------------------------+
double currencyCalculations(const string symbol, const string suffix)
  {
   double value=10;
   double point = MarketInfo(symbol,MODE_POINT);
   string secondaryCurrency = SymbolInfoString(symbol,SYMBOL_CURRENCY_PROFIT);
   string baseCurrency = SymbolInfoString(symbol,SYMBOL_CURRENCY_BASE);
   string accountCurrency = AccountCurrency();
   double contractSize = MarketInfo(symbol,MODE_LOTSIZE);
   if(secondaryCurrency != accountCurrency)
     {
      if(iClose(secondaryCurrency+accountCurrency+suffix,PERIOD_CURRENT,0) > 0.0)
        {
         double rate = 1/(iClose(secondaryCurrency+accountCurrency+suffix,PERIOD_CURRENT,0));
         value = (value/rate)*(contractSize*point);
        }
      else
         if((baseCurrency == accountCurrency) && (iClose(secondaryCurrency+accountCurrency+suffix,PERIOD_CURRENT,0) > 0.0))
           {
            double rate = 1/(iClose(secondaryCurrency+accountCurrency+suffix,PERIOD_CURRENT,0));
            value = (value*rate)*(contractSize*point);
           }
         else
            if((baseCurrency == accountCurrency) && (iClose(accountCurrency+secondaryCurrency+suffix,PERIOD_CURRENT,0) > 0.0))
              {
               double rate = 1/(iClose(accountCurrency+secondaryCurrency+suffix,PERIOD_CURRENT,0));
               value = (value*rate)*(contractSize*point);
               // Alert(rate);
              }
            else
              {
               if((iClose(accountCurrency+secondaryCurrency+suffix,PERIOD_CURRENT,0) == 0.0))
                 {
                  if(iClose(accountCurrency+baseCurrency+suffix,PERIOD_CURRENT,0) > 0.0)
                    {
                     double rate = 1/iClose(baseCurrency+secondaryCurrency+suffix,PERIOD_CURRENT,0);
                     value = (value*rate)*(contractSize*point);
                     double conversion = 1/iClose(accountCurrency+baseCurrency+suffix,PERIOD_CURRENT,0);
                     value = (value*conversion);
                    }
                  else
                    {
                     double rate = 1/iClose(baseCurrency+secondaryCurrency+suffix,PERIOD_CURRENT,0);
                     value = (value*rate)*(contractSize*point);
                     double conversion = iClose(baseCurrency+accountCurrency+suffix,PERIOD_CURRENT,0);
                     value = (value*conversion);
                    }
                 }
               else
                 {
                  double rate = 1/(iClose(accountCurrency+secondaryCurrency+suffix,PERIOD_CURRENT,0));
                  value = (value*rate)*(contractSize*point);
                 }
              }
     }
   else
     {
      value = (value)*(contractSize*point);
     }
   return value;
  }
//+------------------------------------------------------------------+
bool OrderFailedNotification(int ErrorCode)
  {
   switch(ErrorCode)
     {
      case 4108:
         if(AlertSwitch)
           {
            Alert("Error: Invalid Ticket Number.");
           }
         else
           {
            Print("Error: Invalid Ticket Number.");
           }
         return (true);
         break;
      case 4109:
         if(AlertSwitch)
           {
            Alert("Error: Trade is not allowed. Enable checkbox 'Allow live trading' in EA properties.");
           }
         else
           {
            Print("Error: Trade is not allowed. Enable checkbox 'Allow live trading' in EA properties.");
           }
         return (true);
         break;
      case 4107:
         if(AlertSwitch)
           {
            Alert("Error: Invalid Price Parameter in Order Send.");
           }
         else
           {
            Print("Error: Invalid Price Parameter in Order Send.");
           }

         return (true);
         break;
      case 133:
         if(AlertSwitch)
           {
            Alert("Error: Trade Disabled or Market is closed.");
           }
         else
           {
            Print("Error: Trade Disabled or Market is closed.");
           }
         return (true);
         break;
      case 130:
         if(AlertSwitch)
           {
            Print("Error: Invalid Stops.");
           }
         else
           {
            Print("Error: Invalid Stops.");
           }
         return (true);
         break;
      case 129:
         if(AlertSwitch)
           {
            Print("Error: Invalid Price.");
           }
         else
           {
            Print("Error: Invalid Price.");
           }
         return (true);
         break;
      case 6:
         if(AlertSwitch)
           {
            Alert("Error: No connection with trade server.");
           }
         else
           {
            Print("Error: No connection with trade server.");
           }
         return (true);
         break;
      case 136:
         if(AlertSwitch)
           {
            Print("Error: Off quotes.");
           }
         else
           {
            Print("Error: Off quotes.");
           }
         return (true);
         break;
      case 141:
         if(AlertSwitch)
           {
            Alert("Error: Too Many Requests.");
           }
         else
           {
            Print("Error: Too Many Requests.");
           }
         return (true);
         break;
      case 132:
         if(AlertSwitch)
           {
            Alert("Markets are Closed.");
           }
         else
           {
            Print("Markets are Closed.");
           }
         return (true);
         break;
      case 138:
         if(AlertSwitch)
           {
            Alert("Error Requote.");
           }
         else
           {
            Print("Error Requote.");
           }
         return (true);
         break;
      case 134:
         if(AlertSwitch)
           {
            Alert("Not Enough Money For Placing New Trades.");
           }
         else
           {
            Print("Not Enough Money For Placing New Trades.");
           }
         return (true);
         break;
      case 4112:
         if(AlertSwitch)
           {
            Alert("Automated trading by Expert Advisors/Scripts disabled by trade server.");
           }
         else
           {
            Print("Automated trading by Expert Advisors/Scripts disabled by trade server.");
           }
         return (true);
         break;
      case 2:
         if(AlertSwitch)
           {
            Alert("Error: Common Network Disconnection.");
           }
         else
           {
            Print("Error: Common Network Disconnection.");
           }
         return (true);
         break;
      default:
         if(AlertSwitch)
           {
            Alert("ErrorCode: "+ErrorCode);
           }
         else
           {
            Print("ErrorCode: "+ErrorCode);
           }
     }
   return(false);
  }
//+------------------------------------------------------------------+
void DrawBox(string nm, color BackColor, color BorderColor, int x, int xsize, int y, int ysize)
{

if(!ObjectCreate(0, nm, OBJ_RECTANGLE_LABEL, 0, 1, 1, 1, 1))
{
Print(__FUNCTION__,
"failed to create rectangle! Error code: = ", GetLastError());
return;
}
ObjectCreate(0, nm, OBJ_RECTANGLE_LABEL, 0, 1, 1, 1, 1); // Create a label
ObjectSetInteger(0,nm,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15);
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