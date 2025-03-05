//+-------------------------------------------------------------------------------------------------------------------------+
//|                                                 The Ultimate Indicator                                                  |
//|                                              Copyright 2021, Stewart Coad                                               |
//+-------------------------------------------------------------------------------------------------------------------------+
#property copyright                    "Copyright 2021, Stewart Coad."
#property link                         "stewartcoad@gmail.com"
#property version                      "201.001"
#property description                  "Dynamic Complex Wave Decoder"
#property strict
#property indicator_chart_window
#property indicator_buffers            3
#property indicator_plots              3
                                       //--- future model outputs
#property indicator_label1             "Modeled future"
#property indicator_type1              DRAW_LINE
#property indicator_color1             Red
#property indicator_style1             STYLE_SOLID
#property indicator_width1             1
                                       //--- past model outputs
#property indicator_label2             "Modeled past"
#property indicator_type2              DRAW_LINE
#property indicator_color2             Black
#property indicator_style2             STYLE_SOLID
#property indicator_width2             1
                                       //--- COMBINED PAST model outputs
#property indicator_label3             "Combined past"
#property indicator_type3              DRAW_LINE
#property indicator_color3             Red
#property indicator_style3             STYLE_DOT
#property indicator_width3             1

//+-------------------------------------------------------------------------------------------------------------------------+
//|                                                        Global Constant                                                  |
//+-------------------------------------------------------------------------------------------------------------------------+

#define   pi                           3.141592653589793238462643383279502884197169399375105820974944592
#define   LEFT                         188
#define   RIGHT                        190

//+-------------------------------------------------------------------------------------------------------------------------+
//|                                                        Indicator Inputs                                                 |
//+-------------------------------------------------------------------------------------------------------------------------+

input int    Anchor                    = 0;           // The past bar where TUI is to be anchored.
input string ___ ="";

input string WhichCyclesToBeSummed     = "";

input string CycleOne ="";
input int    InitialWaveLength1        = 0;          //
input bool   Cycle1                    = false;      //

input string CycleTwo ="";
input int    InitialWaveLength2        = 416;        //8 Year Aqua Cycle Wave Length is ?
input bool   Cycle2                    = true;       //Are we to Include Cycle 2 Aqua ?

input string CycleThree ="";
input int    InitialWaveLength3        = 104;        //2 Year Red Cycle Wave Length is ?
input bool   Cycle3                    = true;      //Are we to Include Cycle 3 Red ?
       
input string _  = " ";     
                
input string CycleFour ="";
input int    InitialWaveLength4        = 0;         //2 Quarters Magenta Cycle Wave Length is ?
input bool   Cycle4                    = false;       //Are we to Include Cycle 4 Magenta ?

input string CycleFive ="";
input int    InitialWaveLength5        = 0;         //2 Months SandyBrown Cycle WaveLength is ?
input bool   Cycle5                    = false;       //Are we to Include Cycle 5 SandyBrown ?

//+-------------------------------------------------------------------------------------------------------------------------+
//|                                                 Global Variables Definitions                                            |
//+-------------------------------------------------------------------------------------------------------------------------+
 
int  Nfut                              = Bars-1;      // Predicted future bars

bool   prediction1Enabled              = Cycle1;
bool   prediction2Enabled              = Cycle2;
bool   prediction3Enabled              = Cycle3;
bool   prediction4Enabled              = Cycle4;
bool   prediction5Enabled              = Cycle5;

//input string SECTION6 ="--- Add Cycles to the COMBINED Past? ---";

bool   AddCycle1                       = Cycle1;      //Add Cycle1 to COMBINED Past
bool   AddCycle2                       = Cycle2;      //Add Cycle2 to COMBINED Past
bool   AddCycle3                       = Cycle3;      //Add Cycle3 to COMBINED Past
bool   AddCycle4                       = Cycle4;      //Add Cycle4 to COMBINED Past
bool   AddCycle5                       = Cycle5;      //Add Cycle5 to COMBINED Past

int    Nharm                           = 1;           // Harmonics in model
double FreqTOL                         = 0.00000001;   // Tolerance of frequency calculations

int    Npast1                          = InitialWaveLength1;
int    Npast2                          = InitialWaveLength2;    
int    Npast3                          = InitialWaveLength3;  
int    Npast4                          = InitialWaveLength4;  
int    Npast5                          = InitialWaveLength5;  

int    N1, N2, N3, N4, N5;
int    candlesToIgnore                 = Anchor; //Number of candles to ignore for when doing shift back.

double outputPast[],outputFuture[],outputCOMBINED[];  //--- output indicator buffers

int    InitialBarCount                 = Bars;
int    NewBar                          = 0;

//+-------------------------------------------------------------------------------------------------------------------------+
//|                                               Custom indicator initialization function                                  |
//+-------------------------------------------------------------------------------------------------------------------------+

int OnInit()
  {
//--- initialize global variables
   N1=MathMax(Npast1,Nfut+1);
   N2=MathMax(Npast2,Nfut+1);
   N3=MathMax(Npast3,Nfut+1);
   N4=MathMax(Npast4,Nfut+1);
   N5=MathMax(Npast5,Nfut+1);

//--- indicator buffers mapping

   ArraySetAsSeries(outputFuture,true);
   ArraySetAsSeries(outputPast,true);
   ArraySetAsSeries(outputCOMBINED,true);
   SetIndexBuffer(0,outputFuture,INDICATOR_DATA);
   SetIndexBuffer(1,outputPast,INDICATOR_DATA);
   SetIndexBuffer(2,outputCOMBINED,INDICATOR_DATA);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   SetIndexShift(0,Nfut - candlesToIgnore);
   SetIndexShift(1,0 - candlesToIgnore);
   SetIndexShift(2,0 - candlesToIgnore);
   
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

if (NewBar == Bars)                   
    {
    return(0);
    }

NewBar =Bars;

if (Anchor == 0) {candlesToIgnore = 0;}

if (Bars > InitialBarCount)
    {
    candlesToIgnore = candlesToIgnore +1;             //Number of candles to ignore for when doing shift back.
    InitialBarCount = Bars; 
    SetIndexShift(0,Nfut - candlesToIgnore);
   SetIndexShift(1,0 - candlesToIgnore);
   SetIndexShift(2,0 - candlesToIgnore);
    }

   if(rates_total <= prev_calculated)
     {
      // If we don't have any new bars return immediately
      // return rates_total; This has been commented out as a temporaary solution to solving the shift back problem.
     }

   double xm1[]; // Array to store the Past values in for cycle 1
   double ym1[]; // Array to store the Future values in for cycle 1
   double xm2[]; // Array to store the Past values in for cycle 2
   double ym2[]; // Array to store the Future values in for cycle 2
   double xm3[]; // Array to store the Past values in for cycle 3
   double ym3[]; // Array to store the Future values in for cycle 3
   double xm4[]; // Array to store the Past values in for cycle 4
   double ym4[]; // Array to store the Future values in for cycle 4
   double xm5[]; // Array to store the Past values in for cycle 5
   double ym5[]; // Array to store the Future values in for cycle 5

   ArrayInitialize(outputFuture,EMPTY_VALUE);

   ArrayResize(xm1, N1);
   ArrayResize(ym1, N1);
   calculate(rates_total, Npast1, xm1, ym1, N1, candlesToIgnore);

   ArrayResize(xm2, N2);
   ArrayResize(ym2, N2);
   calculate(rates_total, Npast2, xm2, ym2, N2, candlesToIgnore);

   ArrayResize(xm3, N3);
   ArrayResize(ym3, N3);
   calculate(rates_total, Npast3, xm3, ym3, N3, candlesToIgnore);

   ArrayResize(xm4, N4);
   ArrayResize(ym4, N4);
   calculate(rates_total, Npast4, xm4, ym4, N4, candlesToIgnore);

   ArrayResize(xm5, N5);
   ArrayResize(ym5, N5);
   calculate(rates_total, Npast5, xm5, ym5, N5, candlesToIgnore);


// Prediction 1
   double prediction1DcOffset = calculateDcOffset(ym1);
   double prediction1Raw[];
   if(prediction1Enabled)
     {
      ArrayResize(prediction1Raw, ArraySize(ym1));
      removeDcOffset(ym1, prediction1Raw, prediction1DcOffset);
     }

//Prediction 2
   double prediction2DcOffset = calculateDcOffset(ym2);
   double prediction2Raw[];
   if(prediction2Enabled)
     {
      ArrayResize(prediction2Raw, ArraySize(ym2));
      removeDcOffset(ym2, prediction2Raw, prediction2DcOffset);
     }

//Prediction 3
   double prediction3DcOffset = calculateDcOffset(ym3);
   double prediction3Raw[];
   if(prediction3Enabled)
     {
      ArrayResize(prediction3Raw, ArraySize(ym3));
      removeDcOffset(ym3, prediction3Raw, prediction3DcOffset);
     }

//Prediction 4
   double prediction4DcOffset = calculateDcOffset(ym4);
   double prediction4Raw[];
   if(prediction4Enabled)
     {
      ArrayResize(prediction4Raw, ArraySize(ym4));
      removeDcOffset(ym4, prediction4Raw, prediction4DcOffset);
     }

//Prediction 5
   double prediction5DcOffset = calculateDcOffset(ym5);
   double prediction5Raw[];
   if(prediction5Enabled)
     {
      ArrayResize(prediction5Raw, ArraySize(ym5));
      removeDcOffset(ym5, prediction5Raw, prediction5DcOffset);
     }

// Store the current open price (adjusted for shift)
   double currentPrice = Open[0 + candlesToIgnore];

// Remove the DC offset from the past calculations
   double past1DcOffset = calculateDcOffset(xm1);
   double past1Raw[];
   ArrayResize(past1Raw, ArraySize(xm1));
   removeDcOffset(xm1, past1Raw, past1DcOffset);

   double past2DcOffset = calculateDcOffset(xm2);
   double past2Raw[];
   ArrayResize(past2Raw, ArraySize(xm2));
   removeDcOffset(xm2, past2Raw, past2DcOffset);

   double past3DcOffset = calculateDcOffset(xm3);
   double past3Raw[];
   ArrayResize(past3Raw, ArraySize(xm3));
   removeDcOffset(xm3, past3Raw, past3DcOffset);

   double past4DcOffset = calculateDcOffset(xm4);
   double past4Raw[];
   ArrayResize(past4Raw, ArraySize(xm4));
   removeDcOffset(xm4, past4Raw, past4DcOffset);

   double past5DcOffset = calculateDcOffset(xm5);
   double past5Raw[];
   ArrayResize(past5Raw, ArraySize(xm5));
   removeDcOffset(xm5, past5Raw, past5DcOffset);


   for(int i = 0; i <= Nfut; i++)
     {
      /*
       * Take the raw prediction values (prediction with DC offset removed)
       * of predictions 1-5 (4, 5 optional), calculate their slope by taking the current
       * raw value from the raw value of the first past cycle.
       * Finally add back in current price as the DC offset
       */

      double prediction1,
             prediction2,
             prediction3,
             prediction4,
             prediction5,
             PAST1=0,
             PAST2=0,
             PAST3=0,
             PAST4=0,
             PAST5=0;

      double sumOfPredictions = 0;

      // Calculate slope of the cycles
      if(prediction1Enabled)
        {
         prediction1 = prediction1Raw[i] - past1Raw[0];
         sumOfPredictions += prediction1;
        }

      if(prediction2Enabled)
        {
         prediction2 = prediction2Raw[i] - past2Raw[0];
         sumOfPredictions += prediction2;
        }

      if(prediction3Enabled)
        {
         prediction3 = prediction3Raw[i] - past3Raw[0];
         sumOfPredictions += prediction3;
        }

      if(prediction4Enabled)
        {
         prediction4 = prediction4Raw[i] - past4Raw[0];
         sumOfPredictions += prediction4;
        }

      if(prediction5Enabled)
        {
         prediction5 = prediction5Raw[i] - past5Raw[0];
         sumOfPredictions += prediction5;
        }

      // Add back in current price as the DC offset
      if(prediction1Enabled==false && prediction2Enabled==false && prediction3Enabled==false && prediction4Enabled==false && prediction5Enabled==false)
        {outputFuture[i]=EMPTY_VALUE;}
      else
        {outputFuture[i] = sumOfPredictions + currentPrice;}

      double sumOfPAST = 0;

      if(AddCycle1==true)
        {
         PAST1=past1Raw[i]-past1Raw[0];
         sumOfPAST=sumOfPAST+PAST1;
        }

      if(AddCycle2==true)
        {
         PAST2=past2Raw[i]-past2Raw[0];
         sumOfPAST=sumOfPAST+PAST2;
        }

      if(AddCycle3==true)
        {
         PAST3=past3Raw[i]-past3Raw[0];
         sumOfPAST=sumOfPAST+PAST3;
        }

      if(AddCycle4==true)
        {
         PAST4=past4Raw[i]-past4Raw[0];
         sumOfPAST=sumOfPAST+PAST4;
        }

      if(AddCycle5==true)
        {
         PAST5=past5Raw[i]-past5Raw[0];
         sumOfPAST=sumOfPAST+PAST5;
        }

      if(AddCycle1==false && AddCycle2==false && AddCycle3==false && AddCycle4==false && AddCycle5==false)
        {outputCOMBINED[i]=EMPTY_VALUE;}
      else
        {outputCOMBINED[i]=sumOfPAST + currentPrice;}

        {outputPast[i]=outputPast[i]+currentPrice;}
     }

   for(int i=N1; i<rates_total; i++)
     {
      outputPast[i] = EMPTY_VALUE;
     }

IndicatorSetString(INDICATOR_SHORTNAME,"TUI Version 2 for W1 set to " + string(Npast1) + ", " + string(Npast2)  +  ", " + string(Npast3)  +  ", " + string(Npast4) +  " and " + string(Npast5));

   return(rates_total);
  }

//+-------------------------------------------------------------------------------------------------------------------------+
//|                                     Quinn and Fernandes algorithm for finding frequency                                 |
//+-------------------------------------------------------------------------------------------------------------------------+
void Freq(double& x[],int n,double& w,double& m,double& a,double& b, double &xm[])
  {
   double z[];
   ArrayResize(z,n);
   double alpha=0.0;
   double beta=2.0;
   z[0]=x[0]-xm[0];
   while(MathAbs(alpha-beta)>FreqTOL)
     {
      alpha=beta;
      z[1]=x[1]-xm[1]+alpha*z[0];
      double num=z[0]*z[1];
      double den=z[0]*z[0];
      for(int i=2; i<n; i++)
        {
         z[i]=x[i]-xm[i]+alpha*z[i-1]-z[i-2];
         num+=z[i-1]*(z[i]+z[i-2]);
         den+=z[i-1]*z[i-1];
        }
      beta=num/den;
     }
   w=MathArccos(beta/2.0);
   TrigFit(x,n,w,m,a,b,xm);
  }
//+-------------------------------------------------------------------------------------------------------------------------+
//|                                       Least-squares fitting of trigonometric series                                     |
//+-------------------------------------------------------------------------------------------------------------------------+
void TrigFit(double& x[],int n,double w,double& m,double& a,double& b, double &xm[])
  {
   double Sc =0.0;
   double Ss =0.0;
   double Scc=0.0;
   double Sss=0.0;
   double Scs=0.0;
   double Sx =0.0;
   double Sxc=0.0;
   double Sxs=0.0;
   for(int i=0; i<n; i++)
     {
      double c=MathCos(w*i);
      double s=MathSin(w*i);
      double dx=x[i]-xm[i];
      Sc +=c;
      Ss +=s;
      Scc+=c*c;
      Sss+=s*s;
      Scs+=c*s;
      Sx +=dx;
      Sxc+=dx*c;
      Sxs+=dx*s;
     }
   Sc /=n;
   Ss /=n;
   Scc/=n;
   Sss/=n;
   Scs/=n;
   Sx /=n;
   Sxc/=n;
   Sxs/=n;
   if(w==0.0)
     {
      m=Sx;
      a=0.0;
      b=0.0;
     }
   else
     {
      // calculating a, b, and m
      double den=MathPow(Scs-Sc*Ss,2)-(Scc-Sc*Sc)*(Sss-Ss*Ss);
      a=((Sxs-Sx*Ss)*(Scs-Sc*Ss)-(Sxc-Sx*Sc)*(Sss-Ss*Ss))/den;
      b=((Sxc-Sx*Sc)*(Scs-Sc*Ss)-(Sxs-Sx*Ss)*(Scc-Sc*Sc))/den;
      m=Sx-a*Sc-b*Ss;
     }
  }

/**
 * Calculate the QF history/predictions.
 *
 * @param rates_total No idea
 * @param Npast possibly the number of past candles to predict
 * @param xm[] the array the past output will be copied into
 * @param ym[] the array the future output will be copied into
 * @param N not sure, possibly something to do with number of future candles to lok at
 * @param startPosition where to start looking back at the rates. 0 is the current candle
 *    100 is from 99 candles ago etc.
 * @return just the value of rates_total
 */
int calculate(int rates_total, int Npast, double &xm[], double &ym[], int N, int startPosition)
  {
//---
// Check for insufficient data
   if(rates_total < Npast)
     {
      Print("Error: not enough bars in history!");
      return(0);
     }

//--- initialize indicator buffers to EMPTY_VALUE
   ArrayInitialize(xm,EMPTY_VALUE);
   ArrayInitialize(ym,EMPTY_VALUE);

//--- make all prices available
   MqlRates rates[];
   ArraySetAsSeries(rates,true);

   if(CopyRates(NULL, 0, startPosition, Npast, rates) <= 0)
     {
      return(0);
     }

//--- main cycle
//--- prepare input data
   double x[];
   ArrayResize(x,Npast);
   double av = 0;
   for(int i = 0; i < Npast; i++)
     {
      x[i] = rates[i].open;
      av += x[i];
     }

   av /= Npast;

//--- initialize model outputs
   for(int i = 0 ; i < N; i++)
     {
      xm[i] = av;

      if(i <= Nfut)
        {
         ym[i] = av;
        }
     }

//--- fit trigonometric model and calculate predictions
   for(int harm = 1; harm <= Nharm; harm++)
     {
      double w,m,a,b;

      Freq(x,Npast,w,m,a,b,xm);

      w = 2*pi/Npast; // Added Mahdi fix

      for(int i = 0; i < N; i++)
        {
         xm[i] += m + a * MathCos(w * i) + b * MathSin(w *i);

         if(i <= Nfut)
           {
            ym[Nfut - i] += m + a * MathCos(w * i) - b * MathSin(w * i);
           }

        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
// Calculate amplitude of an input sine wave
double calculateAmplitude(double& inputData[])
  {
   if(ArraySize(inputData) == 0)
     {
      // Array is empty so just return 0
      return 0;
     }

   double highest = 0;

// Set to an artificially high number to start
   double lowest = 1000000;

   for(int i = 0; i < ArraySize(inputData); i++)
     {
      highest = MathMax(highest, inputData[i]);
      lowest = MathMin(lowest, inputData[i]);
     }

   if(highest + lowest == 0)
     {
      // Input data doesn't appear to be a sine wave
      return 0;
     }

   return highest - lowest;
  }

//+------------------------------------------------------------------+
// Calculate the DC offset (zero crossing point) for an input sine wave
double calculateDcOffset(double& inputData[])
  {
   if(ArraySize(inputData) == 0)
     {
      // Array is empty so just return 0
      return 0;
     }

   double highest = 0;

// Set to an artificially high number to start
   double lowest = 1000000;

   for(int i = 0; i < ArraySize(inputData); i++)
     {
      highest = MathMax(highest, inputData[i]);
      lowest = MathMin(lowest, inputData[i]);
     }

   if(highest + lowest == 0)
     {
      // Input data doesn't appear to be a sine wave
      return 0;
     }

   return (highest + lowest) / 2;
  }

//+------------------------------------------------------------------+
double calculateAmplitudeCorrectionFactor(int rates_total, int pastBars, int multiplyer)
  {

   /*
    * Apply the QF algorithm progressively to the number of past bars
    * past bars * multipliyer number of times.
    * E.g. 100 past bars and 4 multiplyer = calculate the amplitude of
    * 0 - 99, then 1-100, then 2-101 ... to 400-499
    */
   double sumOfAmplitudes = 0;
   double currentCycleAmplitude = 0;

   for(int i = 0; i < (pastBars * multiplyer); i++)
     {
      double pastPrediction[];
      double futurePrediction[];

      int N = MathMax(pastBars, Nfut+1);

      ArrayResize(pastPrediction, N);
      ArrayResize(futurePrediction, N);

      calculate(rates_total, pastBars, pastPrediction, futurePrediction, N, i);

      double amplitude = calculateAmplitude(pastPrediction);

      sumOfAmplitudes += amplitude;

      if(i == 0)
        {
         // Store the amplitude of the cycle calculated on the current rates
         currentCycleAmplitude = amplitude;
        }
     }

// Average amplitude of all cycles
   double averageAmplitude = sumOfAmplitudes / (pastBars * multiplyer);

// Correction factor based on current cycle vs average
   double correctionFactor = currentCycleAmplitude / averageAmplitude;

   return correctionFactor;
  }

//+------------------------------------------------------------------+
void removeDcOffset(double& inputData[], double& outputData[], double dcOffset)
  {
   for(int i = 0; i < ArraySize(inputData); i++)
     {
      outputData[i] = inputData[i] - dcOffset;
     }
  }

//+------------------------------------------------------------------+
void applyCorrectionFactor(double& inputData[], double correctionFactor)
  {
   for(int i = 0; i < ArraySize(inputData); i++)
     {
      inputData[i] = inputData[i] * correctionFactor;
     }
  }

//+-------------------------------------------------------------------------------------------------------------------------+
//|                                                        Chart EventFunction                                              |
//| This function is to shift the decoding point for the cycles into the past. This allows us to look at the prediction and |
//| comp[are it against what actually happened. The starting postion is sent back into the past by The Left arrow on the    |
//| keyboard and moved foward by the right arrow on the keyboard.                                                           |
//|-------------------------------------------------------------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event identifier
                  const long& lparam,   // Event parameter of long type
                  const double& dparam, // Event parameter of double type
                  const string& sparam) // Event parameter of string type
  {
//--- the key has been pressed
   if(id==CHARTEVENT_KEYDOWN)
     {
      switch(int(lparam))
        {
         case LEFT:
            candlesToIgnore++;
            candlesToIgnore=MathMax(candlesToIgnore,0);
            SetIndexShift(0,Nfut - candlesToIgnore);
            SetIndexShift(1,0 - candlesToIgnore);
            SetIndexShift(2,0 - candlesToIgnore);
            break;
         case RIGHT:
            candlesToIgnore--;
            candlesToIgnore=MathMax(candlesToIgnore,0);
            SetIndexShift(0,Nfut - candlesToIgnore);
            SetIndexShift(1,0 - candlesToIgnore);
            SetIndexShift(2,0 - candlesToIgnore);
            break;
        }
      Comment("Current Shift is " + IntegerToString(candlesToIgnore));
      ChartRedraw();
     }
  }


//+-------------------------------------------------------------------------------------------------------------------------+
//|                                                End of on caluclate Function                                             |
//+-------------------------------------------------------------------------------------------------------------------------+