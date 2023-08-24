
#property copyright "Copyright © 2009, primajaya"
#property link      ""

//---- input parameters
extern int       TP           = 20;
extern int       SL           = 15;
extern int       RangePoint   = 10;
extern int       AddPoint     = 10;// add point to place stop order  [high+AddPoint] and [low-AddPoint]
extern double    LotSize      = 1;
extern int       MagicNumber  = 123456789;
extern bool      DelOpposite = false;
extern int       MoveToBEP_After = 15; // if 0, no BEP
extern int       LockProfit = 1;
extern int       TrailingStop = 30;// if 0, no Trailing Stop

#define slip 2
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----
   double stoplevel = MarketInfo(Symbol(),MODE_STOPLEVEL)*point();
   double tik = iVolume(NULL,0,0);
   int exp = TimeCurrent() + (Period()*59);
   double buyPrice, sellPrice;
   
   if(High[1]-Ask < stoplevel) buyPrice = Ask + RangePoint*point();
   else buyPrice = High[1] + AddPoint*point();
   
   if(Bid-Low[1] < stoplevel) sellPrice = Bid - RangePoint*point();
   else sellPrice = Low[1] - AddPoint*point();
   
   
   if(OrdersTotal() == 0)
   {
      if(tik <= 3)
      {
         openOrder(Symbol(), OP_BUYSTOP,LotSize,buyPrice,buyPrice-SL*point(), buyPrice+TP*point(),"_Buy_",MagicNumber,exp,Navy);
         openOrder(Symbol(), OP_SELLSTOP,LotSize,sellPrice,sellPrice+SL*point(), sellPrice-TP*point(),"_Sell_",MagicNumber,exp,Crimson);   
      }   
   }
   
   if(OrdersTotal() == 2)
   {
      for (int i=0;i<OrdersTotal();i++)
      {
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol())
         {
            if(OrderMagicNumber()==MagicNumber)
            {
               if(DelOpposite)
               {
                  if(OrderType()==OP_BUY) delPending(OP_SELLSTOP,MagicNumber);
                  if(OrderType()==OP_SELL) delPending(OP_BUYSTOP,MagicNumber);
               }
            }
         
         }
      }
   
   }
   
   if(OrdersTotal() > 0)
   {
      if(MoveToBEP_After>0) BEP();
      if(TrailingStop>0) TS();
   }   
//----
   return(0);
  }
//+------------------------------------------------------------------+

void openOrder(string simbol, int trade, double lotsize, double price, double sl, double tp,string pesan, int magic, int exp, color warna) 
{                     
  int tiket=OrderSend(simbol,trade,lotsize,price,slip,sl,tp,pesan,magic,exp,warna);                              
      if(tiket>0)
      {  
         if(OrderSelect(tiket,SELECT_BY_TICKET,MODE_TRADES)) OrderPrint(); 
      }
         else Print("Cannot send order because of : ",GetLastError());        
}

void delPending(int trade, int MagicNumber)
{  
    for(int i=0;i<OrdersTotal();i++)
    {
       OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
       if(OrderType()==trade)
       { 
         if(OrderMagicNumber()==MagicNumber) OrderDelete(OrderTicket(),CLR_NONE);
       }  
    }   
}

double point()
{
   double p;
   if(Digits==5 || Digits==3) p = Point*10;
   else p = Point;
   
   return(p);
}

void BEP()
{
      for (int i = 0; i < OrdersTotal(); i++)
      {
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
         {
            if(OrderType()==OP_BUY)
            {
               if(Bid-OrderOpenPrice() > point()*MoveToBEP_After)
               {
                  if(OrderStopLoss()<OrderOpenPrice())
                  {
                     OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()+point()*LockProfit,OrderTakeProfit(),0,CLR_NONE);
                     return(0);
                  }
               }
            }
         
            if(OrderType()==OP_SELL)
            {
               if(OrderOpenPrice()-Ask > point()*MoveToBEP_After)
               {
                  if(OrderStopLoss()>OrderOpenPrice())
                  {
                     OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-point()*LockProfit,OrderTakeProfit(),0,CLR_NONE);
                     return(0);
                  }
               }      
            }
         } 
      }   
}

void TS()
{
 for (int i = 0; i < OrdersTotal(); i++)
      {
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
         {
            if(OrderType()==OP_BUY)
            {
               if(Bid-OrderOpenPrice()>point()*TrailingStop)
               {
                  if(OrderStopLoss()<Bid-point()*TrailingStop || (OrderStopLoss()==0))
                  {
                     OrderModify(OrderTicket(),OrderOpenPrice(),Bid-point()*TrailingStop,OrderTakeProfit(),0,CLR_NONE);
                     return(0);
                  }
               }
            }
         
            if(OrderType()==OP_SELL)
            {
               if((OrderOpenPrice()-Ask)>(point()*TrailingStop))
               {
                  if((OrderStopLoss()>(Ask+point()*TrailingStop)) || (OrderStopLoss()==0))
                  {
                     OrderModify(OrderTicket(),OrderOpenPrice(),Ask+point()*TrailingStop,OrderTakeProfit(),0,CLR_NONE);
                     return(0);
                  }
               }      
            }
         } 
      
      }   
}