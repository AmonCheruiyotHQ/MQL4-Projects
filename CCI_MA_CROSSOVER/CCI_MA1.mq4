//+------------------------------------------------------------------+
//|                                                     Apply To.mq4 |
//|                                            Copyright 2021, ernst |
//|                             https://www.mql5.com/en/users/pippod |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, ernst"
#property link      "https://www.mql5.com/en/users/pippod"
#property version   "1.00"
#property strict
#property indicator_separate_window
#property indicator_buffers 2
#property indicator_plots   2
//--- plot RSI
#property indicator_label1  "MA"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrFireBrick
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//---
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrDodgerBlue
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
//--- input parameters
input int      MAPeriod=9;
 int      MAShift=0;
input ENUM_MA_METHOD MAMethod=MODE_SMA;
input int      CCIPeriod=14;
ENUM_APPLIED_PRICE CCIPrice=PRICE_TYPICAL;
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
//--- indicator buffers
double         MABuffer[];
double         IndBuffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   string name=StringFormat(" %s(%d)",StringSubstr(EnumToString(MAMethod),5),MAPeriod);
//--- indicator buffers mapping
   SetIndexBuffer(0,MABuffer);
   SetIndexShift(0,MAShift);
   SetIndexLabel(0,name);
   SetIndexDrawBegin(0,MAPeriod);
   SetIndexBuffer(1,IndBuffer);
   string name1=StringFormat("%s",StringSubstr(EnumToString(ApplyTo),9));
   SetIndexLabel(1,name1);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   if(ApplyTo==APPLY_TO_CCI)
     { 
      name1+=StringFormat("(%d)",CCIPeriod);
      SetIndexLabel(1,name1);
      IndicatorSetInteger(INDICATOR_DIGITS,0);
     }
   
   IndicatorSetString(INDICATOR_SHORTNAME,name1+name);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   int begin=(rates_total!=prev_calculated)?rates_total-prev_calculated-1:0;
//--- apply to CCI
   if(ApplyTo==APPLY_TO_CCI)
     { 
      for(int i=begin;i>=0;i--)
         IndBuffer[i]=iCCI(_Symbol,_Period,CCIPeriod,CCIPrice,i);
      for(int i=begin;i>=0;i--)
         MABuffer[i]=iMAOnArray(IndBuffer,rates_total,MAPeriod,0,MAMethod,i);
     }
//--- apply to price
   else
      for(int i=begin;i>=0;i--)
        { 
         IndBuffer[i]=iMA(_Symbol,_Period,1,0,MODE_SMA,(ENUM_APPLIED_PRICE)ApplyTo,i);
         MABuffer[i]=iMA(_Symbol,_Period,MAPeriod,0,MAMethod,(ENUM_APPLIED_PRICE)ApplyTo,i);
        }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
