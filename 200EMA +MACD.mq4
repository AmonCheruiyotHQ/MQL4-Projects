//+------------------------------------------------------------------+
//|                                                 200EMA +MACD.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
extern double Lotsize=0.01;
extern int MaxTrade=1;
extern int MagicNumber=12345; 
extern string EAName=" 200EMA + MACD";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
ObjectsDeleteAll();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void start()
  {
//---
   double MyMovingAvarage=iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,0); //moving avarage indicator TO DETERMINER long and short positions
   double MacdCurrent=iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
   double MacdPrevious=iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1);
   double SignalCurrent=iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
   double SignalPrevious=iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1);
  
   
      //--- check for long position (BUY) possibility
         //+------------------------------------------------------------------+ 
         //| BUY                      BUY                 BUY                 |
         //+------------------------------------------------------------------+
   if(MacdCurrent>SignalCurrent && MacdPrevious<SignalPrevious && MacdCurrent>0 && MyMovingAvarage<Bid && OrdersTotal()<=MaxTrade)
   {
      OrderBuy(); //BUY ORDER PLACEMENT FUNCTION
      }
      //--- check for short position (SELL) possibility
         //+------------------------------------------------------------------+
         //| SELL             SELL                       SELL                 |
         //+------------------------------------------------------------------+
    if(MacdCurrent<SignalCurrent && MacdPrevious>SignalPrevious && MacdCurrent<0 && MyMovingAvarage>Ask && OrdersTotal()<=MaxTrade)
   {
      OrderSell(); //SELL ORDER PLACEMENT FUNTION
      }
      
   
   
  }
//+------------------------------------------------------------------+
int OrderBuy()
   {
      double StopLoss=Low[iLowest(NULL,0,MODE_LOW,50,0)]; //setting stoploss to the most recent swing low
      double TakeProfit= OrderOpenPrice() + (2* (MathAbs(OrderOpenPrice()-StopLoss))); /*/setting the taake profit according
                                                                                           to risk to reward ratio os 2:1*/
      int ticket = OrderSend(Symbol(), OP_BUY, LotsOptimized(), Ask, 3, StopLoss, 
                               TakeProfit, EAName, MagicNumber,0,clrGreen);
            if(ticket > 0)
              {
                if(OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES)) 
                    Print("BUY order opened : ",OrderOpenPrice());
              }
             
            return(0);
      }
      
//----------------------------------------------------------------------
int OrderSell()
   {
      
      double StopLoss= High[iHighest(NULL,0,MODE_HIGH,50,0)]; //setting the stop loss to the most recent swing high
      double TakeProfit=OrderOpenPrice() - (2* (MathAbs(OrderOpenPrice()-StopLoss))); /*/setting the taake profit according
                                                                                           to risk to reward ratio os 2:1*/
      
      int ticket = OrderSend(Symbol(), OP_SELL, LotsOptimized(), Bid, 3, StopLoss, 
                               TakeProfit,EAName, MagicNumber, 0, clrRed);
            if(ticket > 0)
              {
                if(OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES)) 
                    Print("SELL order opened : ",OrderOpenPrice());
              }
             
            return(0);
    }
    
//+------------------------------------------------------------------+
//| Calculate optimal lot size                                       |
//+------------------------------------------------------------------+
double LotsOptimized()
  {
   double lot=Lotsize;                 
//--- minimal allowed volume for trade operations
   double minlot=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   if(lot<minlot)
     { lot=minlot; }
// Print("Volume is less than the minimal allowed ,we use",minlot);}
// lot=minlot;

//--- maximal allowed volume of trade operations
   double maxlot=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
   if(lot>maxlot)
     { lot=maxlot;  }
//  Print("Volume is greater than the maximal allowed,we use",maxlot);}
// lot=maxlot;
   return(lot);
 }