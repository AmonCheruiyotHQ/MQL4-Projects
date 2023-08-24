//+------------------------------------------------------------------+
//|                                                       CCI_MA.mq4 |
//|                      Copyright © 2009, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2009, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_separate_window
#property indicator_buffers 2
#property indicator_color1 Red
#property indicator_color2 Yellow
#property indicator_level1 -150000
#property indicator_level2 150000
 
//---- input parameters
extern int cci_p = 21;
extern int ma = 27;
extern int NumberOfBarsToCalculate = 10000;
 
//---- indicator buffers
double Buffer0[];
double Buffer1[];
double Ma[];
double Cci[];
 
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
  int init()
  {
   Comment("");
   IndicatorBuffers(4);
//---- indicator line
   SetIndexStyle(0,DRAW_LINE,STYLE_SOLID,2);
   SetIndexStyle(1,DRAW_LINE,STYLE_SOLID,2);
   SetIndexStyle(2,DRAW_NONE);
   SetIndexStyle(3,DRAW_NONE);
 
   SetIndexBuffer(0,Buffer0);
   SetIndexBuffer(1,Buffer1);
   SetIndexBuffer(2,Ma);
   SetIndexBuffer(3,Cci);
   
 
   IndicatorDigits(MarketInfo(Symbol(),MODE_DIGITS));
//----
 
   SetIndexEmptyValue(0,0);
   SetIndexEmptyValue(1,0);
   SetIndexEmptyValue(2,0);
   SetIndexEmptyValue(3,0);
//----
   return(0);
  }
 
 
int start() {
      string short_name;
      short_name = "CCI["+cci_p+"] \ MA => Max bars to count: |"+(Bars-1)+"| ";
      IndicatorShortName(short_name);
 
      int shift;
      double cci = 0;
      for(shift=NumberOfBarsToCalculate-1;shift>=0;shift--){
         Cci[shift] = iCCI(NULL,0,cci_p,PRICE_CLOSE,shift);    
         }
      for(shift=NumberOfBarsToCalculate-1;shift>=0;shift--){
         Ma[shift] = iMAOnArray(Cci,0,ma,0,MODE_EMA,shift);
         Buffer0[shift] = Cci[shift];
         Buffer1[shift] = Ma[shift];
         }

      return(0);
}

