#property copyright "Copyright © 2013 Martins Evans Trading"
#property link      "http://www.binarycomodo.com"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Green
#property indicator_color2 Red

double G_ibuf_76[];
double G_ibuf_80[];
extern int FasterEMA = 5;
extern int SlowerEMA = 200;
extern int RSIPeriod = 12;
extern bool Alerts = TRUE;
bool Gi_100 = FALSE;
bool Gi_104 = FALSE;
bool Gi_108 = FALSE;
bool Gi_112 = FALSE;
int Gi_116 = 0;
bool Gi_120 = FALSE;
bool Gi_124 = FALSE;

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   SetIndexStyle(0, DRAW_ARROW, EMPTY);
   SetIndexArrow(0, SYMBOL_ARROWUP);
   SetIndexBuffer(0, G_ibuf_76);
   SetIndexStyle(1, DRAW_ARROW, EMPTY);
   SetIndexArrow(1, SYMBOL_ARROWDOWN);
   SetIndexBuffer(1, G_ibuf_80);
   return (0);
}

// 52D46093050F38C27267BCE42543EF60
int deinit() {
   return (0);
}

// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   int Li_8;
   double ima_12;
   double ima_20;
   double ima_28;
   double ima_36;
   double ima_44;
   double ima_52;
   double irsi_60;
   double irsi_68;
   double irsi_76;
   double Ld_84;
   double Ld_92;
   int Li_100 = IndicatorCounted();
   if (Li_100 < 0) return (-1);
   if (Li_100 > 0) Li_100--;
   int Li_0 = Bars - Li_100;
   for (int Li_4 = 0; Li_4 <= Li_0; Li_4++) {
      Li_8 = Li_4;
      Ld_84 = 0;
      Ld_92 = 0;
      for (Li_8 = Li_4; Li_8 <= Li_4 + 9; Li_8++) Ld_92 += MathAbs(High[Li_8] - Low[Li_8]);
      Ld_84 = Ld_92 / 10.0;
      ima_12 = iMA(NULL, 0, FasterEMA, 0, MODE_EMA, PRICE_CLOSE, Li_4);
      ima_28 = iMA(NULL, 0, FasterEMA, 0, MODE_EMA, PRICE_CLOSE, Li_4 + 1);
      ima_44 = iMA(NULL, 0, FasterEMA, 0, MODE_EMA, PRICE_CLOSE, Li_4 - 1);
      ima_20 = iMA(NULL, 0, SlowerEMA, 0, MODE_EMA, PRICE_CLOSE, Li_4);
      ima_36 = iMA(NULL, 0, SlowerEMA, 0, MODE_EMA, PRICE_CLOSE, Li_4 + 1);
      ima_52 = iMA(NULL, 0, SlowerEMA, 0, MODE_EMA, PRICE_CLOSE, Li_4 - 1);
      irsi_60 = iRSI(NULL, 0, RSIPeriod, PRICE_CLOSE, Li_4);
      irsi_68 = iRSI(NULL, 0, RSIPeriod, PRICE_CLOSE, Li_4 + 1);
      irsi_76 = iRSI(NULL, 0, RSIPeriod, PRICE_CLOSE, Li_4 - 1);
      if (irsi_60 > 50.0 && irsi_68 < 50.0 && irsi_76 > 50.0) {
         Gi_104 = TRUE;
         Gi_112 = FALSE;
      }
      if (irsi_60 < 50.0 && irsi_68 > 50.0 && irsi_76 < 50.0) {
         Gi_104 = FALSE;
         Gi_112 = TRUE;
      }
      if (ima_12 > ima_20 && ima_28 < ima_36 && ima_44 > ima_52) {
         Gi_100 = TRUE;
         Gi_108 = FALSE;
      }
      if (ima_12 < ima_20 && ima_28 > ima_36 && ima_44 < ima_52) {
         Gi_100 = FALSE;
         Gi_108 = TRUE;
      }
      if (Gi_100 == TRUE && Gi_104 == TRUE && Gi_116 != 1) {
         G_ibuf_76[Li_4] = Low[Li_4] - 1.3 * Ld_84;
         if (Li_4 <= 2 && Alerts && (!Gi_120)) {
            Alert(Symbol(), " ", Period(), "  BinaryComodo Signal:CALL NOW! 15mins");
            Gi_120 = TRUE;
            Gi_124 = FALSE;
         }
         Gi_116 = 1;
      } else {
         if (Gi_108 == TRUE && Gi_112 == TRUE && Gi_116 != 2) {
            G_ibuf_80[Li_4] = High[Li_4] + 1.3 * Ld_84;
            if (Li_4 <= 2 && Alerts && (!Gi_124)) {
               Alert(Symbol(), " ", Period(), "   BinaryComodo Signal:PUT NOW! 15Mins ");
               Gi_124 = TRUE;
               Gi_120 = FALSE;
            }
            Gi_116 = 2;
         }
      }
   }
   return (0);
}
