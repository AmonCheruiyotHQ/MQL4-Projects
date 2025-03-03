#property copyright "Shitla.com";
#property link "https://www.Shitla.com/";
#property version "V1.0";
#property strict
#property description " sucess is awating";

struct MTLicenseInfo
{
public:
   bool m_0;
   string m_1;
   string m_13;
   string m_25;
   string m_37;
   int m_49;
   int m_53;
   int m_57;
   int m_61;
   int m_65;
   int m_69;
   string m_73;
   string m_85;
};

#import "AMMLib.ex4"
void MTLic_CheckLicense(MTLicenseInfo&);
string MTLic_GetLicense(string, string, string, string, string);

#import "user32.dll"
int PostMessageW(int, int, int, int);
int GetAncestor(int, int);
#import

enum ENUM_LOT_MODE
{
   LOT_MODE_FIXED = 1, // Fixed Lot
   LOT_MODE_PERCENT = 2 // Percent Lot
};

enum ENUM_TYPE_GRID_LOT
{
   fix_lot = 0, // Fixed Start Lot 0.01 / 0.01 / 0.01 / 0.01 / 0.01 /.............
   Summ_lot = 1, // Summ Sart Lot   0.01 / 0.02 / 0.03 / 0.04 / 0.05 /.............
   Martingale = 2, // Martingale Lot  0.01 / 0.02 / 0.04 / 0.08 / 0.16 /.............
   Step_lot = 3 // Step Lot        0.01 / 0.01 / 0.01 / 0.02 / 0.02 / 0.02 / 0.03 
};

extern string LicenseKey;
extern string Version__; // ---SOFTWARE---
extern string Version3__; // Notes
extern string Info_Display; // ---RANGER---
extern bool Draw_Default_Range; // Use Zone? 
extern int Start_Range; // Zone start pips
extern bool Close_all_at_range; // Close all orders on Zone hit
extern string hint2; // ---MAX TRADES & HARD SL---
extern int MaxBuy; // Max buy trades (0 disabled)
extern int MaxSell; // Max sell trades (0 disabled)
extern int HardSL; // Hard SL (in points)
extern string hint3; // ---SWITCHES---
extern bool InpManualInitGrid; // Start manual order grid  (Only if A / B enable)
extern bool InpOpenNewOrders; // Open new orders?
extern bool OpenNewOrdersGrid; // Enable grid?
extern bool InpCloseAllNow; // Closes all orders now
extern string hint4; // ---MAGIC NUMBERS---
extern string Magic; // --------If all the engines are disabled runs a motor in buy and sell ---------
extern bool InpEnableEngineA; // Enable engine A   [BUY]
extern int InpMagic; // Magic number A
extern bool InpEnableEngineB; // Enable engine B   [SELL]
extern int InpMagic2; // Magic number B
extern string __LotSizeMode__; // ---LOT SIZE MODE---
extern ENUM_LOT_MODE InpLotMode; // Lot size mode
extern double InpFixedLot; // Fixed Lot
extern double InpPercentLot; // Percent Lot
extern double InpMaxLot; // Max Lot
extern string __ConfigGrid__; // ---GRID---
extern ENUM_TYPE_GRID_LOT TypeGridLot; // Grid type
extern int InpGridSize; // Step size in pips
extern int InpTakeProfit; // Take profit in pips
extern double InpGridFactor; // Martingale multiplier (If martingale)
extern int InpGridStepLot; // Step Lot (If  Step Lot)
extern int InpHedgex; // After level change Lot A to B (All engines need to be enabled)
extern bool GridAllDirect; // Enable grid dual side
extern string __FilterOneOrderbyCandl__e; // ---FILTER ONE ORDER BY CANDLE---
extern bool InpOpenOneCandle; // Open one order by candle close
extern ENUM_TIMEFRAMES InpTimeframeBarOpen; // Timeframe for opening by candle close
extern string __MinimalProfitClose__; // ---MINIMAL PROFIT CLOSE / PROTECT GRID---
extern bool InpEnableMinProfit; // Use minimal profit close?
extern bool ProtectGridLastFist; // Enable protect grid last save first
extern double MinProfit; // Minimal profit close / protect grid
extern int QtdTradesMinProfit; // Trades to close/protect minimal profit grid
extern string Config__; // ---HEDGE---
extern int InpHedge; // Hedge after level
extern int InpDailyTarget; // Daily target in money
extern string __MovingAverageConfig__; // ---MOVING AVERAGE---
extern ENUM_TIMEFRAMES InpMaFrame; // Moving Average timeframe
extern int InpMaPeriod; // Moving Average period
extern ENUM_MA_METHOD InpMaMethod; // Moving Average method
extern ENUM_APPLIED_PRICE InpMaPrice; // Moving Average price
extern int InpMaShift; // Moving Average shift
extern string HILOConfig__; // ---HILO---
extern bool EnableSinalHILO; // Use HILO?
extern bool InpHILOFilterInverter; // If True Invert Filter
extern ENUM_TIMEFRAMES InpHILOFrame; // HILO timeframe
extern int InpHILOPeriod; // HILO period
extern ENUM_MA_METHOD InpHILOMethod; // HILO method
extern int InpHILOShift; // HILO shift
extern string TrailingStop__; // ---TRAILLING STOP---
extern bool InpUseTrailingStop; // Use Trailling Stop?
extern int InpTrailStart; // Trail start    (in points)
extern int InpTrailStop; // Trail stop     (in points)
extern int InpTrailStep; // Trail step     (in points)
extern string BreakEven; // ---BREAK EVEN---
extern bool InpUseBreakEven; // Use break even?
extern int InpBreakEvenStart; // Break even start
extern int InpBreakEvenStep; // Break even step
extern string TakeEquitySTOP__; // ---TAKE EQUITY STOP---
extern bool InpUseTakeEquityStop; // Use take equity stop?
extern double InpProfitCloseandSTOP; // Closes all orders once float hits this $ amount
extern string FilterSpread__; // ---MAX SPREAD FILTER---
extern int InpMaxSpread; // Max spread in pips
extern string EquityCaution__; // ---EQUITY CAUTION ALERT---
extern bool InpUseEquityCaution; // Use equity caution?
extern double InpTotalEquityRiskCaution; // Total % risk for equity caution
extern ENUM_TIMEFRAMES InpTimeframeEquityCaution; // Timeframe of equity caution
extern string EquitySTOP__; // ---MAX DRAWDOWN PROTECTOR ---------------
extern bool InpUseEquityStop; // Use drawdown protection?
extern double InpTotalEquityRisk; // Max drawdown % risk
extern bool InpAlertPushEquityLoss; // Send alert to celular
extern bool InpCloseAllEquityLoss; // Close all orders in max drawdown
extern bool InpCloseRemoveEA; // Remove software and close chart after max drawdown to stop new 
extern string NEWS; // ---NEWS FILTER---
extern bool UseNewsFilter; // Use news filter?
extern bool NewsClose; // Close trades during news period
extern string _comment1; // News Settings
extern bool LowNews; // Scan for low impact news
extern int LowIndentBefore; // Before low impact news
extern int LowIndentAfter; // After low impact news
extern bool MidleNews; // Scan for medium impact news
extern int MidleIndentBefore; // Before medium impact news
extern int MidleIndentAfter; // After medium impact news
extern bool HighNews; // Scan for high impact news
extern int HighIndentBefore; // Before high impact news
extern int HighIndentAfter; // After high impact news
extern bool NFPNews; // Scan for NFP news
extern int NFPIndentBefore; // Before NFP news
extern int NFPIndentAfter; // After NFP news
extern bool DrawNewsLines; // Draw news lines
extern color LowColor; // Line colour - low impact news
extern color MidleColor; // Line colour - medium impact news
extern color HighColor; // Line colour - high impact news
extern int LineWidth; // Line width
extern ENUM_LINE_STYLE LineStyle; // Line Style
extern string TimeFilter__; // ---DATE & TIME FILTER---
extern bool InpUtilizeTimeFilter; // Use time filter?
extern bool InpTrade_in_Monday; // Monday
extern bool InpTrade_in_Tuesday; // Tuesday
extern bool InpTrade_in_Wednesday; // Wednesday
extern bool InpTrade_in_Thursday; // Thursday
extern bool InpTrade_in_Friday; // Friday
extern string InpStartHour; // Start hour market time
extern string InpEndHour; // End hour market time
extern string _Visor1_; // ---VISOR---
extern bool Visor1_Show_the_Time; // Show time
extern bool Visor1_Show_the_Price; // Show price
extern color Visor1_Price_Up_Color; // Price up color
extern color Visor1_Price_Down_Color; // Price down color
extern int Visor1_Price_X_Position; // Price X position
extern int Visor1_Price_Y_Position; // Price Y position
extern int Visor1_Price_Size; // Price size
extern int Visor1_Porcent_X_Position; // Porcent X position
extern int Visor1_Porcent_Y_Position; // Porcent Y position
extern int Visor1_Porcent_Size; // Porcent size
extern int Visor1_Symbol_X_Position; // Symbol X position
extern int Visor1_Symbol_Y_Position; // Symbol Y position
extern int Visor1_Symbol_Size; // Symbol size
extern int Visor1_Chart_Timezone; // Chart timezone
extern color Visor1_Time_Color; // Time color
extern int Visor1_Time_Size; // Time size
extern int Visor1_Time_X_Position; // Time X position
extern int Visor1_Time_Y_Position; // Time Y position
extern int Visor1_Spread_Size; // Spread size
extern int Visor1_Spread_X_Position; // Spread X position
extern int Visor1_Spread_Y_Position; // Spread Y position

struct NewsDetails
{
public:
   int m_0;
   datetime m_4;
   string m_12;
   void func_1072()
   {
   }

   NewsDetails()
   {
   }

};

class NewsReader
{
public:
   bool m_16;
   int m_17;
   int m_21;
   int m_25;
   int m_29;
   bool m_33;
   bool m_34;
   bool m_35;
   datetime m_36;
   string m_44;
   string m_56;
   string m_68[4][1000];
   void func_1079()
   {
      string tmp_str00000;
      string tmp_str00001;
      string tmp_str00002;
      string tmp_str00003;
      string Ls_FFFF0;
      int Li_FFFEC;
      int Li_FFFE8;
      int Li_FFFE4;

      tmp_str00000 = NULL;
      char Lc_FFFB0[];
      char Lc_FFF7C[];
      tmp_str00002 = "";
      tmp_str00003 = "https://ec.forexprostools.com/?columns=exc_currency,exc_importance&importance=1,2,3&calType=week&timeZone=15&lang=1";
      if (WebRequest("GET", tmp_str00003, tmp_str00000, NULL, 5000, Lc_FFFB0, 0, Lc_FFF7C, tmp_str00001) == -1) {
         Print("WebRequest error, err.code  =", GetLastError());
         MessageBox("You must add the address 'https://ec.forexprostools.com/' in the list of allowed URL tab 'Advisors' ", " Error ", 64);
      }
      else {
         Gi_00000 = FileOpen("news-log.html", 6);
         if (Gi_00000 != -1) {
            FileWriteArray(Gi_00000, Lc_FFF7C, 0, ArraySize(Lc_FFF7C));
            FileClose(Gi_00000);
            Gi_00001 = FileOpen("news-log.html", 5);
            tmp_str00002 = FileReadString(Gi_00001, ArraySize(Lc_FFF7C));
            FileClose(Gi_00001);
         }
         else {
            Print("Error in FileOpen. Error code =", GetLastError());
         }
      }
      ArrayFree(Lc_FFF7C);
      ArrayFree(Lc_FFFB0);
      Ls_FFFF0 = tmp_str00002;
      Li_FFFEC = StringFind(Ls_FFFF0, "pageStartAt>", 0) + 12;
      Li_FFFE8 = StringFind(Ls_FFFF0, "</tbody>", 0);
      Ls_FFFF0 = StringSubstr(Ls_FFFF0, Li_FFFEC, (Li_FFFE8 - Li_FFFEC));
      Li_FFFEC = 0;
      if (_StopFlag != 0) return;
      do {
         Li_FFFEC = StringFind(Ls_FFFF0, "event_timestamp", Li_FFFEC) + 17;
         Li_FFFE8 = StringFind(Ls_FFFF0, "onclick", Li_FFFEC) - 2;
         if (Li_FFFEC < 17) return;
         if (Li_FFFE8 < 0) return;

         this.m_68[this.m_17, 0] = StringSubstr(Ls_FFFF0, Li_FFFEC, (Li_FFFE8 - Li_FFFEC));
         Li_FFFEC = StringFind(Ls_FFFF0, "flagCur", Li_FFFEC) + 10;
         Li_FFFE8 = Li_FFFEC + 3;
         if (Li_FFFEC < 10) return;
         if (Li_FFFE8 < 3) return;

         this.m_68[this.m_17, 1] = StringSubstr(Ls_FFFF0, Li_FFFEC, (Li_FFFE8 - Li_FFFEC));
         if (this.m_35 == false || StringFind(this.m_44, this.m_68[this.m_17, 1], 0) >= 0) {

            Li_FFFEC = StringFind(Ls_FFFF0, "title", Li_FFFEC) + 7;
            Li_FFFE8 = StringFind(Ls_FFFF0, "Volatility", Li_FFFEC) - 1;
            if (Li_FFFEC < 7) return;
            if (Li_FFFE8 < 0) return;

            this.m_68[this.m_17, 2] = StringSubstr(Ls_FFFF0, Li_FFFEC, (Li_FFFE8 - Li_FFFEC));
            if (StringFind(this.m_68[this.m_17, 2], "High", 0) < 0 || HighNews) {

               if (StringFind(this.m_68[this.m_17, 2], "Moderate", 0) < 0 || MidleNews) {

                  if (StringFind(this.m_68[this.m_17, 2], "Low", 0) < 0 || LowNews) {

                     Li_FFFEC = StringFind(Ls_FFFF0, "left event", Li_FFFEC) + 12;
                     Li_FFFE4 = StringFind(Ls_FFFF0, "Speaks", Li_FFFEC);
                     Li_FFFE8 = StringFind(Ls_FFFF0, "<", Li_FFFEC);
                     if (Li_FFFEC < 12) return;
                     if (Li_FFFE8 < 0) return;
                     if (Li_FFFE4 < 0 || Li_FFFE4 > Li_FFFE8) {

                        this.m_68[this.m_17, 3] = StringSubstr(Ls_FFFF0, Li_FFFEC, (Li_FFFE8 - Li_FFFEC));
                     }
                     else {
                        this.m_68[this.m_17, 3] = StringSubstr(Ls_FFFF0, Li_FFFEC, (Li_FFFE4 - Li_FFFEC));
                     }
                     this.m_17 = this.m_17 + 1;
                     if (this.m_17 == 300) {
                        Print("Broke News update cycle cause NomNews is equal to 300");
                        return;
                     }
                  }
               }
            }
         }
      } while (_StopFlag == 0);

   }

   bool func_1083(int Fa_i_00, long Fa_l_01, NewsDetails& FuncArg_Struct_00000002[]) {
      string tmp_str00000;
      string tmp_str00001;
      string tmp_str00002;
      string tmp_str00003;
      string tmp_str00004;
      string tmp_str00005;
      string tmp_str00006;
      string tmp_str00007;
      string tmp_str00008;
      string tmp_str00009;
      string tmp_str0000A;
      string tmp_str0000B;
      string tmp_str0000C;
      string tmp_str0000D;
      string tmp_str0000E;
      string tmp_str0000F;
      string tmp_str00010;
      string tmp_str00011;
      string tmp_str00012;
      string tmp_str00013;
      string tmp_str00014;
      string tmp_str00015;
      string tmp_str00016;
      string tmp_str00017;
      string tmp_str00018;
      string tmp_str00019;
      string tmp_str0001A;
      string tmp_str0001B;
      string tmp_str0001C;
      string tmp_str0001D;
      string tmp_str0001E;
      string tmp_str0001F;
      string tmp_str00020;
      string tmp_str00021;
      string tmp_str00022;
      string tmp_str00023;
      string tmp_str00024;
      string tmp_str00025;
      string tmp_str00026;
      string tmp_str00027;
      string tmp_str00028;
      string tmp_str00029;
      string tmp_str0002A;
      string tmp_str0002B;
      string tmp_str0002C;
      string tmp_str0002D;
      string tmp_str0002E;
      string tmp_str0002F;
      string tmp_str00030;
      string tmp_str00031;
      bool Lb_FFFFA;
      int Li_FFFF4;
      int Li_FFFF0;
      string Ls_FFFE0;
      int Li_FFFD8;
      int Li_FFFD4;
      NewsDetails Local_Struct_FFFFFFB8;
      bool Lb_FFFFB;
      int Li_FFFDC;

      Lb_FFFFA = false;
      Fa_i_00 = 0;
      Li_FFFF4 = 0;
      if (LowNews || MidleNews || HighNews || NFPNews) {

         Gl_00000 = TimeCurrent() - this.m_36;
         Gl_00001 = this.m_29;
         if (Gl_00000 >= Gl_00001) {
            Print("Investing.com News Loading...");
            func_1079();
            this.m_36 = TimeCurrent();
            Comment("");
            Print("Load Complete");
         }
         if (DrawNewsLines) {
            Li_FFFF0 = 0;
            if (this.m_17 > 0) {
               do {
                  Gi_00001 = Li_FFFF0;
                  Gl_00002 = TimeCurrent();
                  Gl_00002 = Gl_00002 - TimeGMT();
                  Gd_00002 = NormalizeDouble((Gl_00002 / 3600), 0);
                  tmp_str00000 = this.m_68[Li_FFFF0, 0];
                  tmp_str00002 = StringSubstr(tmp_str00000, 14, 4);
                  tmp_str00003 = StringSubstr(tmp_str00000, 11, 2);
                  tmp_str00004 = StringSubstr(tmp_str00000, 8, 2);
                  tmp_str00005 = StringSubstr(tmp_str00000, 5, 2);
                  tmp_str00006 = StringSubstr(tmp_str00000, 0, 4);
                  tmp_str00001 = StringConcatenate(tmp_str00006, ".", tmp_str00005, ".", tmp_str00004, " ", tmp_str00003, ":", tmp_str00002);
                  Gl_00005 = StringToTime(tmp_str00001);
                  Gd_00006 = (Gd_00002 * 3600);
                  tmp_str00007 = "NS_" + TimeToString((datetime)(Gl_00005 + Gd_00006), 2);
                  tmp_str00007 = tmp_str00007 + "_";
                  tmp_str00007 = tmp_str00007 + this.m_68[Li_FFFF0, 1];
                  tmp_str00007 = tmp_str00007 + "_";
                  tmp_str00007 = tmp_str00007 + this.m_68[Li_FFFF0, 3];
                  Ls_FFFE0 = StringSubstr(tmp_str00007, 0, 63);
                  if (this.m_68[Li_FFFF0, 3] != "" && ObjectFind(Ls_FFFE0) == 0) {
                  }
                  else {

                     if (this.m_35 != false && StringFind(this.m_44, this.m_68[Li_FFFF0, 1], 0) < 0) {
                     }
                     else {
                        Gi_00009 = Li_FFFF0;
                        Gl_0000A = TimeCurrent();
                        Gl_0000A = Gl_0000A - TimeGMT();
                        Gd_0000A = NormalizeDouble((Gl_0000A / 3600), 0);
                        tmp_str00008 = this.m_68[Li_FFFF0, 0];
                        tmp_str0000A = StringSubstr(tmp_str00008, 14, 4);
                        tmp_str0000B = StringSubstr(tmp_str00008, 11, 2);
                        tmp_str0000C = StringSubstr(tmp_str00008, 8, 2);
                        tmp_str0000D = StringSubstr(tmp_str00008, 5, 2);
                        tmp_str0000E = StringSubstr(tmp_str00008, 0, 4);
                        tmp_str00009 = StringConcatenate(tmp_str0000E, ".", tmp_str0000D, ".", tmp_str0000C, " ", tmp_str0000B, ":", tmp_str0000A);
                        Gl_0000C = StringToTime(tmp_str00009);
                        Gd_0000D = (Gd_0000A * 3600);
                        Gl_0000D = (long)(Gl_0000C + Gd_0000D);
                        if (Gl_0000D < TimeCurrent() && this.m_33) {
                        }
                        else {
                           Li_FFFDC = (int)4294967295;
                           if (HighNews) {
                              if (StringFind(this.m_68[Li_FFFF0, 2], "High", 0) >= 0) {
                                 Li_FFFDC = HighColor;
                              }
                           }
                           if (MidleNews) {
                              if (StringFind(this.m_68[Li_FFFF0, 2], "Moderate", 0) >= 0) {
                                 Li_FFFDC = MidleColor;
                              }
                           }
                           if (LowNews) {
                              if (StringFind(this.m_68[Li_FFFF0, 2], "Low", 0) >= 0) {
                                 Li_FFFDC = LowColor;
                              }
                           }
                           if (Li_FFFDC == (int)4294967295) {
                           }
                           else {
                              if (this.m_68[Li_FFFF0, 3] != "") {
                                 Gi_00012 = Li_FFFF0;
                                 Gl_00013 = TimeCurrent();
                                 Gl_00013 = Gl_00013 - TimeGMT();
                                 Gd_00013 = NormalizeDouble((Gl_00013 / 3600), 0);
                                 tmp_str0000F = this.m_68[Li_FFFF0, 3];
                                 tmp_str00011 = StringSubstr(tmp_str0000F, 14, 4);
                                 tmp_str00012 = StringSubstr(tmp_str0000F, 11, 2);
                                 tmp_str00013 = StringSubstr(tmp_str0000F, 8, 2);
                                 tmp_str00014 = StringSubstr(tmp_str0000F, 5, 2);
                                 tmp_str00015 = StringSubstr(tmp_str0000F, 0, 4);
                                 tmp_str00010 = StringConcatenate(tmp_str00015, ".", tmp_str00014, ".", tmp_str00013, " ", tmp_str00012, ":", tmp_str00011);
                                 Gl_00014 = StringToTime(tmp_str00010);
                                 Gd_00015 = (Gd_00013 * 3600);
                                 ObjectCreate(0, Ls_FFFE0, OBJ_VLINE, 0, (datetime)(Gl_00014 + Gd_00015), 0);
                                 ObjectSet(Ls_FFFE0, OBJPROP_COLOR, Li_FFFDC);
                                 ObjectSet(Ls_FFFE0, OBJPROP_STYLE, LineStyle);
                                 ObjectSetInteger(0, Ls_FFFE0, 8, LineWidth);
                                 ObjectSetInteger(0, Ls_FFFE0, 9, 1);
                              }
                           }
                        }
                     }
                  }
                  Li_FFFF0 = Li_FFFF0 + 1;
               } while (Li_FFFF0 < this.m_17);
            }
            WindowRedraw();
         }
         Li_FFFD8 = 0;
         Lb_FFFFA = false;
         Li_FFFD8 = 0;
         if (this.m_17 > 0) {
            do {
               Li_FFFD4 = 0;
               if (HighNews) {

                  if (StringFind(this.m_68[Li_FFFD8, 2], "High", 0) >= 0) {
                     Li_FFFD4 = 3;
                     this.m_21 = HighIndentBefore;
                     this.m_25 = HighIndentAfter;
                  }
               }
               if (MidleNews) {

                  if (StringFind(this.m_68[Li_FFFD8, 2], "Moderate", 0) >= 0) {
                     Li_FFFD4 = 2;
                     this.m_21 = MidleIndentBefore;
                     this.m_25 = MidleIndentAfter;
                  }
               }
               if (LowNews) {

                  if (StringFind(this.m_68[Li_FFFD8, 2], "Low", 0) >= 0) {
                     Li_FFFD4 = 1;
                     this.m_21 = LowIndentBefore;
                     this.m_25 = LowIndentAfter;
                  }
               }
               if (NFPNews) {

                  if (StringFind(this.m_68[Li_FFFD8, 3], "Nonfarm Payrolls", 0) >= 0 && Li_FFFD4 == 3) {
                     Li_FFFD4 = 4;
                     this.m_21 = NFPIndentBefore;
                     this.m_25 = NFPIndentAfter;
                  }
               }
               if (Li_FFFD4 != 0) {
                  Gl_00019 = TimeCurrent();
                  Gi_0001A = this.m_21 * 60;
                  Gl_0001A = Gi_0001A;
                  Gl_0001A = Gl_00019 + Gl_0001A;
                  Gi_0001B = Li_FFFD8;
                  Gl_0001C = TimeCurrent();
                  Gl_0001C = Gl_0001C - TimeGMT();
                  Gd_0001C = NormalizeDouble((Gl_0001C / 3600), 0);
                  tmp_str00016 = this.m_68[Li_FFFD8, 0];
                  tmp_str00018 = StringSubstr(tmp_str00016, 14, 4);
                  tmp_str00019 = StringSubstr(tmp_str00016, 11, 2);
                  tmp_str0001A = StringSubstr(tmp_str00016, 8, 2);
                  tmp_str0001B = StringSubstr(tmp_str00016, 5, 2);
                  tmp_str0001C = StringSubstr(tmp_str00016, 0, 4);
                  tmp_str00017 = StringConcatenate(tmp_str0001C, ".", tmp_str0001B, ".", tmp_str0001A, " ", tmp_str00019, ":", tmp_str00018);
                  Gl_0001F = StringToTime(tmp_str00017);
                  Gd_00020 = (Gd_0001C * 3600);
                  Gl_00020 = (long)(StringToTime(tmp_str00017) + Gd_0001C * 3600);

                  Gl_00020 = TimeCurrent();
                  Gi_00021 = this.m_25 * 60;
                  Gl_00021 = Gi_00021;
                  Gl_00021 = Gl_00020 - Gl_00021;
                  Gi_00022 = Li_FFFD8;
                  Gl_00023 = TimeCurrent();
                  Gl_00023 = Gl_00023 - TimeGMT();
                  Gd_00023 = NormalizeDouble((Gl_00023 / 3600), 0);
                  tmp_str0001D = this.m_68[Li_FFFD8, 0];
                  tmp_str0001F = StringSubstr(tmp_str0001D, 14, 4);
                  tmp_str00020 = StringSubstr(tmp_str0001D, 11, 2);
                  tmp_str00021 = StringSubstr(tmp_str0001D, 8, 2);
                  tmp_str00022 = StringSubstr(tmp_str0001D, 5, 2);
                  tmp_str00023 = StringSubstr(tmp_str0001D, 0, 4);
                  tmp_str0001E = StringConcatenate(tmp_str00023, ".", tmp_str00022, ".", tmp_str00021, " ", tmp_str00020, ":", tmp_str0001F);
                  Gl_00025 = StringToTime(tmp_str0001E);
                  Gd_00026 = (Gd_00023 * 3600);
                  Gl_00026 = (long)(Gl_00025 + Gd_00026);

                  if (Gl_0001A > (StringToTime(tmp_str00017) + Gd_0001C * 3600)
                     && Gl_00021 < Gl_00026
                     && (this.m_35 == false || StringFind(this.m_44, this.m_68[Li_FFFD8, 1], 0) >= 0)) {

                     if ((HighNews && Li_FFFD4 == 3)
                        || (MidleNews && Li_FFFD4 == 2)
                        || (LowNews && Li_FFFD4 == 1)
                        || (NFPNews && Li_FFFD4 == 4)) {

                        Gi_00027 = Li_FFFD8;

                        Local_Struct_FFFFFFB8.m_12 = this.m_68[Li_FFFD8, 1];
                        Local_Struct_FFFFFFB8.m_0 = Li_FFFD4;
                        Gi_0002A = Li_FFFD8;
                        Gl_0002B = TimeCurrent();
                        Gl_0002B = Gl_0002B - TimeGMT();
                        Gd_0002B = NormalizeDouble((Gl_0002B / 3600), 0);
                        tmp_str00024 = this.m_68[Li_FFFD8, 1];
                        tmp_str00026 = StringSubstr(tmp_str00024, 14, 4);
                        tmp_str00027 = StringSubstr(tmp_str00024, 11, 2);
                        tmp_str00028 = StringSubstr(tmp_str00024, 8, 2);
                        tmp_str00029 = StringSubstr(tmp_str00024, 5, 2);
                        tmp_str0002A = StringSubstr(tmp_str00024, 0, 4);
                        tmp_str00025 = StringConcatenate(tmp_str0002A, ".", tmp_str00029, ".", tmp_str00028, " ", tmp_str00027, ":", tmp_str00026);
                        Gl_0002C = StringToTime(tmp_str00025);
                        Gd_0002D = (Gd_0002B * 3600);
                        Local_Struct_FFFFFFB8.m_4 = (datetime)(Gl_0002C + Gd_0002D);
                        Gi_0002F = ArraySize(FuncArg_Struct_00000002);
                        Gi_0002F = Gi_0002F + 1;
                        Gi_00030 = Gi_0002F;
                        ArrayResize(FuncArg_Struct_00000002, Gi_0002F, 3);
                        Gi_0002F = Gi_00030 - 1;
                        FuncArg_Struct_00000002[Gi_0002F].m_0 = Local_Struct_FFFFFFB8.m_0;
                        FuncArg_Struct_00000002[Gi_0002F].m_4 = Local_Struct_FFFFFFB8.m_4;
                        FuncArg_Struct_00000002[Gi_0002F].m_12 = Local_Struct_FFFFFFB8.m_12;
                     }
                     if (Li_FFFD4 > Li_FFFF4) {
                        Li_FFFF4 = Li_FFFD4;
                        Gi_00031 = Li_FFFD8;
                        Gl_00032 = TimeCurrent();
                        Gl_00032 = Gl_00032 - TimeGMT();
                        Gd_00032 = NormalizeDouble((Gl_00032 / 3600), 0);
                        tmp_str0002B = this.m_68[Li_FFFD8, 0];
                        tmp_str0002D = StringSubstr(tmp_str0002B, 14, 4);
                        tmp_str0002E = StringSubstr(tmp_str0002B, 11, 2);
                        tmp_str0002F = StringSubstr(tmp_str0002B, 8, 2);
                        tmp_str00030 = StringSubstr(tmp_str0002B, 5, 2);
                        tmp_str00031 = StringSubstr(tmp_str0002B, 0, 4);
                        tmp_str0002C = StringConcatenate(tmp_str00031, ".", tmp_str00030, ".", tmp_str0002F, " ", tmp_str0002E, ":", tmp_str0002D);
                        Gl_00034 = StringToTime(tmp_str0002C);
                        Gd_00035 = (Gd_00032 * 3600);
                        Gl_00035 = (long)(Gl_00034 + Gd_00035);
                        Fa_l_01 = Gl_00035;
                     }
                  }
                  else {
                     Lb_FFFFA = false;
                  }
               }
               Li_FFFD8 = Li_FFFD8 + 1;
            } while (Li_FFFD8 < this.m_17);
         }
         if (Li_FFFF4 > 0) {
            Lb_FFFFA = true;
         }
      }
      Fa_i_00 = Li_FFFF4;
      Lb_FFFFB = Lb_FFFFA;
      return Lb_FFFFA;
   }

};


int Ii_0C188;
int Gi_00000;
int Gi_00001;
int Gi_00002;
int Ii_0C18C;
int Gi_00003;
string Gs_00001;
string Gs_00003;
bool Ib_0BE94;
bool returned_b;
long returned_l;
int returned_i;
string Is_002A0;
double Ind_003;
int Ii_002AC;
int Ii_00290;
double Id_00260;
string Is_00248;
double Ind_000;
double Id_00180;
double Ind_004;
double Id_00188;
double Id_00190;
bool Ib_00145;
bool Ib_00146;
int Ii_00148;
long Il_00198;
long Il_001A0;
int Ii_001B8;
double Id_001C0;
double Id_00200;
double Id_00208;
double Id_00210;
bool Ib_001C8;
bool Ib_001C9;
int Ii_001CC;
long Il_00218;
long Il_00220;
int Ii_00230;
double Id_00238;
string Is_00270;
bool Ib_00268;
string Is_00070;
long Gl_00005;
long Il_000E8;
long Gl_00007;
int Ii_0003C;
double Gd_00007;
double Ind_002;
bool Gb_00008;
double Gd_00008;
bool Gb_00009;
long Gl_00009;
long Gl_0000A;
long Gl_0000B;
string Is_0BE88;
int Gi_0000B;
double Gd_00027;
int Gi_00028;
int Gi_00029;
double Id_00280;
int Gi_0002A;
double Gd_00028;
int Gi_0002B;
int Gi_0002C;
double Gd_0002D;
double Gd_0002E;
int Gi_0002F;
int Gi_00030;
double Gd_00031;
double Gd_00032;
double Gd_00033;
bool Gb_00033;
int Gi_00035;
double Gd_00034;
int Gi_00036;
int Gi_00037;
double Gd_00038;
double Gd_00039;
int Gi_0003A;
int Gi_0003B;
double Gd_0003C;
double Gd_0003D;
double Gd_0003E;
bool Gb_0003E;
int Gi_0003F;
int Gi_00040;
int Gi_00041;
double Gd_00040;
double Gd_00042;
int Gi_00043;
int Ii_00140;
double Gd_00043;
double Gd_00044;
int Gi_00045;
int Gi_00046;
int Gi_00047;
double Gd_00046;
double Gd_00048;
int Gi_00049;
double Gd_00049;
double Gd_0004A;
int Gi_0004B;
bool Gb_0004B;
int Gi_0004C;
int Gi_0004D;
double Gd_0004C;
double Gd_0004E;
int Gi_0004F;
double Gd_0004F;
double Gd_00050;
int Gi_00051;
int Gi_00052;
int Gi_00053;
double Gd_00052;
double Gd_00054;
int Gi_00055;
double Gd_00055;
double Gd_00056;
int Gi_00057;
double Gd_00058;
int Gi_00059;
int Gi_0005A;
int Gi_0005B;
int Gi_0005C;
double Gd_0005D;
int Gi_0005E;
int Gi_0005F;
int Gi_00060;
int Gi_00061;
bool Gb_00060;
double Id_001B0;
double Id_00178;
double Id_00170;
double Id_00168;
double Id_00160;
double Id_00158;
int Ii_00150;
int Ii_0014C;
double Id_001A8;
double Id_00240;
double Id_001F8;
double Id_001F0;
double Id_001E8;
double Id_001E0;
double Id_001D8;
int Ii_001D4;
int Ii_001D0;
double Id_00228;
int Gi_00062;
int Gi_00063;
double Gd_00062;
double Gd_00064;
int Gi_00065;
double Gd_00065;
double Gd_00066;
int Gi_00067;
int Gi_00068;
int Gi_00069;
double Gd_00068;
double Gd_0006A;
int Gi_0006B;
double Gd_0006B;
double Gd_0006C;
int Gi_0006D;
int Gi_0006E;
int Gi_0006F;
bool Gb_0006E;
double Gd_0006E;
double Gd_00070;
bool Gb_00070;
int Gi_00070;
int Gi_00071;
int Gi_00072;
double Gd_00071;
double Gd_00073;
int Gi_00074;
double Gd_00074;
double Gd_00075;
int Gi_00076;
int Gi_00077;
int Gi_00078;
double Gd_00077;
double Gd_00079;
int Gi_0007A;
double Gd_0007A;
double Gd_0007B;
int Gi_0007C;
long Il_00288;
int Ii_002B8;
bool Gb_0007C;
double Gd_0007C;
double Gd_0007D;
bool Gb_0007D;
double Id_00258;
int Gi_0007D;
int Gi_00080;
int Gi_00081;
int Gi_00082;
int Gi_00083;
double Gd_00081;
double Gd_00084;
int Gi_00085;
double Gd_00085;
double Gd_00086;
int Gi_00087;
bool Gb_00087;
long Gl_00088;
double Gd_00089;
long Gl_00089;
double Gd_0008A;
long Gl_0008A;
int Gi_0008B;
long Gl_0008C;
long Gl_0008B;
int Gi_0008C;
long Gl_0008D;
int Gi_0008D;
long Gl_0008E;
int Gi_0008E;
long Gl_0008F;
int Gi_0008F;
long Gl_00090;
double Gd_00090;
bool Gb_00090;
int Gi_00090;
double Id_000F0;
double Id_000F8;
double Id_00100;
bool Ib_00108;
bool Gb_00091;
int Gi_00091;
int Gi_00092;
int Gi_00093;
int Gi_0007E;
long Gl_0007F;
int Ii_0006C;
string Is_00080;
long Gl_00004;
long Gl_00006;
double Gd_00006;
int Gi_00006;
int Gi_00005;
long Gl_00000;
long Gl_00001;
long Gl_00002;
double Gd_00004;
double Gd_00005;
bool Gb_00004;
int Gi_00004;
int Gi_00007;
double Gd_00009;
int Gi_0000A;
bool Ib_0BE95;
int Gi_00008;
int Gi_0000C;
int Gi_0000D;
double Gd_0000C;
double Gd_0000E;
int Gi_0000F;
double Gd_0000F;
double Gd_00010;
int Gi_00011;
int Gi_00012;
int Gi_00013;
int Gi_00014;
double Gd_00013;
double Gd_00015;
int Gi_00016;
double Gd_00016;
double Gd_00017;
int Gi_00018;
bool Gb_00018;
bool Gb_0006D;
string Is_00000;
string Is_00010;
string Is_00020;
string Is_00030;
int Ii_00040;
int Ii_00044;
int Ii_00048;
string Is_00050;
string Is_00060;
int Ii_000E4;
string Is_00110;
string Is_00120;
double Id_00130;
int Ii_00138;
int Ii_0013C;
bool Ib_00144;
bool Ib_00254;
int Ii_00294;
int Ii_00298;
int Ii_0029C;
int Ii_002B0;
int Ii_002B4;
string Is_002C0;
int Ii_0C17C;
int Ii_0C180;
int Ii_0C184;
int Gi_00009;
long Gl_0000C;
long Gl_0000D;
long Gl_0000E;
int Gi_0000E;
bool Ib_00080;
char Gc_00004;
char Gc_00006;
short returned_st;
char Gc_00007;
char Gc_00009;
char Gc_0000A;
char Gc_0000D;
char Gc_0000C;
char Gc_0000F;
int Gi_00010;
char Gc_00010;
char Gc_00012;
char Gc_00013;
int Gi_00015;
char Gc_00016;
char Gc_00015;
int Gi_00017;
char Gc_00018;
int Gi_00019;
char Gc_00019;
struct Input_Struct_00000080;
int Gi_0001C;
char Gc_0001B;
int Gi_0001D;
char Gc_0001D;
int Gi_0001E;
char Gc_0001E;
char Gc_0001A;
int Gi_0001F;
int Gi_00020;
int Gi_00021;
long Gl_00022;
long Gl_00023;
long Gl_00024;
double Gd_00024;
int Gi_00024;
int Gi_00023;
int Gi_00025;
int Gi_00026;
int Gi_00027;
int Gi_0001A;
int Gi_0002D;
int Gi_0002E;
string Gs_00002;
string Gs_00005;
string Gs_00006;
string Gs_00007;
string Gs_00008;
string Gs_00009;
string Gs_0000A;
string Gs_0000B;
double Gd_00002;
string Gs_00004;
string Gs_00015;
string Gs_00016;
string Gs_00017;
string Gs_00018;
long Gl_00019;
long Gl_0001A;
int Gi_0001B;
long Gl_0001C;
double Gd_0001C;
string Gs_0001E;
long Gl_0001F;
double Gd_00020;
long Gl_00020;
long Gl_00021;
int Gi_00022;
double Gd_00023;
string Gs_00024;
long Gl_00025;
double Gd_00026;
long Gl_00026;
string Gs_00026;
string Gs_00028;
long Gl_0002B;
double Gd_0002B;
string Gs_00029;
long Gl_0002C;
string Gs_0002F;
string Gs_0002E;
int Gi_00031;
long Gl_00032;
int Gi_00033;
string Gs_00033;
long Gl_00034;
double Gd_00035;
long Gl_00035;
double Gd_0000A;
double Gd_0000D;
string Gs_0000D;
string Gs_0000E;
string Gs_0000F;
string Gs_00010;
long Gl_00013;
string Gs_00011;
long Gl_00014;
long Gl_00015;
double Gd_00000;
double Gd_00003;
double Gd_0000B;
string Gs_00000;
bool Gb_00000;
bool Gb_00003;
bool Gb_00006;
bool Gb_0000C;
bool Gb_0000F;
double Gd_00011;
bool Gb_00011;
bool Gb_00014;
double Gd_00014;
bool Gb_00017;
double Gd_00018;
bool Gb_0001D;
double Gd_0001D;
double Gd_0001F;
bool Gb_00020;
double Gd_00021;
double Gd_00022;
bool Gb_00022;
long Gl_00027;
bool Gb_00027;
bool Gb_00028;
double Gd_00029;
double Gd_0002C;
bool Gb_0002E;
int Gi_00039;
bool Gb_00039;
double Gd_0003B;
bool Gb_0003B;
bool Gb_00049;
int Gi_0004A;
int Gi_0004E;
double Gd_0004D;
bool Gb_0004D;
bool Gb_0004F;
double Gd_00051;
bool Gb_00052;
int Gi_00054;
int Gi_00056;
bool Gb_00056;
bool Gb_00058;
double Gd_00059;
double Gd_0005A;
double Gd_0005B;
bool Gb_0005B;
int Gi_0005D;
bool Gb_0005E;
double Gd_0005E;
double Gd_00060;
bool Gb_00061;
double Gd_00061;
bool Gb_00063;
int Gi_00064;
int Gi_00066;
bool Gb_00066;
bool Gb_00069;
double Gd_00069;
double Gd_0006D;
double Gd_0006F;
int Gi_0003C;
double Gd_00041;
int Gi_00042;
double Gd_00045;
long Gl_0002F;
double Gd_00030;
long Gl_00030;
long Gl_00031;
int Gi_00032;
long Gl_00033;
int Gi_00034;
long Gl_00036;
long Gl_00037;
bool Gb_00037;
double Gd_00001;
bool Gb_00005;
bool Gb_0000D;
bool Gb_0000E;
double Ind_001;
bool Gb_00007;
bool Gb_0000B;
bool Gb_00013;
bool Gb_00016;
string Gs_0000C;
string Gs_00013;
bool Gb_00012;
double Gd_00019;
double Gd_0001A;
bool Gb_0001B;
string Gs_0001C;
long Gl_0001D;
long Gl_0001E;
bool Gb_00024;
string Gs_00025;
bool Gb_0002D;
bool Gb_00036;
string Gs_00037;
long Gl_00038;
long Gl_00039;
int Gi_0003D;
int Gi_0003E;
bool Gb_0003F;
string Gs_00040;
long Gl_00041;
long Gl_00042;
int Gi_00044;
double Gd_00047;
bool Gb_00048;
int Gi_00048;
string Gs_00049;
long Gl_0004D;
bool Gb_0004E;
string Gs_0004F;
long Gl_00050;
long Gl_00051;
bool Gb_00055;
string Gs_00056;
long Gl_00057;
long Gl_00058;
bool Gb_0005C;
string Gs_0005D;
long Gl_0005E;
long Gl_0005F;
string Gs_00064;
long Gl_00065;
long Gl_00066;
double Gd_00067;
bool Gb_0006A;
int Gi_0006A;
string Gs_0006B;
long Gl_0006C;
long Gl_0006D;
bool Gb_00071;
string Gs_00072;
long Gl_00073;
long Gl_00074;
bool Gb_00078;
int Gi_00079;
string Gs_00079;
long Gl_0007A;
long Gl_0007B;
double Gd_0007E;
bool Gb_0007F;
int Gi_0007F;
string Gs_00080;
bool Gb_00082;
string Gs_00083;
bool Gb_00085;
int Gi_00086;
string Gs_00086;
double Gd_00087;
bool Gb_00088;
int Gi_00088;
int Gi_00089;
string Gs_00089;
bool Gb_0008B;
string Gs_0008C;
double Gd_0008D;
bool Gb_0008E;
string Gs_0008F;
string Gs_00092;
double Gd_00093;
bool Gb_00094;
int Gi_00094;
int Gi_00095;
string Gs_00095;
long Gl_00096;
long Gl_00097;
double Gd_00098;
int Gi_00099;
double Gd_0009A;
bool Gb_0009A;
bool Gb_0009B;
int Gi_0009B;
int Gi_0009C;
string Gs_0009C;
bool Gb_0009C;
bool Gb_00095;
bool Gb_00092;
bool Gb_0008F;
bool Gb_0008C;
bool Gb_00089;
bool Gb_00086;
bool Gb_00083;
bool Gb_00080;
bool Gb_00079;
bool Gb_00072;
bool Gb_0006B;
bool Gb_00064;
bool Gb_0005D;
bool Gb_00040;
bool Gb_00025;
bool Gb_0001C;
bool Gb_0000A;

string Is_0C14C[4] = { "Daily DD", "Open DD", "Monthly DD", "Monthly P" };
string Is_0C0AC[9] = { "GAIN", "TodayGAIN", "YesterdayGAIN", "Day1GAIN", "Day2GAIN", "Day3GAIN", "WeekGAIN", "MonthGAIN", "YearGAIN" };
string Is_0C00C[9] = { "PROFIT", "TodayPROFIT", "YesterdayPROFIT", "Day1PROFIT", "Day2PROFIT", "Day3PROFIT", "WeekPROFIT", "MonthPROFIT", "YearPROFIT" };
string Is_0BF6C[9] = { "PIPS", "TodayPIPS", "YesterdayPIPS", "Day1PIPS", "Day2PIPS", "Day3PIPS", "WeekPIPS", "MonthPIPS", "YearPIPS" };
string Is_0BECC[9] = { "DATE", "Today", "Yesterday", "Day1", "Day2", "Day3", "Week", "Month", "Year" };
MTLicenseInfo Input_MTLicenseInfo_00000080;
NewsReader Input_NewsReader_000002C0;
double returned_double;
bool order_check;
int init()
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;
   string tmp_str00004;
   string tmp_str00005;
   string tmp_str00006;
   string tmp_str00007;
   string tmp_str00008;
   string tmp_str00009;
   int Li_FFFFC;
   Is_00000 = "The MITHILESH EA V1.0";
   Is_00010 = "The MITHILESH EA V1.0";
   Is_00020 = "The MITHILESH Ftmo EA";
   Is_00030 = "44.226.41.246";
   Ii_0003C = 3600;
   Ii_00040 = 0;
   Ii_00044 = 0;
   Ii_00048 = 0;
   Is_00050 = "htD3CRRIUoeRkBGfzsBx8yE5cniNzTQK";
   Is_00060 = "";
   Ii_0006C = 0;
   Ii_000E4 = 0;
   Il_000E8 = TimeCurrent();
   Id_000F0 = 0;
   Id_000F8 = 0;
   Id_00100 = 0;
   Ib_00108 = false;
   Is_00110 = "";
   Is_00120 = "";
   Id_00130 = 0;
   Ii_00138 = 0;
   Ii_0013C = 0;
   Ii_00140 = 3;
   Ib_00144 = false;
   Ib_00145 = false;
   Ib_00146 = false;
   Ii_00148 = 0;
   Ii_0014C = 0;
   Ii_00150 = 0;
   Id_00158 = 0;
   Id_00160 = 0;
   Id_00168 = 0;
   Id_00170 = 0;
   Id_00178 = 0;
   Id_00180 = 0;
   Id_00188 = 0;
   Id_00190 = 0;
   Il_00198 = 0;
   Il_001A0 = 0;
   Id_001A8 = 0;
   Id_001B0 = 0;
   Ii_001B8 = 0;
   Id_001C0 = 0;
   Ib_001C8 = false;
   Ib_001C9 = false;
   Ii_001CC = 0;
   Ii_001D0 = 0;
   Ii_001D4 = 0;
   Id_001D8 = 0;
   Id_001E0 = 0;
   Id_001E8 = 0;
   Id_001F0 = 0;
   Id_001F8 = 0;
   Id_00200 = 0;
   Id_00208 = 0;
   Id_00210 = 0;
   Il_00218 = 0;
   Il_00220 = 0;
   Id_00228 = 0;
   Ii_00230 = 0;
   Id_00238 = 0;
   Id_00240 = 0;
   Ib_00254 = false;
   Id_00258 = 0;
   Id_00260 = 0;
   Ib_00268 = false;
   Id_00280 = 0;
   Il_00288 = 0;
   Ii_00290 = 8;
   Ii_00294 = 0;
   Ii_00298 = 0;
   Ii_0029C = 0;
   Ii_002AC = 55295;
   Ii_002B0 = 0;
   Ii_002B4 = 0;
   Ii_002B8 = 0;
   Input_NewsReader_000002C0.m_17 = 0;
   Input_NewsReader_000002C0.m_21 = 0;
   Input_NewsReader_000002C0.m_25 = 0;
   Input_NewsReader_000002C0.m_29 = 86400;
   Input_NewsReader_000002C0.m_33 = false;
   Input_NewsReader_000002C0.m_34 = false;
   Input_NewsReader_000002C0.m_36 = 0;

   tmp_str00000 = StringSubstr(_Symbol, 0, 3);
   tmp_str00002 = tmp_str00000 + ",";
   tmp_str00002 = tmp_str00002 + StringSubstr(_Symbol, 3, 3);
   Is_002C0 = tmp_str00002;
   Is_002C0 = "NS_";
   Input_NewsReader_000002C0.m_35 = true;
   Input_NewsReader_000002C0.m_16 = IsTesting();
   Is_0BE88 = "2222.04.11";
   Ib_0BE94 = false;
   Ib_0BE95 = false;
   Ii_0C17C = 50;
   Ii_0C180 = 400;
   Ii_0C184 = 20;
   Ii_0C188 = 25;
   Ii_0C18C = 30;

   Input_MTLicenseInfo_00000080.m_69 = 1;
   Input_MTLicenseInfo_00000080.m_25 = "";
   Input_MTLicenseInfo_00000080.m_0 = true;


   func_1139();
   /*
   func_1141("Daily_DD", 100, Ii_0C188, "0");
   func_1141("Open_DD", 100, (Ii_0C188 + 40), "0");
   func_1141("Monthly_DD", 100, (Ii_0C188 + 80), "0");
   func_1141("Monthly_P", 100, (Ii_0C188 + 120), "0");

   Gi_00000 = 0;
   if (ArraySize(Is_0C14C) > 0) {
   do {
   Gi_00002 = Gi_00000 * 40;
   func_1143(Is_0C14C[Gi_00000], 120, (Ii_0C18C + Gi_00002), Is_0C14C[Gi_00000], 16777215, 13);
   Gi_00000 = Gi_00000 + 1;
   } while (Gi_00000 < ArraySize(Is_0C14C));
   }
   */
   func_1154(10, 385);
   Ib_0BE94 = false;
   EventSetMillisecondTimer(1000);
   if (IsTradeAllowed() != true) {
      Alert("YOUR AUTO TRADING IS TURNED OFF. TURN ON AUTO TRADING ON MT4 AND EA SOFTWARE.");
   }
   if (TimeYear(TimeCurrent()) > 2023) {
      tmp_str00000 = (string)TimeYear(TimeCurrent());
      tmp_str00000 = "©2023-" + tmp_str00000;
      tmp_str00000 = tmp_str00000 + ", The MITHILESH EA V1.0";
      Is_002A0 = tmp_str00000;
   }
   else {
      Is_002A0 = "© 2024, The MITHILESH EA V1.0";
   }
   tmp_str00000 = Is_002A0;
   tmp_str00001 = "TM";
   ObjectDelete(tmp_str00001);
   ObjectCreate(0, tmp_str00001, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
   ObjectSet(tmp_str00001, OBJPROP_CORNER, CORNER_RIGHT_UPPER);
   ObjectSet(tmp_str00001, OBJPROP_COLOR, clrWhite);
   ObjectSet(tmp_str00001, OBJPROP_XDISTANCE, 2);
   ObjectSet(tmp_str00001, OBJPROP_YDISTANCE, 2);
   ObjectSetInteger(0, tmp_str00001, 1000, 0);
   ObjectSetString(0, tmp_str00001, 206, "\n");
   ObjectSetText(tmp_str00001, tmp_str00000, Ii_00290, "VERDANA", clrWhite);
   Id_00260 = 2;
   ObjectCreate(0, "butN4", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "butN4", 101, 0);
   ObjectSetInteger(0, "butN4", 102, 80);
   ObjectSetInteger(0, "butN4", 103, 2);
   ObjectSetInteger(0, "butN4", 1019, 26);
   ObjectSetInteger(0, "butN4", 1020, 14);
   ObjectSetString(0, "butN4", 999, "INFO");
   ObjectSetInteger(0, "butN4", 100, 6);
   ObjectSetInteger(0, "butN4", 6, 0);
   ObjectSetInteger(0, "butN4", 1025, 55295);
   ObjectSetInteger(0, "butN4", 1018, 0);
   ObjectCreate(0, "butCAO", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "butCAO", 101, 3);
   ObjectSetString(0, "butCAO", 1001, "Arial");
   ObjectSetInteger(0, "butCAO", 100, 9);
   ObjectSetInteger(0, "butCAO", 102, 104);
   ObjectSetInteger(0, "butCAO", 103, 66);
   ObjectSetInteger(0, "butCAO", 1019, 102);
   ObjectSetInteger(0, "butCAO", 1020, 20);
   ObjectSetInteger(0, "butCAO", 208, 1);
   ObjectSetInteger(0, "butCAO", 207, 0);
   ObjectSetString(0, "butCAO", 999, "Close All Orders");
   ObjectSetInteger(0, "butCAO", 1018, 0);
   ObjectSetInteger(0, "butCAO", 1025, 55295);
   ObjectSetInteger(0, "butCAO", 6, 0);
   ObjectCreate(0, "butCAP", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "butCAP", 101, 3);
   ObjectSetString(0, "butCAP", 1001, "Arial");
   ObjectSetInteger(0, "butCAP", 100, 9);
   ObjectSetInteger(0, "butCAP", 102, 104);
   ObjectSetInteger(0, "butCAP", 103, 44);
   ObjectSetInteger(0, "butCAP", 1019, 102);
   ObjectSetInteger(0, "butCAP", 1020, 20);
   ObjectSetInteger(0, "butCAP", 208, 1);
   ObjectSetInteger(0, "butCAP", 207, 0);
   ObjectSetString(0, "butCAP", 999, "Close All Profits");
   ObjectSetInteger(0, "butCAP", 1018, 0);
   ObjectSetInteger(0, "butCAP", 1025, 3329330);
   ObjectSetInteger(0, "butCAP", 6, 0);
   ObjectCreate(0, "butCAL", OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, "butCAL", 101, 3);
   ObjectSetString(0, "butCAL", 1001, "Arial");
   ObjectSetInteger(0, "butCAL", 100, 9);
   ObjectSetInteger(0, "butCAL", 102, 104);
   ObjectSetInteger(0, "butCAL", 103, 22);
   ObjectSetInteger(0, "butCAL", 1019, 102);
   ObjectSetInteger(0, "butCAL", 1020, 20);
   ObjectSetInteger(0, "butCAL", 208, 1);
   ObjectSetInteger(0, "butCAL", 207, 0);
   ObjectSetString(0, "butCAL", 999, "Close All Losses");
   ObjectSetInteger(0, "butCAL", 1018, 0);
   ObjectSetInteger(0, "butCAL", 1025, 255);
   ObjectSetInteger(0, "butCAL", 6, 0);
   if (InpManualInitGrid) {
      tmp_str00002 = "SELL";
      tmp_str00003 = "_lSELL";
      ObjectDelete(0, tmp_str00003);
      ObjectCreate(0, tmp_str00003, OBJ_BUTTON, 0, 100, 100);
      ObjectSetInteger(0, tmp_str00003, 102, 250);
      ObjectSetInteger(0, tmp_str00003, 103, 15);
      ObjectSetInteger(0, tmp_str00003, 1025, 8421504);
      ObjectSetInteger(0, tmp_str00003, 6, 16777215);
      ObjectSetInteger(0, tmp_str00003, 1019, 150);
      ObjectSetInteger(0, tmp_str00003, 1020, 35);
      ObjectSetInteger(0, tmp_str00003, 8, 0);
      ObjectSetString(0, tmp_str00003, 1001, "Arial");
      ObjectSetString(0, tmp_str00003, 999, tmp_str00002);
      ObjectSetInteger(0, tmp_str00003, 1000, 0);
      ObjectSetInteger(0, tmp_str00003, 9, 0);
      ObjectSetInteger(0, tmp_str00003, 17, 0);
      ObjectSetInteger(0, tmp_str00003, 208, 1);
      ObjectSetInteger(0, tmp_str00003, 207, 1);
      ObjectSetInteger(0, tmp_str00003, 1018, 0);
      tmp_str00004 = "BUY";
      tmp_str00005 = "_lBUY";
      ObjectDelete(0, tmp_str00005);
      ObjectCreate(0, tmp_str00005, OBJ_BUTTON, 0, 100, 100);
      ObjectSetInteger(0, tmp_str00005, 102, 420);
      ObjectSetInteger(0, tmp_str00005, 103, 15);
      ObjectSetInteger(0, tmp_str00005, 1025, 8421504);
      ObjectSetInteger(0, tmp_str00005, 6, 16777215);
      ObjectSetInteger(0, tmp_str00005, 1019, 150);
      ObjectSetInteger(0, tmp_str00005, 1020, 35);
      ObjectSetInteger(0, tmp_str00005, 8, 0);
      ObjectSetString(0, tmp_str00005, 1001, "Arial");
      ObjectSetString(0, tmp_str00005, 999, tmp_str00004);
      ObjectSetInteger(0, tmp_str00005, 1000, 0);
      ObjectSetInteger(0, tmp_str00005, 9, 0);
      ObjectSetInteger(0, tmp_str00005, 17, 0);
      ObjectSetInteger(0, tmp_str00005, 208, 1);
      ObjectSetInteger(0, tmp_str00005, 207, 1);
      ObjectSetInteger(0, tmp_str00005, 1018, 0);
      tmp_str00006 = "CLOSE ALL BUY";
      tmp_str00007 = "_lCLOSE ALL BUY";
      ObjectDelete(0, tmp_str00007);
      ObjectCreate(0, tmp_str00007, OBJ_BUTTON, 0, 100, 100);
      ObjectSetInteger(0, tmp_str00007, 102, 600);
      ObjectSetInteger(0, tmp_str00007, 103, 15);
      ObjectSetInteger(0, tmp_str00007, 1025, 8421504);
      ObjectSetInteger(0, tmp_str00007, 6, 16777215);
      ObjectSetInteger(0, tmp_str00007, 1019, 150);
      ObjectSetInteger(0, tmp_str00007, 1020, 35);
      ObjectSetInteger(0, tmp_str00007, 8, 0);
      ObjectSetString(0, tmp_str00007, 1001, "Arial");
      ObjectSetString(0, tmp_str00007, 999, tmp_str00006);
      ObjectSetInteger(0, tmp_str00007, 1000, 0);
      ObjectSetInteger(0, tmp_str00007, 9, 0);
      ObjectSetInteger(0, tmp_str00007, 17, 0);
      ObjectSetInteger(0, tmp_str00007, 208, 1);
      ObjectSetInteger(0, tmp_str00007, 207, 1);
      ObjectSetInteger(0, tmp_str00007, 1018, 0);
      tmp_str00008 = "CLOSE ALL SELL";
      tmp_str00009 = "_lCLOSE ALL SELL";
      ObjectDelete(0, tmp_str00009);
      ObjectCreate(0, tmp_str00009, OBJ_BUTTON, 0, 100, 100);
      ObjectSetInteger(0, tmp_str00009, 102, 770);
      ObjectSetInteger(0, tmp_str00009, 103, 15);
      ObjectSetInteger(0, tmp_str00009, 1025, 8421504);
      ObjectSetInteger(0, tmp_str00009, 6, 16777215);
      ObjectSetInteger(0, tmp_str00009, 1019, 150);
      ObjectSetInteger(0, tmp_str00009, 1020, 35);
      ObjectSetInteger(0, tmp_str00009, 8, 0);
      ObjectSetString(0, tmp_str00009, 1001, "Arial");
      ObjectSetString(0, tmp_str00009, 999, tmp_str00008);
      ObjectSetInteger(0, tmp_str00009, 1000, 0);
      ObjectSetInteger(0, tmp_str00009, 9, 0);
      ObjectSetInteger(0, tmp_str00009, 17, 0);
      ObjectSetInteger(0, tmp_str00009, 208, 1);
      ObjectSetInteger(0, tmp_str00009, 207, 1);
      ObjectSetInteger(0, tmp_str00009, 1018, 0);
   }
   Is_00248 = _Symbol;
   if (_Digits == 3 || _Digits == 5) {

      Id_00180 = (_Point * 10);
   }
   else {
      Id_00180 = _Point;
   }
   Id_00188 = (InpGridSize * Id_00180);
   Id_00190 = (InpTakeProfit * Id_00180);
   Ib_00145 = false;
   Ib_00146 = false;
   Ii_00148 = 0;
   Il_00198 = -1;
   Il_001A0 = -1;
   Ii_001B8 = 0;
   Id_001C0 = 0;
   if (_Digits == 3 || _Digits == 5) {

      Id_00200 = (_Point * 10);
   }
   else {
      Id_00200 = _Point;
   }
   Id_00208 = (InpGridSize * Id_00200);
   Id_00210 = (InpTakeProfit * Id_00200);
   Ib_001C8 = false;
   Ib_001C9 = false;
   Ii_001CC = 0;
   Il_00218 = -1;
   Il_00220 = -1;
   Ii_00230 = 0;
   Id_00238 = 0;
   Is_00270 = "";
   Ib_00268 = true;
   PrintFormat("Dhan ");
   ChartSetInteger(0, 12, 0);
   HideTestIndicators(true);
   Li_FFFFC = 0;
   return 0;
}

void OnTick()
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;
   string tmp_str00004;
   string tmp_str00005;
   string tmp_str00006;
   string tmp_str00007;
   string tmp_str00008;
   string tmp_str00009;
   string tmp_str0000A;
   string tmp_str0000B;
   string tmp_str0000C;
   string tmp_str0000D;
   string tmp_str0000E;
   string tmp_str0000F;
   string tmp_str00010;
   string tmp_str00011;
   string tmp_str00012;
   bool Lb_FFFFF;
   double Ld_FFFF0;
   double Ld_FFFE8;
   bool Lb_FFFE7;
   int Li_FFFE0;
   int Li_FFFDC;
   int Li_FFFD8;
   double Ld_FFFD0;

   ChartSetInteger(0, 28, 55295);
   ChartSetInteger(0, 29, 0);
   ChartSetInteger(0, 25, 55295);
   ChartSetInteger(0, 26, 55295);
   ChartSetInteger(0, 0, 1);
   ChartSetInteger(0, 17, 0);
   ChartSetInteger(0, 22, 55295);
   ChartSetInteger(0, 21, 0);
   ChartSetInteger(0, 27, 55295);

   func_1152();
   func_1153();
   Gd_00007 = AccountEquity();
   Gd_00007 = (Gd_00007 - AccountBalance());
   Gd_00007 = NormalizeDouble(((Gd_00007 / AccountBalance()) * 100), 2);
   tmp_str00001 = "Daily_DD" + _Symbol;
   tmp_str00001 = tmp_str00001 + "";
   tmp_str00002 = (string)InpMagic;
   tmp_str00001 = tmp_str00001 + tmp_str00002;
   tmp_str00001 = tmp_str00001 + "";
   tmp_str00002 = (string)InpMagic2;
   tmp_str00001 = tmp_str00001 + tmp_str00002;
   if ((Gd_00007 < GlobalVariableGet(tmp_str00001))) {
      tmp_str00002 = "Daily_DD" + _Symbol;
      tmp_str00002 = tmp_str00002 + "";
      tmp_str00003 = (string)InpMagic;
      tmp_str00002 = tmp_str00002 + tmp_str00003;
      tmp_str00002 = tmp_str00002 + "";
      tmp_str00003 = (string)InpMagic2;
      tmp_str00002 = tmp_str00002 + tmp_str00003;
      GlobalVariableSet(tmp_str00002, Gd_00007);
   }
   Gd_00008 = AccountEquity();
   Gd_00008 = (Gd_00008 - AccountBalance());
   Gd_00008 = NormalizeDouble(((Gd_00008 / AccountBalance()) * 100), 2);
   tmp_str00003 = "Monthly_DD" + _Symbol;
   tmp_str00003 = tmp_str00003 + "";
   tmp_str00004 = (string)InpMagic;
   tmp_str00003 = tmp_str00003 + tmp_str00004;
   tmp_str00003 = tmp_str00003 + "";
   tmp_str00004 = (string)InpMagic2;
   tmp_str00003 = tmp_str00003 + tmp_str00004;
   if ((Gd_00008 < GlobalVariableGet(tmp_str00003))) {
      tmp_str00004 = "Monthly_DD" + _Symbol;
      tmp_str00004 = tmp_str00004 + "";
      tmp_str00005 = (string)InpMagic;
      tmp_str00004 = tmp_str00004 + tmp_str00005;
      tmp_str00004 = tmp_str00004 + "";
      tmp_str00005 = (string)InpMagic2;
      tmp_str00004 = tmp_str00004 + tmp_str00005;
      GlobalVariableSet(tmp_str00004, Gd_00008);
   }
   if (IsTesting()) {
      Gl_00009 = TimeCurrent();
      if (Gl_00009 >= iTime(_Symbol, 1440, 0)) {
         Gl_00009 = TimeCurrent();
         Gl_0000A = iTime(_Symbol, 1440, 0) + 300;
         if (Gl_00009 <= Gl_0000A) {
            Gl_0000A = TimeCurrent();
            if (Gl_0000A == iTime(_Symbol, 1440, 0)) {
               tmp_str00005 = "Daily_DD" + _Symbol;
               tmp_str00005 = tmp_str00005 + "";
               tmp_str00006 = (string)InpMagic;
               tmp_str00005 = tmp_str00005 + tmp_str00006;
               tmp_str00005 = tmp_str00005 + "";
               tmp_str00006 = (string)InpMagic2;
               tmp_str00005 = tmp_str00005 + tmp_str00006;
               GlobalVariableSet(tmp_str00005, 0);
            }
         }
      }
      Gl_0000A = TimeCurrent();
      if (Gl_0000A >= iTime(_Symbol, 43200, 0)) {
         Gl_0000A = TimeCurrent();
         Gl_0000B = iTime(_Symbol, 43200, 0) + 300;
         if (Gl_0000A <= Gl_0000B) {
            Gl_0000B = TimeCurrent();
            if (Gl_0000B == iTime(_Symbol, 43200, 0)) {
               tmp_str00006 = "Monthly_DD" + _Symbol;
               tmp_str00006 = tmp_str00006 + "";
               tmp_str00007 = (string)InpMagic;
               tmp_str00006 = tmp_str00006 + tmp_str00007;
               tmp_str00006 = tmp_str00006 + "";
               tmp_str00007 = (string)InpMagic2;
               tmp_str00006 = tmp_str00006 + tmp_str00007;
               GlobalVariableSet(tmp_str00006, 0);
            }
         }
      }
   }
   Gl_0000B = TimeCurrent();
   if (Gl_0000B > StringToTime(Is_0BE88)) {
      Gi_0000B = (int)ChartGetInteger(0, 106, 0);
      Gi_0000B = Gi_0000B / 2;
      tmp_str00007 = "LICENSE EXPIRED !!. PLEASE CONTACT @JDP76 on Instagram ";
      tmp_str00008 = "EX";
      ObjectDelete(tmp_str00008);
      ObjectCreate(0, tmp_str00008, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      ObjectSet(tmp_str00008, OBJPROP_ANCHOR, 8);
      ObjectSet(tmp_str00008, OBJPROP_XDISTANCE, Gi_0000B);
      ObjectSet(tmp_str00008, OBJPROP_YDISTANCE, 8);
      ObjectSetText(tmp_str00008, tmp_str00007, 14, "Arial", 16776960);
      return;
   }
   ObjectDelete(0, "EX");
   Lb_FFFFF = true;
   if (Ii_001B8 == 0) {
      ObjectDelete("AvgA");
   }
   if (Ii_00230 == 0) {
      ObjectDelete("AvgB");
   }
   Gd_00027 = 0;
   Gi_00028 = OrdersTotal() - 1;
   Gi_00029 = Gi_00028;
   if (Gi_00028 >= 0) {
      do {
         if (OrderSelect(Gi_00029, 0, 0) && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderSymbol() == _Symbol) {
                  if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                     if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

                        Gd_00027 = (Gd_00027 + OrderProfit());
                     }
                  }
               }
            }
         }
         Gi_00029 = Gi_00029 - 1;
      } while (Gi_00029 >= 0);
   }
   Id_00280 = Gd_00027;
   if (InpUseTrailingStop) {
      Ld_FFFF0 = 0;
      Ld_FFFE8 = 0;
      Gi_0002A = InpMagic;
      Ld_FFFF0 = 0;
      Gi_0002B = OrdersTotal();
      Gi_0002C = 0;
      Gd_0002D = 0;
      Gd_0002E = 0;
      Gi_0002F = Gi_0002B - 1;
      Gi_00030 = Gi_0002F;
      if (Gi_0002F >= 0) {
         do {
            if (OrderSelect(Gi_00030, 0, 0) && OrderMagicNumber() == Gi_0002A && OrderSymbol() == Is_00248) {
               OrderTicket();
               Gi_0002F = OrderType();
               Gd_00031 = OrderOpenPrice();
               returned_double = OrderLots();
               Gd_00032 = returned_double;
               if (Gi_0002F == 0) {
                  Gd_0002D = (Gd_0002D + returned_double);
                  Gi_0002C = Gi_0002C + 1;
                  Ld_FFFF0 = ((Gd_00031 * returned_double) + Ld_FFFF0);
               }
               if (Gi_0002F == 1) {
                  Gd_0002E = (Gd_0002E + Gd_00032);
                  Gi_0002C = Gi_0002C + 1;
                  Ld_FFFF0 = ((Gd_00031 * Gd_00032) + Ld_FFFF0);
               }
            }
            Gi_00030 = Gi_00030 - 1;
         } while (Gi_00030 >= 0);
      }
      if (Gi_0002C > 0) {
         Ld_FFFF0 = NormalizeDouble((Ld_FFFF0 / (Gd_0002D + Gd_0002E)), _Digits);
         Gb_00033 = true;
      }
      else {
         Gb_00033 = false;
      }
      if (Gb_00033) {
         func_1116(InpTrailStart, InpTrailStop, Ld_FFFF0, InpMagic);
      }
      Gi_00035 = InpMagic2;
      Ld_FFFE8 = 0;
      Gi_00036 = OrdersTotal();
      Gi_00037 = 0;
      Gd_00038 = 0;
      Gd_00039 = 0;
      Gi_0003A = Gi_00036 - 1;
      Gi_0003B = Gi_0003A;
      if (Gi_0003A >= 0) {
         do {
            if (OrderSelect(Gi_0003B, 0, 0) && OrderMagicNumber() == Gi_00035 && OrderSymbol() == Is_00248) {
               OrderTicket();
               Gi_0003A = OrderType();
               Gd_0003C = OrderOpenPrice();
               returned_double = OrderLots();
               Gd_0003D = returned_double;
               if (Gi_0003A == 0) {
                  Gd_00038 = (Gd_00038 + returned_double);
                  Gi_00037 = Gi_00037 + 1;
                  Ld_FFFE8 = ((Gd_0003C * returned_double) + Ld_FFFE8);
               }
               if (Gi_0003A == 1) {
                  Gd_00039 = (Gd_00039 + Gd_0003D);
                  Gi_00037 = Gi_00037 + 1;
                  Ld_FFFE8 = ((Gd_0003C * Gd_0003D) + Ld_FFFE8);
               }
            }
            Gi_0003B = Gi_0003B - 1;
         } while (Gi_0003B >= 0);
      }
      if (Gi_00037 > 0) {
         Ld_FFFE8 = NormalizeDouble((Ld_FFFE8 / (Gd_00038 + Gd_00039)), _Digits);
         Gb_0003E = true;
      }
      else {
         Gb_0003E = false;
      }
      if (Gb_0003E) {
         func_1116(InpTrailStart, InpTrailStop, Ld_FFFE8, InpMagic2);
      }
   }
   if (InpCloseAllNow) {
      Gi_0003F = InpMagic;
      Gi_00040 = OrdersTotal() - 1;
      Gi_00041 = Gi_00040;
      if (Gi_00040 >= 0) {
         do {
            if (OrderSelect(Gi_00041, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0003F) {
                  if (OrderType() == OP_BUY) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                  }
                  if (OrderType() == OP_SELL) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                  }
               }
               Sleep(1000);
            }
            Gi_00041 = Gi_00041 - 1;
         } while (Gi_00041 >= 0);
      }
      Gi_00045 = InpMagic2;
      Gi_00046 = OrdersTotal() - 1;
      Gi_00047 = Gi_00046;
      if (Gi_00046 >= 0) {
         do {
            if (OrderSelect(Gi_00047, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00045) {
                  if (OrderType() == OP_BUY) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                  }
                  if (OrderType() == OP_SELL) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                  }
               }
               Sleep(1000);
            }
            Gi_00047 = Gi_00047 - 1;
         } while (Gi_00047 >= 0);
      }
      InpManualInitGrid = true;
   }
   if (InpUseTakeEquityStop == true && (Id_00280 >= InpProfitCloseandSTOP)) {
      Gi_0004B = InpMagic;
      Gi_0004C = OrdersTotal() - 1;
      Gi_0004D = Gi_0004C;
      if (Gi_0004C >= 0) {
         do {
            if (OrderSelect(Gi_0004D, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0004B) {
                  if (OrderType() == OP_BUY) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                  }
                  if (OrderType() == OP_SELL) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                  }
               }
               Sleep(1000);
            }
            Gi_0004D = Gi_0004D - 1;
         } while (Gi_0004D >= 0);
      }
      Gi_00051 = InpMagic2;
      Gi_00052 = OrdersTotal() - 1;
      Gi_00053 = Gi_00052;
      if (Gi_00052 >= 0) {
         do {
            if (OrderSelect(Gi_00053, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00051) {
                  if (OrderType() == OP_BUY) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                  }
                  if (OrderType() == OP_SELL) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                  }
               }
               Sleep(1000);
            }
            Gi_00053 = Gi_00053 - 1;
         } while (Gi_00053 >= 0);
      }
   }
   Gi_00057 = InpMagic2;
   Gd_00058 = 0;
   Gi_00059 = 0;
   Gi_0005A = 0;
   Gi_0005B = OrdersTotal() - 1;
   Gi_0005C = Gi_0005B;
   if (Gi_0005B >= 0) {
      do {
         if (OrderSelect(Gi_0005C, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00057 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00057 && OrderType() == OP_SELL) {
            Gi_00059 = OrderTicket();
            if (Gi_00059 > Gi_0005A) {
               Gd_00058 = (Gd_00058 + OrderLots());
               Gi_0005A = Gi_00059;
            }
         }
         Gi_0005C = Gi_0005C - 1;
      } while (Gi_0005C >= 0);
   }
   Id_00238 = Gd_00058;
   Gi_0005B = InpMagic;
   Gd_0005D = 0;
   Gi_0005E = 0;
   Gi_0005F = 0;
   Gi_00060 = OrdersTotal() - 1;
   Gi_00061 = Gi_00060;
   if (Gi_00060 >= 0) {
      do {
         if (OrderSelect(Gi_00061, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0005B && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0005B && OrderType() == OP_BUY) {
            Gi_0005E = OrderTicket();
            if (Gi_0005E > Gi_0005F) {
               Gd_0005D = (Gd_0005D + OrderLots());
               Gi_0005F = Gi_0005E;
            }
         }
         Gi_00061 = Gi_00061 - 1;
      } while (Gi_00061 >= 0);
   }
   Id_001C0 = Gd_0005D;
   if (InpManualInitGrid) {
      if ((Gd_0005D > 0) || InpEnableEngineA == false) {

         ObjectSetInteger(0, "_lBUY", 1025, 8421504);
         ObjectSetInteger(0, "_lCLOSE ALL BUY", 1025, 32768);
      }
      else {
         ObjectSetInteger(0, "_lBUY", 1025, 16711680);
         ObjectSetInteger(0, "_lCLOSE ALL BUY", 1025, 8421504);
      }
      Gb_00060 = (Id_00238 > 0);
      if (Gb_00060 || InpEnableEngineB == false) {

         ObjectSetInteger(0, "_lSELL", 1025, 8421504);
         ObjectSetInteger(0, "_lCLOSE ALL SELL", 1025, 32768);
      }
      else {
         ObjectSetInteger(0, "_lSELL", 1025, 255);
         ObjectSetInteger(0, "_lCLOSE ALL SELL", 1025, 8421504);
      }
      if (ObjectGetInteger(0, "_lBUY", 1018, 0) != 0) {
         Gb_00060 = (Ii_001B8 > 0);
         if (Gb_00060 != true) {
            Gb_00060 = !InpEnableEngineA;
         }
         if (Gb_00060 != true) {
            tmp_str00009 = "A";
            func_1096(tmp_str00009, 1, false, 1, InpMagic, Ii_001B8, Id_001A8, Ib_00145, Ib_00146, Ii_00148, Ii_0014C, Ii_00150, Id_00158, Id_00160, Id_00168, Id_00170, Id_00178, Id_00180, Id_00188, Id_00190, Il_00198, Il_001A0, Id_001B0);
            ObjectSetInteger(0, "_lBUY", 1018, 0);
         }
      }
      if (ObjectGetInteger(0, "_lSELL", 1018, 0) != 0) {
         Gb_00060 = (Ii_00230 > 0);
         if (Gb_00060 != true) {
            Gb_00060 = !InpEnableEngineA;
         }
         if (Gb_00060 != true) {
            tmp_str0000A = "B";
            func_1096(tmp_str0000A, -1, false, 1, InpMagic2, Ii_00230, Id_00228, Ib_001C8, Ib_001C9, Ii_001CC, Ii_001D0, Ii_001D4, Id_001D8, Id_001E0, Id_001E8, Id_001F0, Id_001F8, Id_00200, Id_00208, Id_00210, Il_00218, Il_00220, Id_00240);
            ObjectSetInteger(0, "_lSELL", 1018, 0);
         }
      }
      if (ObjectGetInteger(0, "_lCLOSE ALL SELL", 1018, 0) != 0) {
         Gi_00060 = InpMagic2;
         Gi_00062 = OrdersTotal() - 1;
         Gi_00063 = Gi_00062;
         if (Gi_00062 >= 0) {
            do {
               if (OrderSelect(Gi_00063, 0, 0) && OrderSymbol() == _Symbol) {
                  if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00060) {
                     if (OrderType() == OP_BUY) {
                        order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                     }
                     if (OrderType() == OP_SELL) {
                        order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                     }
                  }
                  Sleep(1000);
               }
               Gi_00063 = Gi_00063 - 1;
            } while (Gi_00063 >= 0);
         }
         ObjectSetInteger(0, "_lCLOSE ALL SELL", 1018, 0);
      }
      if (ObjectGetInteger(0, "_lCLOSE ALL BUY", 1018, 0) != 0) {
         Gi_00067 = InpMagic;
         Gi_00068 = OrdersTotal() - 1;
         Gi_00069 = Gi_00068;
         if (Gi_00068 >= 0) {
            do {
               if (OrderSelect(Gi_00069, 0, 0) && OrderSymbol() == _Symbol) {
                  if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00067) {
                     if (OrderType() == OP_BUY) {
                        order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                     }
                     if (OrderType() == OP_SELL) {
                        order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                     }
                  }
                  Sleep(1000);
               }
               Gi_00069 = Gi_00069 - 1;
            } while (Gi_00069 >= 0);
         }
         ObjectSetInteger(0, "_lCLOSE ALL BUY", 1018, 0);
      }
   }
   Gi_0006D = 0;
   Gi_0006E = OrdersTotal() - 1;
   Gi_0006F = Gi_0006E;
   if (Gi_0006E >= 0) {
      do {
         if (OrderSelect(Gi_0006F, 0, 0) && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderSymbol() == _Symbol) {
                  if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                     if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                        Gi_0006D = Gi_0006D + 1;
                     }
                  }
               }
            }
         }
         Gi_0006F = Gi_0006F - 1;
      } while (Gi_0006F >= 0);
   }
   if (Gi_0006D == 0) {
      Gi_0006E = GetLastError();
      if (Gi_0006E == 134 && InpCloseRemoveEA) {
         ExpertRemove();
         ChartClose(0);
         return;
      }
   }
   if (InpUseEquityStop) {
      if ((Id_00280 < 0)) {
         Gd_0006E = fabs(Id_00280);
         Gd_00070 = (InpTotalEquityRisk / 100);
         if ((Gd_0006E > (Gd_00070 * AccountEquity()))) {
            if (InpCloseAllEquityLoss) {
               Gi_00070 = InpMagic;
               Gi_00071 = OrdersTotal() - 1;
               Gi_00072 = Gi_00071;
               if (Gi_00071 >= 0) {
                  do {
                     if (OrderSelect(Gi_00072, 0, 0) && OrderSymbol() == _Symbol) {
                        if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00070) {
                           if (OrderType() == OP_BUY) {
                              order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                           }
                           if (OrderType() == OP_SELL) {
                              order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                           }
                        }
                        Sleep(1000);
                     }
                     Gi_00072 = Gi_00072 - 1;
                  } while (Gi_00072 >= 0);
               }
               Gi_00076 = InpMagic2;
               Gi_00077 = OrdersTotal() - 1;
               Gi_00078 = Gi_00077;
               if (Gi_00077 >= 0) {
                  do {
                     if (OrderSelect(Gi_00078, 0, 0) && OrderSymbol() == _Symbol) {
                        if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00076) {
                           if (OrderType() == OP_BUY) {
                              order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                           }
                           if (OrderType() == OP_SELL) {
                              order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                           }
                        }
                        Sleep(1000);
                     }
                     Gi_00078 = Gi_00078 - 1;
                  } while (Gi_00078 >= 0);
               }
               Print("Closed All to Stop Out");
               if (InpCloseRemoveEA) {
                  ExpertRemove();
                  ChartClose(0);
                  return;
               }
            }
            if (InpAlertPushEquityLoss) {
               tmp_str0000B = (string)Id_00280;
               tmp_str0000B = "EquityLoss Alert " + tmp_str0000B;
               SendNotification(tmp_str0000B);
            }
            Il_00288 = iTime(NULL, 43200, 0);
            Is_00270 = Is_00270 + "Filter UseEquityStop ON \n";
            return;
         }
      }
      Il_00288 = -1;
   }
   if (!IsTesting()) {
      if (Ii_002B8 == 1) {
         func_1093('');
      }
      else {
         func_1093('');
      }
   }
   else {
      func_1093('');
   }
   RefreshRates();
   Is_00270 = "";
   if (Il_00288 == iTime(NULL, 43200, 0) && (Id_00280 < 0)) {
      Gd_0007C = fabs(Id_00280);
      Gd_0007D = (InpTotalEquityRisk / 100);
      Gb_0007D = (Gd_0007C > (Gd_0007D * AccountEquity()));
      if (Gb_0007D) {
         Is_00270 = "Filter EquitySTOP  ON \n";
         Lb_FFFFF = false;
      }
   }
   Id_00258 = (MarketInfo(_Symbol, MODE_SPREAD) * Id_00200);
   Gi_0007D = (int)MarketInfo(_Symbol, MODE_SPREAD);
   if (Gi_0007D > InpMaxSpread) {
      Is_00270 = Is_00270 + "Filter InpMaxSpread ON \n";
      Lb_FFFFF = false;
   }
   if (UseNewsFilter) {
      if (Input_NewsReader_000002C0.m_16) {
         Gb_0007D = false;
      }
      else {
         NewsDetails Local_Struct_FFFFFF2C[];
         Gb_0007D = Input_NewsReader_000002C0.func_1083(0, 0, Local_Struct_FFFFFF2C);
         ArrayFree(Local_Struct_FFFFFF2C);
      }
      Lb_FFFE7 = Gb_0007D;
      if (Gb_0007D) {
         Is_00270 = Is_00270 + "Filter News ON \n";
         Lb_FFFFF = false;
         if (NewsClose) {
            Gi_00080 = 0;
            Gi_00081 = OrdersTotal() - 1;
            Gi_00082 = Gi_00081;
            if (Gi_00081 >= 0) {
               do {
                  if (OrderSelect(Gi_00082, 0, 0) && OrderSymbol() == _Symbol) {
                     if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                        if (OrderSymbol() == _Symbol) {
                           if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                              if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                                 Gi_00080 = Gi_00080 + 1;
                              }
                           }
                        }
                     }
                  }
                  Gi_00082 = Gi_00082 - 1;
               } while (Gi_00082 >= 0);
            }
            if (Gi_00080 > 0) {
               Gi_00081 = OrdersTotal() - 1;
               Gi_00083 = Gi_00081;
               if (Gi_00081 >= 0) {
                  do {
                     if (OrderSelect(Gi_00083, 0, 0) && OrderSymbol() == _Symbol) {
                        if (OrderSymbol() == _Symbol) {
                           if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                              if (OrderType() == OP_BUY) {
                                 order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                              }
                              if (OrderType() == OP_SELL) {
                                 order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                              }
                           }
                        }
                        Sleep(1000);
                     }
                     Gi_00083 = Gi_00083 - 1;
                  } while (Gi_00083 >= 0);
               }
               Print("Closed trades due to detected news");
            }
         }
      }
   }
   if (InpUtilizeTimeFilter) {
      Gb_00087 = false;
      Gl_00088 = TimeCurrent();
      tmp_str0000C = DoubleToString(Year(), 0);
      tmp_str0000C = tmp_str0000C + ".";
      tmp_str0000C = tmp_str0000C + DoubleToString(Month(), 0);
      tmp_str0000C = tmp_str0000C + ".";
      tmp_str0000C = tmp_str0000C + DoubleToString(Day(), 0);
      tmp_str0000C = tmp_str0000C + " ";
      tmp_str0000C = tmp_str0000C + InpStartHour;
      Gl_00089 = StringToTime(tmp_str0000C);
      tmp_str0000D = DoubleToString(Year(), 0);
      tmp_str0000D = tmp_str0000D + ".";
      tmp_str0000D = tmp_str0000D + DoubleToString(Month(), 0);
      tmp_str0000D = tmp_str0000D + ".";
      tmp_str0000D = tmp_str0000D + DoubleToString(Day(), 0);
      tmp_str0000D = tmp_str0000D + " ";
      tmp_str0000D = tmp_str0000D + InpEndHour;
      Gl_0008A = StringToTime(tmp_str0000D);
      if ((InpTrade_in_Monday == true && TimeDayOfWeek(Time[0]) == 1)
         || (InpTrade_in_Tuesday == true && TimeDayOfWeek(Time[0]) == 2)
         || (InpTrade_in_Wednesday == true && TimeDayOfWeek(Time[0]) == 3)
         || (InpTrade_in_Thursday == true && TimeDayOfWeek(Time[0]) == 4)
         || (InpTrade_in_Friday == true && TimeDayOfWeek(Time[0]) == 5)) {

         if (Gl_00089 > Gl_0008A) {
            if (Gl_00088 >= Gl_00089 || Gl_00088 <= Gl_0008A) {

               Gb_00087 = true;
            }
         }
         else {
            if (Gl_00088 >= Gl_00089 && Gl_00088 <= Gl_0008A) {
               Gb_00087 = true;
            }
         }
      }
      if (Gb_00087 != true) {
         Is_00270 = Is_00270 + "Filter TimeFilter ON \n";
         Lb_FFFFF = false;
      }
   }
   Li_FFFE0 = 0;
   Li_FFFDC = 0;
   Li_FFFD8 = 0;
   Gd_00090 = iClose(NULL, 0, 0);
   if ((Gd_00090 > iMA(NULL, InpMaFrame, InpMaPeriod, 0, InpMaMethod, InpMaPrice, InpMaShift))) {
      Li_FFFDC = 1;
   }
   Gd_00090 = iClose(NULL, 0, 0);
   if ((Gd_00090 < iMA(NULL, InpMaFrame, InpMaPeriod, 0, InpMaMethod, InpMaPrice, InpMaShift))) {
      Li_FFFDC = -1;
   }
   Gi_00090 = 0;
   if (EnableSinalHILO != true) {
      Gi_00090 = 0;
   }
   Id_000F0 = iMA(NULL, InpHILOFrame, InpHILOPeriod, 0, InpHILOMethod, 3, InpHILOShift);
   Id_000F8 = iMA(NULL, InpHILOFrame, InpHILOPeriod, 0, InpHILOMethod, 2, InpHILOShift);
   Id_00100 = (Id_000F8 - Id_000F0);
   Ib_00108 = (Bid >= ((Id_00100 / 2) + Id_000F0));
   if ((Bid < Id_000F0)) {
      Gi_00090 = -1;
   }
   else {
      if ((Bid > Id_000F8)) {
         Gi_00090 = 1;
      }
   }
   if (InpHILOFilterInverter) {
      Gi_00091 = -Gi_00090;
      Gi_00090 = Gi_00091;
   }
   Li_FFFD8 = Gi_00090;
   Gi_00091 = Gi_00090 + Li_FFFDC;
   if (EnableSinalHILO != true) {
      Gi_00092 = 0;
   }
   else {
      Gi_00092 = 1;
   }
   Gi_00093 = Gi_00092 + 1;
   Li_FFFE0 = Gi_00091 / Gi_00093;
   Ld_FFFD0 = 0;
   if (Ii_001B8 == 0) {
      Il_001A0 = -1;
   }
   if (InpEnableEngineB == false && InpEnableEngineA == false) {
      if (Il_001A0 == iTime(NULL, InpTimeframeEquityCaution, 0)) {
         Is_00270 = Is_00270 + "Filter EquityCaution S ON \n";
         Lb_FFFFF = false;
      }
      tmp_str0000E = "S";
      func_1096(tmp_str0000E, Li_FFFE0, Lb_FFFFF, Ld_FFFD0, InpMagic, Ii_001B8, Id_001A8, Ib_00145, Ib_00146, Ii_00148, Ii_0014C, Ii_00150, Id_00158, Id_00160, Id_00168, Id_00170, Id_00178, Id_00180, Id_00188, Id_00190, Il_00198, Il_001A0, Id_001B0);
      return;
   }
   if (InpManualInitGrid != true) {
      if (Il_001A0 == iTime(NULL, InpTimeframeEquityCaution, 0) && Il_00220 != iTime(NULL, InpTimeframeEquityCaution, 0)) {
         Is_00270 = Is_00270 + "Filter EquityCaution A ON \n";
         Lb_FFFFF = false;
      }
      if (Ii_00230 > InpHedgex && InpHedgex != 0) {
         Ld_FFFD0 = (Id_00238 / InpGridFactor);//lot / gridfactor
      }
      if (Li_FFFE0 == 1 && InpEnableEngineA) {
         tmp_str0000F = "A";
         func_1096(tmp_str0000F, 1, Lb_FFFFF, Ld_FFFD0, InpMagic, Ii_001B8, Id_001A8, Ib_00145, Ib_00146, Ii_00148, Ii_0014C, Ii_00150, Id_00158, Id_00160, Id_00168, Id_00170, Id_00178, Id_00180, Id_00188, Id_00190, Il_00198, Il_001A0, Id_001B0);
      }
      if (Ii_00230 == 0) {
         Il_00220 = -1;
      }
      if (Il_00220 == iTime(NULL, InpTimeframeEquityCaution, 0) && Il_001A0 != iTime(NULL, InpTimeframeEquityCaution, 0)) {
         Is_00270 = Is_00270 + "Filter EquityCaution B ON \n";
         Lb_FFFFF = false;
      }
      if (Ii_001B8 > InpHedgex && InpHedgex != 0) {
         Ld_FFFD0 = (Id_001C0 / InpGridFactor);
      }
      if (Li_FFFE0 != -1) return;
      if (InpEnableEngineB == false) return;
      tmp_str00010 = "B";
      func_1096(tmp_str00010, -1, Lb_FFFFF, Ld_FFFD0, InpMagic2, Ii_00230, Id_00228, Ib_001C8, Ib_001C9, Ii_001CC, Ii_001D0, Ii_001D4, Id_001D8, Id_001E0, Id_001E8, Id_001F0, Id_001F8, Id_00200, Id_00208, Id_00210, Il_00218, Il_00220, Id_00240);
      return;
   }
   tmp_str00011 = "A";
   func_1096(tmp_str00011, 0, Lb_FFFFF, Ld_FFFD0, InpMagic, Ii_001B8, Id_001A8, Ib_00145, Ib_00146, Ii_00148, Ii_0014C, Ii_00150, Id_00158, Id_00160, Id_00168, Id_00170, Id_00178, Id_00180, Id_00188, Id_00190, Il_00198, Il_001A0, Id_001B0);
   tmp_str00012 = "B";
   func_1096(tmp_str00012, 0, Lb_FFFFF, Ld_FFFD0, InpMagic2, Ii_00230, Id_00228, Ib_001C8, Ib_001C9, Ii_001CC, Ii_001D0, Ii_001D4, Id_001D8, Id_001E0, Id_001E8, Id_001F0, Id_001F8, Id_00200, Id_00208, Id_00210, Il_00218, Il_00220, Id_00240);

}

void OnDeinit(const int reason)
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;

   ObjectsDeleteAll(0, "MTlic_", -1, -1);
   Comment("");
   if (reason == 4 || reason == 1) {

      tmp_str00000 = "Daily_DD" + _Symbol;
      tmp_str00000 = tmp_str00000 + "";
      tmp_str00001 = (string)InpMagic;
      tmp_str00000 = tmp_str00000 + tmp_str00001;
      tmp_str00000 = tmp_str00000 + "";
      tmp_str00001 = (string)InpMagic2;
      tmp_str00000 = tmp_str00000 + tmp_str00001;
      GlobalVariableSet(tmp_str00000, 0);
      tmp_str00001 = "Monthly_DD" + _Symbol;
      tmp_str00001 = tmp_str00001 + "";
      tmp_str00002 = (string)InpMagic;
      tmp_str00001 = tmp_str00001 + tmp_str00002;
      tmp_str00001 = tmp_str00001 + "";
      tmp_str00002 = (string)InpMagic2;
      tmp_str00001 = tmp_str00001 + tmp_str00002;
      GlobalVariableSet(tmp_str00001, 0);
   }
   func_1094();
   ObjectDelete("butN4");
   ObjectDelete("butCAO");
   ObjectDelete("butCAP");
   ObjectDelete("butCAL");
   ObjectDelete("Market_Price_Label");
   //ObjectDelete("Time_Label");
   ObjectDelete("TM");
   ObjectDelete("Porcent_Price_Label");
   ObjectDelete("Spread_Price_Label");
   ObjectDelete("Simbol_Price_Label");
   ObjectDelete("Max_Range");
   ObjectDelete("Min_Range");
   HideTestIndicators(false);
   EventKillTimer();
}

void OnTimer()
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;

   Gl_00000 = TimeCurrent();
   if (Gl_00000 >= iTime(_Symbol, 1440, 0)) {
      Gl_00000 = TimeCurrent();
      Gl_00001 = iTime(_Symbol, 1440, 0) + 300;
      if (Gl_00000 <= Gl_00001) {
         tmp_str00000 = "Daily_DD" + _Symbol;
         tmp_str00000 = tmp_str00000 + "";
         tmp_str00001 = (string)InpMagic;
         tmp_str00000 = tmp_str00000 + tmp_str00001;
         tmp_str00000 = tmp_str00000 + "";
         tmp_str00001 = (string)InpMagic2;
         tmp_str00000 = tmp_str00000 + tmp_str00001;
         GlobalVariableSet(tmp_str00000, 0);
      }
   }
   Gl_00001 = TimeCurrent();
   if (Gl_00001 >= iTime(_Symbol, 43200, 0)) {
      Gl_00001 = TimeCurrent();
      Gl_00002 = iTime(_Symbol, 43200, 0) + 300;
      if (Gl_00001 <= Gl_00002) {
         tmp_str00001 = "Monthly_DD" + _Symbol;
         tmp_str00001 = tmp_str00001 + "";
         tmp_str00002 = (string)InpMagic;
         tmp_str00001 = tmp_str00001 + tmp_str00002;
         tmp_str00001 = tmp_str00001 + "";
         tmp_str00002 = (string)InpMagic2;
         tmp_str00001 = tmp_str00001 + tmp_str00002;
         GlobalVariableSet(tmp_str00001, 0);
      }
   }
   if (Draw_Default_Range == false) return;
   if (IsTradeAllowed()) {
      Gi_00002 = 4;
      Gi_00003 = 0;
      Gd_00004 = ((Start_Range * _Point) + Ask);
      Gd_00005 = Gd_00004;
      tmp_str00002 = "Max_Range";
      Gi_00006 = 55295;
      if ((Gd_00004 <= 0)) {
         Gd_00005 = Bid;
      }
      ObjectCreate(0, tmp_str00002, OBJ_HLINE, 0, 0, Gd_00005);
      ObjectSet(tmp_str00002, OBJPROP_COLOR, Gi_00006);
      ObjectSet(tmp_str00002, OBJPROP_STYLE, Gi_00003);
      ObjectSet(tmp_str00002, OBJPROP_WIDTH, Gi_00002);
      Gi_00004 = 4;
      Gi_00007 = 0;
      Gd_00008 = (Start_Range * _Point);
      Gd_00008 = (Bid - Gd_00008);
      Gd_00009 = Gd_00008;
      tmp_str00003 = "Min_Range";
      Gi_0000A = 55295;
      if ((Gd_00008 <= 0)) {
         Gd_00009 = Bid;
      }
      ObjectCreate(0, tmp_str00003, OBJ_HLINE, 0, 0, Gd_00009);
      ObjectSet(tmp_str00003, OBJPROP_COLOR, Gi_0000A);
      ObjectSet(tmp_str00003, OBJPROP_STYLE, Gi_00007);
      ObjectSet(tmp_str00003, OBJPROP_WIDTH, Gi_00004);
      if (Ib_0BE94 != false) {
         if (Close_all_at_range != false) {
            Ib_0BE95 = true;
            Gi_00008 = InpMagic;
            Gi_0000B = 1;
            Gi_0000C = OrdersTotal() - 1;
            Gi_0000D = Gi_0000C;
            if (Gi_0000C >= 0) {
               do {
                  if (Gi_0000B == 0 || (Gi_0000B == 1 && _Symbol == OrderSymbol())) {

                     if (OrderSelect(Gi_0000D, 0, 0) && OrderMagicNumber() == Gi_00008) {
                        if (OrderType() == OP_BUY && _Symbol == OrderSymbol()) {
                           order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                        }
                        if (OrderType() == OP_SELL && _Symbol == OrderSymbol()) {
                           order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                        }
                     }
                  }
                  Gi_0000D = Gi_0000D - 1;
               } while (Gi_0000D >= 0);
            }
            Gi_00011 = InpMagic2;
            Gi_00012 = 1;
            Gi_00013 = OrdersTotal() - 1;
            Gi_00014 = Gi_00013;
            if (Gi_00013 >= 0) {
               do {
                  if (Gi_00012 == 0 || (Gi_00012 == 1 && _Symbol == OrderSymbol())) {

                     if (OrderSelect(Gi_00014, 0, 0) && OrderMagicNumber() == Gi_00011) {
                        if (OrderType() == OP_BUY && _Symbol == OrderSymbol()) {
                           order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                        }
                        if (OrderType() == OP_SELL && _Symbol == OrderSymbol()) {
                           order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                        }
                     }
                  }
                  Gi_00014 = Gi_00014 - 1;
               } while (Gi_00014 >= 0);
            }
            Alert("All trades Closed on Range Hit. Auto Trading Disbaled.");
            if (OrdersTotal() == 0) {
               Ib_0BE94 = false;
               Gb_00018 = TerminalInfoInteger(8);
               if (Gb_00018 != 0) {
                  PostMessageW(GetAncestor((int)ChartGetInteger(0, 103, 0), 2), 273, 33020, 0);
               }
            }
         }
      }
      else {
         Ib_0BE95 = false;
      }
   }
   else {
      ObjectDelete(0, "Max_Range");
      ObjectDelete(0, "Min_Range");
   }
   if ((ObjectGet("Max_Range", OBJPROP_PRICE1) != 0) && (Bid > ObjectGet("Max_Range", OBJPROP_PRICE1))) {
      Ib_0BE94 = true;
   }
   if ((ObjectGet("Min_Range", OBJPROP_PRICE1) == 0)) return;
   if ((Bid >= ObjectGet("Min_Range", OBJPROP_PRICE1))) return;
   Ib_0BE94 = true;

}

void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
{
   if (sparam == "butCAO") {
      func_1137(1);
   }
   if (sparam == "butCAP") {
      func_1137(2);
   }
   if (sparam == "butCAL") {
      func_1137(3);
   }
   if (sparam != "butN4") return;
   func_1137(4);

}


void MTLic_DrawLabel()
{
   int Li_FFFFC;
   int Li_FFFF8;
   string Ls_FFFE8;

   Li_FFFFC = 2;
   Li_FFFF8 = 2;
   if (Ii_00048 == 1) {
      Li_FFFFC = 3;
      Li_FFFF8 = 4;
   }
   Ls_FFFE8 = "MTlic_title";
   if (MQLInfoInteger(2) == 4) {
      if (ObjectFind(Ls_FFFE8) < 0) {
         ObjectCreate(0, Ls_FFFE8, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      }
   }
   else {
      if (ObjectFind(Ls_FFFE8) < 0) {
         ObjectCreate(0, Ls_FFFE8, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      }
   }
   ObjectSetInteger(0, Ls_FFFE8, 6, 16119285);
   if (Is_00020 == "") {
      Gi_00000 = Ii_00044 + 13;
      ObjectSetInteger(0, Ls_FFFE8, 102, Gi_00000);
      Gi_00000 = Ii_00040 + 23;
      ObjectSetInteger(0, Ls_FFFE8, 103, Gi_00000);
   }
   else {
      Gi_00000 = Ii_00044 + 13;
      ObjectSetInteger(0, Ls_FFFE8, 102, Gi_00000);
      Gi_00000 = Ii_00040 + 32;
      ObjectSetInteger(0, Ls_FFFE8, 103, Gi_00000);
   }
   ObjectSetString(0, Ls_FFFE8, 999, Is_00010);
   ObjectSetInteger(0, Ls_FFFE8, 100, 11);
   ObjectSetInteger(0, Ls_FFFE8, 207, 30);
   ObjectSetInteger(0, Ls_FFFE8, 101, Li_FFFFC);
   ObjectSetInteger(0, Ls_FFFE8, 1011, Li_FFFF8);
   ObjectSetInteger(0, Ls_FFFE8, 1000, 0);
   Ls_FFFE8 = "MTlic_line2";
   if (MQLInfoInteger(2) == 4) {
      if (ObjectFind(Ls_FFFE8) < 0) {
         ObjectCreate(0, Ls_FFFE8, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      }
   }
   else {
      if (ObjectFind(Ls_FFFE8) < 0) {
         ObjectCreate(0, Ls_FFFE8, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      }
   }
   ObjectSetInteger(0, Ls_FFFE8, 6, 16119285);
   Gi_00000 = Ii_00044 + 13;
   ObjectSetInteger(0, Ls_FFFE8, 102, Gi_00000);
   Gi_00000 = Ii_00040 + 8;
   ObjectSetInteger(0, Ls_FFFE8, 103, Gi_00000);
   ObjectSetString(0, Ls_FFFE8, 999, "calculating remaining days...");
   ObjectSetInteger(0, Ls_FFFE8, 100, 7);
   ObjectSetInteger(0, Ls_FFFE8, 207, 30);
   ObjectSetInteger(0, Ls_FFFE8, 101, Li_FFFFC);
   ObjectSetInteger(0, Ls_FFFE8, 1011, Li_FFFF8);
   ObjectSetInteger(0, Ls_FFFE8, 1000, 0);
   ObjectSetString(0, Ls_FFFE8, 999, Is_00070);
   Ls_FFFE8 = "MTlic_line1";
   if (MQLInfoInteger(2) == 4) {
      if (ObjectFind(Ls_FFFE8) < 0) {
         ObjectCreate(0, Ls_FFFE8, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      }
   }
   else {
      if (ObjectFind(Ls_FFFE8) < 0) {
         ObjectCreate(0, Ls_FFFE8, OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
      }
   }
   ObjectSetInteger(0, Ls_FFFE8, 6, 16119285);
   Gi_00000 = Ii_00044 + 13;
   ObjectSetInteger(0, Ls_FFFE8, 102, Gi_00000);
   Gi_00000 = Ii_00040 + 20;
   ObjectSetInteger(0, Ls_FFFE8, 103, Gi_00000);
   ObjectSetString(0, Ls_FFFE8, 999, Is_00020);
   ObjectSetInteger(0, Ls_FFFE8, 100, 7);
   ObjectSetInteger(0, Ls_FFFE8, 207, 30);
   ObjectSetInteger(0, Ls_FFFE8, 101, Li_FFFFC);
   ObjectSetInteger(0, Ls_FFFE8, 1011, Li_FFFF8);
   ObjectSetInteger(0, Ls_FFFE8, 1000, 0);
   ChartRedraw(0);
}

void func_1093(char Fa_s_00)
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;
   string tmp_str00004;
   string tmp_str00005;
   string tmp_str00006;
   string tmp_str00007;
   string tmp_str00008;
   string tmp_str00009;
   string tmp_str0000A;
   string tmp_str0000B;
   string tmp_str0000C;
   string tmp_str0000D;
   string tmp_str0000E;
   string tmp_str0000F;
   string tmp_str00010;
   string tmp_str00011;
   string tmp_str00012;
   string tmp_str00013;
   string tmp_str00014;
   string tmp_str00015;
   string tmp_str00016;
   string tmp_str00017;
   string tmp_str00018;
   string Ls_FFFF0;
   int Li_FFFEC;
   int Li_FFFE8;
   int Li_FFFE4;
   int Li_FFFE0;
   int Li_FFFDC;
   int Li_FFFD8;
   string Ls_FFFC8;
   string Ls_FFFB8;
   string Ls_FFFA8;
   int Li_FFFA4;
   int Li_FFFA0;
   int Li_FFF9C;
   int Li_FFF98;
   int Li_FFF94;
   string Ls_FFF88;
   string Ls_FFF78;
   string Ls_FFF68;

   Li_FFFEC = 0;
   Gi_00000 = Fa_s_00;
   if (Gi_00000 == 1 && IsOptimization() == false) {
      if (ChartGetInteger(0, 44, 0) == 0) {
         /*
         ObjectCreate(0, "N4BG", OBJ_RECTANGLE_LABEL, 0, 0, 0);
         ObjectSetInteger(0, "N4BG", 101, 0);
         ObjectSetInteger(0, "N4BG", 1025, 0);
         ObjectSetInteger(0, "N4BG", 102, 0);
         ObjectSetInteger(0, "N4BG", 103, 12);
         ObjectSetInteger(0, "N4BG", 1019, 240);
         ObjectSetInteger(0, "N4BG", 1020, 330);
         ObjectSetInteger(0, "N4BG", 1029, 2);
         ObjectSetInteger(0, "N4BG", 17, 0);
         ObjectSetInteger(0, "N4BG", 1000, 0);
         */
         Li_FFFE8 = TimeHour(TimeCurrent());
         Li_FFFE4 = TimeMinute(TimeCurrent());
         Li_FFFE0 = TimeDay(TimeCurrent());
         Li_FFFDC = TimeMonth(TimeCurrent());
         Li_FFFD8 = TimeYear(TimeCurrent());
         Ls_FFFC8 = (string)TimeDayOfWeek(TimeCurrent());
         Ls_FFFB8 = "";
         if (Li_FFFE4 < 10) {
            tmp_str00000 = (string)Li_FFFE4;
            Ls_FFFB8 = "0" + tmp_str00000;
         }
         else {
            Ls_FFFB8 = DoubleToString(TimeMinute(TimeCurrent()), 0);
         }

         Gi_00000 = Li_FFFE8 + Visor1_Chart_Timezone;
         Ls_FFFA8 = DoubleToString(Gi_00000, 0);
         /*
         ObjectCreate(0, "Time_Label", OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
         tmp_str00000 = (string)Li_FFFE0;
         tmp_str00000 = tmp_str00000 + "-";
         tmp_str00001 = (string)Li_FFFDC;
         tmp_str00000 = tmp_str00000 + tmp_str00001;
         tmp_str00000 = tmp_str00000 + "-";
         tmp_str00001 = (string)Li_FFFD8;
         tmp_str00000 = tmp_str00000 + tmp_str00001;
         tmp_str00000 = tmp_str00000 + " ";
         tmp_str00000 = tmp_str00000 + Ls_FFFA8;
         tmp_str00000 = tmp_str00000 + ":";
         tmp_str00000 = tmp_str00000 + Ls_FFFB8;
         ObjectSetText("Time_Label", tmp_str00000, Visor1_Time_Size, "Arial", Visor1_Time_Color);
         ObjectSet("Time_Label", OBJPROP_XDISTANCE, Visor1_Time_X_Position);
         ObjectSet("Time_Label", OBJPROP_YDISTANCE, Visor1_Time_Y_Position);
         */
         tmp_str00001 = tmp_str00001 + "  Grid Size : ";
         tmp_str00002 = (string)InpGridSize;
         tmp_str00001 = tmp_str00001 + tmp_str00002;
         tmp_str00001 = tmp_str00001 + " Pips     ";
         Ls_FFFF0 = tmp_str00001;
         tmp_str00002 = tmp_str00001 + "  TakeProfit: ";
         tmp_str00003 = (string)InpTakeProfit;
         tmp_str00002 = tmp_str00002 + tmp_str00003;
         tmp_str00002 = tmp_str00002 + " Pips     ";
         Ls_FFFF0 = tmp_str00002;
         tmp_str00003 = tmp_str00002 + "  Lot Mode : ";
         tmp_str00004 = (string)InpLotMode;
         tmp_str00003 = tmp_str00003 + tmp_str00004;
         tmp_str00003 = tmp_str00003 + "      ";
         Ls_FFFF0 = tmp_str00003;
         tmp_str00004 = tmp_str00003 + "  Grid Multiplier: ";
         tmp_str00005 = (string)InpGridFactor;
         tmp_str00004 = tmp_str00004 + tmp_str00005;
         tmp_str00004 = tmp_str00004 + " pips    ";
         Ls_FFFF0 = tmp_str00004;
         tmp_str00005 = tmp_str00004 + "  Daily Target: ";
         tmp_str00006 = (string)InpDailyTarget;
         tmp_str00005 = tmp_str00005 + tmp_str00006;
         tmp_str00005 = tmp_str00005 + "    ";
         Ls_FFFF0 = tmp_str00005;
         tmp_str00006 = tmp_str00005 + "  Max Spread: ";
         tmp_str00007 = (string)InpMaxSpread;
         tmp_str00006 = tmp_str00006 + tmp_str00007;
         tmp_str00006 = tmp_str00006 + " pips    ";
         Ls_FFFF0 = tmp_str00006;
         tmp_str00007 = Ls_FFFF0 + "\n\n  Equity : ";
         tmp_str00007 = tmp_str00007 + DoubleToString(AccountEquity(), 2);
         tmp_str00007 = tmp_str00007 + "     ";
         Ls_FFFF0 = tmp_str00007;
         tmp_str00007 = tmp_str00007 + "  Last Lot : | A : ";
         tmp_str00007 = tmp_str00007 + DoubleToString(Id_001C0, 2);
         tmp_str00007 = tmp_str00007 + " | B : ";
         tmp_str00007 = tmp_str00007 + DoubleToString(Id_00238, 2);
         tmp_str00007 = tmp_str00007 + "     ";
         Ls_FFFF0 = tmp_str00007;
         tmp_str00007 = tmp_str00007 + "  Orders Opens :   ";
         Gi_00000 = 0;
         Gi_00001 = OrdersTotal() - 1;
         Gi_00002 = Gi_00001;
         if (Gi_00001 >= 0) {
            do {
               if (OrderSelect(Gi_00002, 0, 0) && OrderSymbol() == _Symbol) {
                  if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                     if (OrderSymbol() == _Symbol) {
                        if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                           if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                              Gi_00000 = Gi_00000 + 1;
                           }
                        }
                     }
                  }
               }
               Gi_00002 = Gi_00002 - 1;
            } while (Gi_00002 >= 0);
         }
         tmp_str00008 = (string)Gi_00000;
         tmp_str00007 = tmp_str00007 + tmp_str00008;
         tmp_str00007 = tmp_str00007 + " | A : ";
         tmp_str00008 = (string)Ii_001B8;
         tmp_str00007 = tmp_str00007 + tmp_str00008;
         tmp_str00007 = tmp_str00007 + " | B : ";
         tmp_str00008 = (string)Ii_00230;
         tmp_str00007 = tmp_str00007 + tmp_str00008;
         tmp_str00007 = tmp_str00007 + "     ";
         Ls_FFFF0 = tmp_str00007;
         tmp_str00008 = tmp_str00007 + "  Profit/Loss: ";
         tmp_str00008 = tmp_str00008 + DoubleToString(Id_00280, 2);
         tmp_str00008 = tmp_str00008 + " | A : ";
         Gi_00001 = InpMagic;
         Gd_00003 = 0;
         Gi_00004 = OrdersTotal() - 1;
         Gi_00005 = Gi_00004;
         if (Gi_00004 >= 0) {
            do {
               if (OrderSelect(Gi_00005, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00001 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00001) {
                  if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

                     Gd_00003 = (Gd_00003 + OrderProfit());
                  }
               }
               Gi_00005 = Gi_00005 - 1;
            } while (Gi_00005 >= 0);
         }
         tmp_str00008 = tmp_str00008 + DoubleToString(Gd_00003, 2);
         tmp_str00008 = tmp_str00008 + " | B : ";
         Gi_00004 = InpMagic2;
         Gd_00006 = 0;
         Gi_00007 = OrdersTotal() - 1;
         Gi_00008 = Gi_00007;
         if (Gi_00007 >= 0) {
            do {
               if (OrderSelect(Gi_00008, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00004 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00004) {
                  if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

                     Gd_00006 = (Gd_00006 + OrderProfit());
                  }
               }
               Gi_00008 = Gi_00008 - 1;
            } while (Gi_00008 >= 0);
         }
         tmp_str00008 = tmp_str00008 + DoubleToString(Gd_00006, 2);
         tmp_str00008 = tmp_str00008 + "     ";
         Ls_FFFF0 = tmp_str00008;
         tmp_str00008 = Ls_FFFF0 + "\n\n Equity Caution Filter : ";
         tmp_str00009 = (string)InpUseEquityCaution;
         tmp_str00008 = tmp_str00008 + tmp_str00009;
         tmp_str00008 = tmp_str00008 + "     ";
         Ls_FFFF0 = tmp_str00008;
         tmp_str00009 = tmp_str00008 + " Total Equity Risk Caution : ";
         tmp_str00009 = tmp_str00009 + DoubleToString(InpTotalEquityRiskCaution, 2);
         tmp_str00009 = tmp_str00009 + " %     ";
         Ls_FFFF0 = tmp_str00009;
         tmp_str00009 = tmp_str00009 + " Max Drawdown Filter : ";
         tmp_str0000A = (string)InpUseEquityStop;
         tmp_str00009 = tmp_str00009 + tmp_str0000A;
         tmp_str00009 = tmp_str00009 + "     ";
         Ls_FFFF0 = tmp_str00009;
         tmp_str0000A = tmp_str00009 + " Max Drawdown Risk : ";
         tmp_str0000A = tmp_str0000A + DoubleToString(InpTotalEquityRisk, 2);
         tmp_str0000A = tmp_str0000A + " %     ";
         Ls_FFFF0 = tmp_str0000A;
         tmp_str0000A = tmp_str0000A + " News Filter : ";
         tmp_str0000B = (string)UseNewsFilter;
         tmp_str0000A = tmp_str0000A + tmp_str0000B;
         tmp_str0000A = tmp_str0000A + "     ";
         Ls_FFFF0 = tmp_str0000A;
         tmp_str0000B = tmp_str0000A + " Time Filter : ";
         tmp_str0000C = (string)InpUtilizeTimeFilter;
         tmp_str0000B = tmp_str0000B + tmp_str0000C;
         tmp_str0000B = tmp_str0000B + "     ";
         Ls_FFFF0 = tmp_str0000B;
         Ls_FFFF0 = Ls_FFFF0 + Is_00270;
         Comment(Ls_FFFF0);
         Li_FFFEC = 16;
      }
      else {
         /*
         ObjectCreate(0, "N4BG", OBJ_RECTANGLE_LABEL, 0, 0, 0);
         ObjectSetInteger(0, "N4BG", 101, 0);
         ObjectSetInteger(0, "N4BG", 1025, 0);
         ObjectSetInteger(0, "N4BG", 102, 0);
         ObjectSetInteger(0, "N4BG", 103, 74);
         ObjectSetInteger(0, "N4BG", 1019, 240);
         ObjectSetInteger(0, "N4BG", 1020, 330);
         ObjectSetInteger(0, "N4BG", 1029, 2);
         ObjectSetInteger(0, "N4BG", 17, 0);
         ObjectSetInteger(0, "N4BG", 1000, 0);
         */
         Li_FFFA4 = TimeHour(TimeCurrent());
         Li_FFFA0 = TimeMinute(TimeCurrent());
         Li_FFF9C = TimeDay(TimeCurrent());
         Li_FFF98 = TimeMonth(TimeCurrent());
         Li_FFF94 = TimeYear(TimeCurrent());
         Ls_FFF88 = (string)TimeDayOfWeek(TimeCurrent());
         Ls_FFF78 = "";
         if (Li_FFFA0 < 10) {
            tmp_str0000C = (string)Li_FFFA0;
            Ls_FFF78 = "0" + tmp_str0000C;
         }
         else {
            Ls_FFF78 = DoubleToString(TimeMinute(TimeCurrent()), 0);
         }
         Gi_00007 = Li_FFFA4 + Visor1_Chart_Timezone;
         Ls_FFF68 = DoubleToString(Gi_00007, 0);
         /*
         ObjectCreate(0, "Time_Label", OBJ_LABEL, 0, 0, 0, 0, 0, 0, 0);
         tmp_str0000C = (string)Li_FFF9C;
         tmp_str0000C = tmp_str0000C + "-";
         tmp_str0000D = (string)Li_FFF98;
         tmp_str0000C = tmp_str0000C + tmp_str0000D;
         tmp_str0000C = tmp_str0000C + "-";
         tmp_str0000D = (string)Li_FFF94;
         tmp_str0000C = tmp_str0000C + tmp_str0000D;
         tmp_str0000C = tmp_str0000C + " ";
         tmp_str0000C = tmp_str0000C + Ls_FFF68;
         tmp_str0000C = tmp_str0000C + ":";
         tmp_str0000C = tmp_str0000C + Ls_FFF78;
         ObjectSetText("Time_Label", tmp_str0000C, Visor1_Time_Size, "Arial", Visor1_Time_Color);
         ObjectSet("Time_Label", OBJPROP_XDISTANCE, Visor1_Time_X_Position);
         Gi_00007 = Visor1_Time_Y_Position + 62;
         ObjectSet("Time_Label", OBJPROP_YDISTANCE, Gi_00007);
         */
         tmp_str0000D = tmp_str0000D + "  Grid Size : ";
         tmp_str0000E = (string)InpGridSize;
         tmp_str0000D = tmp_str0000D + tmp_str0000E;
         tmp_str0000D = tmp_str0000D + " Pips ";
         Ls_FFFF0 = tmp_str0000D;
         tmp_str0000E = tmp_str0000D + "  TakeProfit: ";
         tmp_str0000F = (string)InpTakeProfit;
         tmp_str0000E = tmp_str0000E + tmp_str0000F;
         tmp_str0000E = tmp_str0000E + " Pips ";
         Ls_FFFF0 = tmp_str0000E;
         tmp_str0000F = tmp_str0000E + "  Lot Mode : ";
         tmp_str00010 = (string)InpLotMode;
         tmp_str0000F = tmp_str0000F + tmp_str00010;
         tmp_str0000F = tmp_str0000F + "  ";
         Ls_FFFF0 = tmp_str0000F;
         tmp_str00010 = tmp_str0000F + "  Grid Multiplier: ";
         tmp_str00011 = (string)InpGridFactor;
         tmp_str00010 = tmp_str00010 + tmp_str00011;
         tmp_str00010 = tmp_str00010 + " pips";
         Ls_FFFF0 = tmp_str00010;
         tmp_str00011 = tmp_str00010 + "  Daily Target: ";
         tmp_str00012 = (string)InpDailyTarget;
         tmp_str00011 = tmp_str00011 + tmp_str00012;
         Ls_FFFF0 = tmp_str00011;
         tmp_str00012 = tmp_str00011 + "  InpMaxSpread: ";
         tmp_str00013 = (string)InpMaxSpread;
         tmp_str00012 = tmp_str00012 + tmp_str00013;
         tmp_str00012 = tmp_str00012 + " pips\n";
         Ls_FFFF0 = tmp_str00012;
         tmp_str00013 = Ls_FFFF0 + "  Equity:      ";
         tmp_str00013 = tmp_str00013 + DoubleToString(AccountEquity(), 2);
         Ls_FFFF0 = tmp_str00013;
         tmp_str00013 = tmp_str00013 + "  Last Lot : | A : ";
         tmp_str00013 = tmp_str00013 + DoubleToString(Id_001C0, 2);
         tmp_str00013 = tmp_str00013 + " | B : ";
         tmp_str00013 = tmp_str00013 + DoubleToString(Id_00238, 2);
         Ls_FFFF0 = tmp_str00013;
         tmp_str00013 = tmp_str00013 + "  Orders Opens :   ";
         Gi_00007 = 0;
         Gi_00009 = OrdersTotal() - 1;
         Gi_0000A = Gi_00009;
         if (Gi_00009 >= 0) {
            do {
               if (OrderSelect(Gi_0000A, 0, 0) && OrderSymbol() == _Symbol) {
                  if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                     if (OrderSymbol() == _Symbol) {
                        if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                           if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                              Gi_00007 = Gi_00007 + 1;
                           }
                        }
                     }
                  }
               }
               Gi_0000A = Gi_0000A - 1;
            } while (Gi_0000A >= 0);
         }
         tmp_str00014 = (string)Gi_00007;
         tmp_str00013 = tmp_str00013 + tmp_str00014;
         tmp_str00013 = tmp_str00013 + " | A : ";
         tmp_str00014 = (string)Ii_001B8;
         tmp_str00013 = tmp_str00013 + tmp_str00014;
         tmp_str00013 = tmp_str00013 + " | B : ";
         tmp_str00014 = (string)Ii_00230;
         tmp_str00013 = tmp_str00013 + tmp_str00014;
         Ls_FFFF0 = tmp_str00013;
         tmp_str00014 = tmp_str00013 + "  Profit/Loss: ";
         tmp_str00014 = tmp_str00014 + DoubleToString(Id_00280, 2);
         tmp_str00014 = tmp_str00014 + " | A : ";
         Gi_00009 = InpMagic;
         Gd_0000B = 0;
         Gi_0000C = OrdersTotal() - 1;
         Gi_0000D = Gi_0000C;
         if (Gi_0000C >= 0) {
            do {
               if (OrderSelect(Gi_0000D, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00009 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00009) {
                  if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

                     Gd_0000B = (Gd_0000B + OrderProfit());
                  }
               }
               Gi_0000D = Gi_0000D - 1;
            } while (Gi_0000D >= 0);
         }
         tmp_str00014 = tmp_str00014 + DoubleToString(Gd_0000B, 2);
         tmp_str00014 = tmp_str00014 + " | B : ";
         Gi_0000C = InpMagic2;
         Gd_0000E = 0;
         Gi_0000F = OrdersTotal() - 1;
         Gi_00010 = Gi_0000F;
         if (Gi_0000F >= 0) {
            do {
               if (OrderSelect(Gi_00010, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0000C && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0000C) {
                  if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

                     Gd_0000E = (Gd_0000E + OrderProfit());
                  }
               }
               Gi_00010 = Gi_00010 - 1;
            } while (Gi_00010 >= 0);
         }
         tmp_str00014 = tmp_str00014 + DoubleToString(Gd_0000E, 2);
         Ls_FFFF0 = tmp_str00014;
         Ls_FFFF0 = tmp_str00014 + " ==========================\n";
         tmp_str00014 = Ls_FFFF0 + " EquityCautionFilter : ";
         tmp_str00015 = (string)InpUseEquityCaution;
         tmp_str00014 = tmp_str00014 + tmp_str00015;
         Ls_FFFF0 = tmp_str00014;
         tmp_str00015 = tmp_str00014 + " TotalEquityRiskCaution : ";
         tmp_str00015 = tmp_str00015 + DoubleToString(InpTotalEquityRiskCaution, 2);
         tmp_str00015 = tmp_str00015 + " % ";
         Ls_FFFF0 = tmp_str00015;
         tmp_str00015 = tmp_str00015 + " Max Drawdown Filter : ";
         tmp_str00016 = (string)InpUseEquityStop;
         tmp_str00015 = tmp_str00015 + tmp_str00016;
         Ls_FFFF0 = tmp_str00015;
         tmp_str00016 = tmp_str00015 + " TotalEquityRiskStop : ";
         tmp_str00016 = tmp_str00016 + DoubleToString(InpTotalEquityRisk, 2);
         tmp_str00016 = tmp_str00016 + " % ";
         Ls_FFFF0 = tmp_str00016;
         tmp_str00016 = tmp_str00016 + " News Filter : ";
         tmp_str00017 = (string)UseNewsFilter;
         tmp_str00016 = tmp_str00016 + tmp_str00017;
         tmp_str00016 = tmp_str00016 + " ";
         Ls_FFFF0 = tmp_str00016;
         tmp_str00017 = tmp_str00016 + " Time Filter : ";
         tmp_str00018 = (string)InpUtilizeTimeFilter;
         tmp_str00017 = tmp_str00017 + tmp_str00018;
         tmp_str00017 = tmp_str00017 + " ";
         Ls_FFFF0 = tmp_str00017;
         Ls_FFFF0 = Ls_FFFF0 + Is_00270;
         Comment(Ls_FFFF0);
         Li_FFFEC = 16;
      }
   }
   Gi_0000F = Fa_s_00;
   if (Gi_0000F != 2) return;
   //ObjectDelete(0, "N4BG");
   //ObjectDelete(0, "Time_Label");
   Comment("");

}

void func_1094()
{
   int Li_FFFFC;
   int Li_FFFF8;
   int Li_FFFF4;
   int Li_FFFF0;
   int Li_FFFEC;

   Li_FFFFC = 0;
   if (ArraySize(Is_0BECC) > 0) {
      do {
         ObjectDelete(0, Is_0BECC[Li_FFFFC]);
         Li_FFFFC = Li_FFFFC + 1;
      } while (Li_FFFFC < ArraySize(Is_0BECC));
   }
   Li_FFFF8 = 0;
   if (ArraySize(Is_0BF6C) > 0) {
      do {
         ObjectDelete(0, Is_0BF6C[Li_FFFF8]);
         Li_FFFF8 = Li_FFFF8 + 1;
      } while (Li_FFFF8 < ArraySize(Is_0BF6C));
   }
   Li_FFFF4 = 0;
   if (ArraySize(Is_0C00C) > 0) {
      do {
         ObjectDelete(0, Is_0C00C[Li_FFFF4]);
         Li_FFFF4 = Li_FFFF4 + 1;
      } while (Li_FFFF4 < ArraySize(Is_0C00C));
   }
   Li_FFFF0 = 0;
   if (ArraySize(Is_0C0AC) > 0) {
      do {
         ObjectDelete(0, Is_0C0AC[Li_FFFF0]);
         Li_FFFF0 = Li_FFFF0 + 1;
      } while (Li_FFFF0 < ArraySize(Is_0C0AC));
   }
   Li_FFFEC = 0;
   if (ArraySize(Is_0C14C) > 0) {
      do {
         ObjectDelete(0, Is_0C14C[Li_FFFEC]);
         Li_FFFEC = Li_FFFEC + 1;
      } while (Li_FFFEC < ArraySize(Is_0C14C));
   }
   ObjectDelete(0, "Daily_DD");
   ObjectDelete(0, "Open_DD");
   ObjectDelete(0, "Monthly_DD");
   ObjectDelete(0, "Monthly_P");
   ObjectDelete(0, "RectLabel_2");
   ObjectDelete(0, "Dotted_Line0");
   ObjectDelete(0, "Dotted_Line1");
}

void func_1096(string Fa_s_00, int Fa_i_01, bool FuncArg_Boolean_00000002, double Fa_d_03, int Fa_i_04, int& Fa_i_05, double& Fa_d_06, bool& FuncArg_Boolean_00000007, bool& FuncArg_Boolean_00000008, int& Fa_i_09, int& Fa_i_0A, int& Fa_i_0B, double& Fa_d_0C, double& Fa_d_0D, double& Fa_d_0E, double& Fa_d_0F, double& Fa_d_10, double& Fa_d_11, double& Fa_d_12, double& Fa_d_13, long& Fa_l_14, long& Fa_l_15, double& Fa_d_16)
{
   string tmp_str00000, tmp_str00001, tmp_str00002, tmp_str00003, tmp_str00004, tmp_str00005;
   int Li_FFFFC, Li_FFFF8, Li_FFFF4, Li_FFFF0, Li_FFFEC, Li_FFFE8, Li_FFF9C, Li_FFF98, Li_FFF94, Li_FFF90, Li_FFF8C, Li_FFF88, Li_FFF84, Li_FFEEC, Li_FFDC4, Li_FFBFC, Li_FFBF8, Li_FFBF4;
   double Ld_FFFE0, Ld_FFFD8, Ld_FFFD0, Ld_FFFC8, Ld_FFFC0, Ld_FFFB8, Ld_FFFB0, Ld_FFFA8, Ld_FFFA0, Ld_FFF78, Ld_FFF70, Ld_FFF68, Ld_FFF60, Ld_FFF58, Ld_FFF50, Ld_FFF48, Ld_FFF40, Ld_FFF38, Ld_FFF30, Ld_FFF28, Ld_FFF20, Ld_FFF18, Ld_FFF10, Ld_FFEF8, Ld_FFEF0, Ld_FFEE0, Ld_FFED8, Ld_FFDD0, Ld_FFDC8, Ld_FFBE8, Ld_FFBD8, Ld_FFBD0, Ld_FFBC8, Ld_FFBC0, Ld_FFBE0;
   bool Lb_FFF83, Lb_FFF82, Lb_FFF81, Lb_FFF80, Lb_FFF07;
   long Ll_FFF08;
   
   Li_FFFFC = Li_FFFF8 = Li_FFFF4 = Li_FFFF0 = Li_FFFEC = Li_FFFE8 = Li_FFF9C = Li_FFF98 = Li_FFF94 = Li_FFF90 = Li_FFF8C = Li_FFF88 = Li_FFF84 = Li_FFEEC = Li_FFDC4 = Li_FFBFC = Li_FFBF8 = Li_FFBF4 = 0;
   Ld_FFFE0 = Ld_FFFD8 = Ld_FFFD0 = Ld_FFFC8 = Ld_FFFC0 = Ld_FFFB8 = Ld_FFFB0 = Ld_FFFA8 = Ld_FFFA0 = Ld_FFF78 = Ld_FFF70 = Ld_FFF68 = Ld_FFF60 = Ld_FFF58 = Ld_FFF50 = Ld_FFF48 = Ld_FFF40 = Ld_FFF38 = Ld_FFF30 = 0;
   Lb_FFF83 = Lb_FFF82 = Lb_FFF81 = Lb_FFF80 = Lb_FFF07 = false;
   Ld_FFF28 = Bid;
   Ld_FFF20 = Ask;
   Ld_FFF18 = iClose(NULL, 0, 0);
   Ld_FFF10 = iOpen(NULL, 0, 0);
   Ll_FFF08 = TimeCurrent();
   Id_00258 = (Fa_d_11 * 2);
   Ld_FFFC0 = AccountBalance();
   Ld_FFFE0 = SymbolInfoDouble(Is_00248, 34);
   Ld_FFFD8 = SymbolInfoDouble(Is_00248, 35);
   Ld_FFFD0 = SymbolInfoDouble(Is_00248, 36);
   Ld_FFFC8 = Ld_FFFE0;   
   if (InpLotMode == 1) {
      Ld_FFFC8 = InpFixedLot;
   }
   else {
      if (InpLotMode == 2) {
         Ld_FFFB0 = ((InpPercentLot * AccountBalance()) / 100);
         Ld_FFFB8 = MarketInfo(Is_00248, MODE_MARGINREQUIRED);
         Gd_00000 = (Ld_FFFB0 / Ld_FFFB8);
         Gd_00000 = round((Gd_00000 / Ld_FFFD0));
         Ld_FFFC8 = (Ld_FFFD0 * Gd_00000);
         if ((Ld_FFFC8 < Ld_FFFE0)) {
            Ld_FFFC8 = Ld_FFFE0;
         }
         if ((Ld_FFFC8 > Ld_FFFD8)) {
            Ld_FFFC8 = Ld_FFFD8;
         }
      }
   }
   Fa_i_0A = TimeDayOfWeek(Ll_FFF08);
   if (Fa_i_0A != Fa_i_0B) {
      FuncArg_Boolean_00000008 = false;
      Fa_d_0F = 0;
   }
   Fa_i_0B = Fa_i_0A;
   Li_FFFF8 = OrdersTotal();
   Fa_d_06 = Ld_FFEF8 = Ld_FFEF0 = Li_FFEEC = Ld_FFEE0 = Ld_FFED8 = Ld_FFDD0 = Ld_FFDC8 = Li_FFDC4 = 0;
   Li_FFFFC = Li_FFFF8 - 1;
   int Li_FFE10[50];
   if (Li_FFFFC >= 0) {
      do {
         if (OrderSelect(Li_FFFFC, 0, 0) && OrderMagicNumber() == Fa_i_04 && OrderSymbol() == Is_00248) {
            Ld_FFFA8 = OrderOpenPrice();
            Li_FFFF4 = OrderTicket();
            Li_FFFF0 = OrderType();
            Ld_FFFA0 = OrderLots();
            if (Li_FFFF0 == 0) {
               if (Li_FFFF4 > Li_FFF9C) {
                  Ld_FFF38 = Ld_FFFA8;
                  Li_FFF9C = Li_FFFF4;
                  Gd_00000 = OrderProfit();
                  Gd_00000 = (Gd_00000 + OrderCommission());
                  Ld_FFDC8 = (Gd_00000 + OrderSwap());
                  Li_FFDC4 = Li_FFFF4;
                  Ld_FFF40 = Ld_FFFA0;
               }
               Ld_FFF58 = (((Ld_FFFA8 - Id_00258) * Ld_FFFA0) + Ld_FFF58);
               Ld_FFF68 = (Ld_FFF68 + Ld_FFFA0);
               Li_FFF88 = Li_FFF88 + 1;
               Li_FFF94 = Li_FFF94 + 1;
               Fa_d_06 = ((Ld_FFFA8 * Ld_FFFA0) + Fa_d_06);
               if ((OrderProfit() > 0)) {
                  Gd_00000 = OrderProfit();
                  Gd_00000 = (Gd_00000 + OrderCommission());
                  Ld_FFEF8 = ((Gd_00000 + OrderSwap()) + Ld_FFEF8);
               }
            }
            if (Li_FFFF0 == 1) {
               if (Li_FFFF4 > Li_FFF98) {
                  Ld_FFF30 = Ld_FFFA8;
                  Li_FFF98 = Li_FFFF4;
                  Gd_00000 = OrderProfit();
                  Gd_00000 = (Gd_00000 + OrderCommission());
                  Ld_FFDD0 = (Gd_00000 + OrderSwap());
                  Li_FFDC4 = Li_FFFF4;
                  Ld_FFF48 = Ld_FFFA0;
               }
               Ld_FFF50 = (((Ld_FFFA8 + Id_00258) * Ld_FFFA0) + Ld_FFF50);
               Ld_FFF60 = (Ld_FFF60 + Ld_FFFA0);
               Li_FFF84 = Li_FFF84 + 1;
               Li_FFF94 = Li_FFF94 + 1;
               Fa_d_06 = ((Ld_FFFA8 * Ld_FFFA0) + Fa_d_06);
               if ((OrderProfit() > 0)) {
                  Gd_00000 = OrderProfit();
                  Gd_00000 = (Gd_00000 + OrderCommission());
                  Ld_FFEF0 = ((Gd_00000 + OrderSwap()) + Ld_FFEF0);
               }
            }
            Ld_FFF78 = (Ld_FFF78 + OrderProfit());
         }
         Li_FFFFC = Li_FFFFC - 1;
      } while (Li_FFFFC >= 0);
   }
   if (ProtectGridLastFist && Li_FFF94 > QtdTradesMinProfit) {
      int Li_FFC34[100];
      tmp_str00000 = _Symbol;
      Ld_FFED8 = get_total_loss(Fa_i_04, tmp_str00000, 0, QtdTradesMinProfit, Li_FFC34);
      Gd_00000 = -Ld_FFED8;
      if ((Ld_FFDC8 > (Gd_00000 + MinProfit))) {//Total Profit > MinProfit + -Total Loss
         Gi_00000 = Fa_i_04;
         Gi_00001 = Li_FFDC4;
         Gi_00002 = 0;
         Gi_00003 = OrdersTotal() - 1;
         Gi_00004 = Gi_00003;
         if (Gi_00003 >= 0) {
            do {
               if (OrderSelect(Gi_00004, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00000) {
                  if (OrderType() == Gi_00002 && OrderType() == OP_BUY) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_00001) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_BUY Error N", GetLastError());
                        }
                     }
                  }
                  if (OrderType() == Gi_00002 && OrderType() == OP_SELL) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_00001) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_SELL Error N", GetLastError());
                        }
                     }
                  }
               }
               Gi_00004 = Gi_00004 - 1;
            } while (Gi_00004 >= 0);
         }
         Li_FFBFC = 0;
         if (QtdTradesMinProfit > 0) {
            do {
               Gi_00008 = Fa_i_04;
               Gi_0000A = Li_FFC34[Li_FFBFC];
               Gi_0000B = 0;
               Gi_0000C = OrdersTotal() - 1;
               Gi_0000D = Gi_0000C;
               if (Gi_0000C >= 0) {
                  do {
                     if (OrderSelect(Gi_0000D, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00008) {
                        if (OrderType() == Gi_0000B && OrderType() == OP_BUY) {
                           if (OrderProfit() > 0 || OrderTicket() == Gi_0000A) {

                              if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), Ii_00140, 255) != true) {
                                 Print(" OrderClose OP_BUY Error N", GetLastError());
                              }
                           }
                        }
                        if (OrderType() == Gi_0000B && OrderType() == OP_SELL) {
                           if (OrderProfit() > 0 || OrderTicket() == Gi_0000A) {

                              if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), Ii_00140, 255) != true) {
                                 Print(" OrderClose OP_SELL Error N", GetLastError());
                              }
                           }
                        }
                     }
                     Gi_0000D = Gi_0000D - 1;
                  } while (Gi_0000D >= 0);
               }
               Li_FFBFC = Li_FFBFC + 1;
            } while (Li_FFBFC < QtdTradesMinProfit);
         }
      }
      tmp_str00001 = _Symbol;
      Ld_FFEE0 = get_total_loss(Fa_i_04, tmp_str00001, 1, QtdTradesMinProfit, Li_FFC34);
      Gd_00011 = -Ld_FFEE0;
      if ((Ld_FFDD0 > (Gd_00011 + MinProfit))) {
         Gi_00011 = Fa_i_04;
         Gi_00012 = Li_FFDC4;
         Gi_00013 = 1;
         Gi_00014 = OrdersTotal() - 1;
         Gi_00015 = Gi_00014;
         if (Gi_00014 >= 0) {
            do {
               if (OrderSelect(Gi_00015, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00011) {
                  if (OrderType() == Gi_00013 && OrderType() == OP_BUY) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_00012) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_BUY Error N", GetLastError());
                        }
                     }
                  }
                  if (OrderType() == Gi_00013 && OrderType() == OP_SELL) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_00012) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_SELL Error N", GetLastError());
                        }
                     }
                  }
               }
               Gi_00015 = Gi_00015 - 1;
            } while (Gi_00015 >= 0);
         }
         Li_FFBF8 = 0;
         if (QtdTradesMinProfit > 0) {
            do {
               Gi_00019 = Fa_i_04;
               Gi_0001B = Li_FFC34[Li_FFBF8];
               Gi_0001C = 1;
               Gi_0001D = OrdersTotal() - 1;
               Gi_0001E = Gi_0001D;
               if (Gi_0001D >= 0) {
                  do {
                     if (OrderSelect(Gi_0001E, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00019) {
                        if (OrderType() == Gi_0001C && OrderType() == OP_BUY) {
                           if (OrderProfit() > 0 || OrderTicket() == Gi_0001B) {

                              if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), Ii_00140, 255) != true) {
                                 Print(" OrderClose OP_BUY Error N", GetLastError());
                              }
                           }
                        }
                        if (OrderType() == Gi_0001C && OrderType() == OP_SELL) {
                           if (OrderProfit() > 0 || OrderTicket() == Gi_0001B) {

                              if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), Ii_00140, 255) != true) {
                                 Print(" OrderClose OP_SELL Error N", GetLastError());
                              }
                           }
                        }
                     }
                     Gi_0001E = Gi_0001E - 1;
                  } while (Gi_0001E >= 0);
               }
               Li_FFBF8 = Li_FFBF8 + 1;
            } while (Li_FFBF8 < QtdTradesMinProfit);
         }
      }
      ArrayFree(Li_FFC34);
   }
   Fa_i_05 = Li_FFF94;
   Fa_d_10 = Ld_FFF78;
   Gi_00022 = Li_FFF84 + Li_FFF88;
   if (Gi_00022 > 0) {
      Fa_d_06 = NormalizeDouble((Fa_d_06 / (Ld_FFF68 + Ld_FFF60)), _Digits);
   }
   Li_FFBF4 = 55295;
   if ((Ld_FFF60 > 0)) {
      Li_FFBF4 = 55295;
   }
   if ((Ld_FFF68 > 0) || (Ld_FFF60 > 0)) {

      Gi_00022 = 3;
      Gi_00023 = 0;
      Gd_00024 = Fa_d_06;
      tmp_str00002 = "Avg" + Fa_s_00;
      tmp_str00003 = tmp_str00002;
      Gi_00025 = Li_FFBF4;
      if (tmp_str00002 == "") {
         Gl_00027 = Time[0];
         tmp_str00003 = DoubleToString(Gl_00027, 0);
      }
      if ((Gd_00024 <= 0)) {
         Gd_00024 = Bid;
      }
      if (ObjectFind(tmp_str00003) < 0) {
         ObjectCreate(0, tmp_str00003, OBJ_HLINE, 0, 0, 0, 0, 0, 0, 0);
      }
      ObjectSet(tmp_str00003, OBJPROP_PRICE1, Gd_00024);
      ObjectSet(tmp_str00003, OBJPROP_COLOR, Gi_00025);
      ObjectSet(tmp_str00003, OBJPROP_STYLE, Gi_00023);
      ObjectSet(tmp_str00003, OBJPROP_WIDTH, Gi_00022);
   }
   else {
      tmp_str00002 = "Avg" + Fa_s_00;
      ObjectDelete(tmp_str00002);
   }
   if (InpUseTrailingStop) {
      func_1117(InpTrailStart, InpTrailStop, Fa_d_06, Fa_i_04);
   }
   if (InpUseBreakEven) {
      func_1129(InpBreakEvenStart, InpBreakEvenStep, Fa_d_06, Fa_i_04);
   }
   if (Li_FFF94 == 0) {
      Fa_d_0F = (Fa_d_0F + Fa_d_10);
      FuncArg_Boolean_00000007 = false;
   }
   Gd_00027 = (Fa_d_0F + Ld_FFF78);
   Gd_00028 = Gd_00027;
   Fa_d_16 = Gd_00027;
   if (InpDailyTarget > 0 && (Gd_00028 >= InpDailyTarget)) {
      FuncArg_Boolean_00000008 = true;
   }
   if (FuncArg_Boolean_00000007) {
      if ((Fa_i_09 > 0 && Ld_FFF28 >= Fa_d_0C)
         || (Fa_i_09 < 0 && Ld_FFF20 <= Fa_d_0C)) {

         Lb_FFF82 = true;
      }
   }
   if (FuncArg_Boolean_00000008 || Lb_FFF82) {

      Gi_00028 = Fa_i_04;
      Gi_00029 = OrdersTotal() - 1;
      Gi_0002A = Gi_00029;
      if (Gi_00029 >= 0) {
         do {
            if (OrderSelect(Gi_0002A, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00028) {
                  if (OrderType() == OP_BUY) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Bid, Ii_00140, 55295);
                  }
                  if (OrderType() == OP_SELL) {
                     order_check = OrderClose(OrderTicket(), OrderLots(), Ask, Ii_00140, 255);
                  }
               }
               Sleep(1000);
            }
            Gi_0002A = Gi_0002A - 1;
         } while (Gi_0002A >= 0);
      }
      ArrayFree(Li_FFE10);
      return;
   }
   if (!FuncArg_Boolean_00000007) {
      if (Li_FFF94 > 0 && Ib_00144 == false) {
         if (OpenNewOrdersGrid == true && FuncArg_Boolean_00000002 && Il_001A0 != iTime(NULL, InpTimeframeEquityCaution, 0)) {
            if (GridAllDirect) {
               if (Li_FFF88 > 0 && ((Ld_FFF20 - Ld_FFF38) >= Fa_d_12)) {
                  Lb_FFF81 = true;
               }
               if (Li_FFF84 > 0 && ((Ld_FFF30 - Ld_FFF28) >= Fa_d_12)) {
                  Lb_FFF80 = true;
               }
            }
            if (Li_FFF88 > 0 && ((Ld_FFF38 - Ld_FFF20) >= Fa_d_12)) {
               Lb_FFF81 = true;
            }
            if (Li_FFF84 > 0) {
               Gb_0002E = ((Ld_FFF28 - Ld_FFF30) >= Fa_d_12);
               if (Gb_0002E != false) {
                  Lb_FFF80 = true;
               }
            }
         }
      }
      else {
         if (InpOpenNewOrders && FuncArg_Boolean_00000002) {
            Li_FFFE8 = TimeHour(Ll_FFF08);
            Gb_0002E = false;
            Gl_0002F = TimeCurrent();
            tmp_str00004 = DoubleToString(Year(), 0);
            tmp_str00004 = tmp_str00004 + ".";
            tmp_str00004 = tmp_str00004 + DoubleToString(Month(), 0);
            tmp_str00004 = tmp_str00004 + ".";
            tmp_str00004 = tmp_str00004 + DoubleToString(Day(), 0);
            tmp_str00004 = tmp_str00004 + " ";
            tmp_str00004 = tmp_str00004 + InpStartHour;
            Gl_00030 = StringToTime(tmp_str00004);
            tmp_str00005 = DoubleToString(Year(), 0);
            tmp_str00005 = tmp_str00005 + ".";
            tmp_str00005 = tmp_str00005 + DoubleToString(Month(), 0);
            tmp_str00005 = tmp_str00005 + ".";
            tmp_str00005 = tmp_str00005 + DoubleToString(Day(), 0);
            tmp_str00005 = tmp_str00005 + " ";
            tmp_str00005 = tmp_str00005 + InpEndHour;
            Gl_00031 = StringToTime(tmp_str00005);
            if ((InpTrade_in_Monday == true && TimeDayOfWeek(Time[0]) == 1)
               || (InpTrade_in_Tuesday == true && TimeDayOfWeek(Time[0]) == 2)
               || (InpTrade_in_Wednesday == true && TimeDayOfWeek(Time[0]) == 3)
               || (InpTrade_in_Thursday == true && TimeDayOfWeek(Time[0]) == 4)
               || (InpTrade_in_Friday == true && TimeDayOfWeek(Time[0]) == 5)) {

               if (Gl_00030 > Gl_00031) {
                  if (Gl_0002F >= Gl_00030 || Gl_0002F <= Gl_00031) {

                     Gb_0002E = true;
                  }
               }
               else {
                  if (Gl_0002F >= Gl_00030 && Gl_0002F <= Gl_00031) {
                     Gb_0002E = true;
                  }
               }
            }
            if (InpManualInitGrid || !InpUtilizeTimeFilter || Gb_0002E) {

               if (Fa_i_01 == 1) {
                  Lb_FFF80 = true;
               }
               if (Fa_i_01 == -1) {
                  Lb_FFF81 = true;
               }
            }
         }
      }
   }
   else {
      if (Fa_i_09 > 0 && (Ld_FFF28 <= Fa_d_0E)) {
         Lb_FFF81 = true;
      }
      if (Fa_i_09 < 0 && (Ld_FFF20 >= Fa_d_0D)) {
         Lb_FFF80 = true;
      }
   }
   Gi_00037 = Fa_i_04;
   Gd_00038 = 0;
   Gi_00039 = OrdersTotal() - 1;
   Gi_0003A = Gi_00039;
   if (Gi_00039 >= 0) {
      do {
         if (OrderSelect(Gi_0003A, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00037 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00037) {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

               Gd_00038 = (Gd_00038 + OrderProfit());
            }
         }
         Gi_0003A = Gi_0003A - 1;
      } while (Gi_0003A >= 0);
   }
   Ld_FFBE8 = Gd_00038;
   Gd_00039 = fabs(Gd_00038);
   Gd_0003B = (InpTotalEquityRiskCaution / 100);
   if ((Gd_00038 < 0) && (Gd_00039 > (Gd_0003B * AccountEquity()))) {
      Fa_l_15 = iTime(NULL, InpTimeframeEquityCaution, 0);
   }
   else {
      Fa_l_15 = -1;
   }
   if (InpHedge > 0 && FuncArg_Boolean_00000007 == false) {
      if (Lb_FFF81 && Li_FFF88 == InpHedge) {
         Fa_d_0E = Ld_FFF28;
         FuncArg_Boolean_00000007 = true;
         ArrayFree(Li_FFE10);
         return;
      }
      if (Lb_FFF80 && Li_FFF84 == InpHedge) {
         Fa_d_0D = Ld_FFF20;
         FuncArg_Boolean_00000007 = true;
         ArrayFree(Li_FFE10);
         return;
      }
   }
   if ((Fa_d_03 != 0) && Li_FFF94 == 0) {
      Ld_FFFC8 = Fa_d_03;
   }
   else {
      Ld_FFBE0 = (Ld_FFF48 + Ld_FFF40);
      if (Lb_FFF81) {
         Gd_0003B = Ld_FFFD0;
         Gi_0003C = InpGridStepLot;
         Gd_0003D = Ld_FFFC8;
         Gd_0003E = Ld_FFBE0;
         Gi_0003F = Li_FFF94;
         Gi_00040 = 0;
         Gd_00041 = 0;
         returned_i = TypeGridLot;
         if (returned_i <= 3) {
            if (returned_i == 0) {

               if (Gi_00040 == 0 || Gi_00040 == 1) {

                  Gd_00041 = Gd_0003D;
               }
            }
            if (returned_i == 1) {

               Gd_00041 = (Gd_0003D * Gi_0003F);
            }
            if (returned_i == 2) {


               returned_double = MathPow(InpGridFactor, Gi_0003F);
               Gd_00042 = (Gd_0003D * returned_double);
               Gd_00042 = round((Gd_00042 / SymbolInfoDouble(Is_00248, 36)));
               Gd_00041 = (SymbolInfoDouble(Is_00248, 36) * Gd_00042);
            }
            if (returned_i == 3) {

               if (Gi_0003F == 0) {
                  Gd_00041 = Gd_0003D;
               }
               Gi_00042 = Gi_0003F % Gi_0003C;
               if (Gi_00042 == 0) {
                  Gd_00041 = (Gd_0003E + Gd_0003D);
               }
               else {
                  Gd_00041 = Gd_0003E;
               }
            }
         }
         Gd_00042 = round((Gd_00041 / Gd_0003B));
         Ld_FFFC8 = (Gd_0003B * Gd_00042);
      }
      if (Lb_FFF80) {
         Gd_00042 = Ld_FFFD0;
         Gi_00043 = InpGridStepLot;
         Gd_00044 = Ld_FFFC8;
         Gd_00045 = Ld_FFBE0;
         Gi_00046 = Li_FFF94;
         Gi_00047 = 1;
         Gd_00048 = 0;
         returned_i = TypeGridLot;
         if (returned_i <= 3) {
            if (returned_i == 0) {

               if (Gi_00047 == 0 || Gi_00047 == 1) {

                  Gd_00048 = Gd_00044;
               }
            }
            if (returned_i == 1) {

               Gd_00048 = (Gd_00044 * Gi_00046);
            }
            if (returned_i == 2) {

               returned_double = MathPow(InpGridFactor, Gi_00046);
               Gd_00049 = (Gd_00044 * returned_double);
               Gd_00049 = round((Gd_00049 / SymbolInfoDouble(Is_00248, 36)));
               Gd_00048 = (SymbolInfoDouble(Is_00248, 36) * Gd_00049);
            }
            if (returned_i == 3) {

               if (Gi_00046 == 0) {
                  Gd_00048 = Gd_00044;
               }
               Gi_00049 = Gi_00046 % Gi_00043;
               if (Gi_00049 == 0) {
                  Gd_00048 = (Gd_00045 + Gd_00044);
               }
               else {
                  Gd_00048 = Gd_00045;
               }
            }
         }
         Gd_00049 = round((Gd_00048 / Gd_00042));
         Ld_FFFC8 = (Gd_00042 * Gd_00049);
      }
      if (FuncArg_Boolean_00000007) {
         if (Lb_FFF81) {
            Gd_00049 = (Ld_FFF60 * 3);
            Gd_00049 = round((Gd_00049 / Ld_FFFD0));
            Ld_FFFC8 = ((Ld_FFFD0 * Gd_00049) - Ld_FFF68);
         }
         if (Lb_FFF80) {
            Gd_00049 = (Ld_FFF68 * 3);
            Gd_00049 = round((Gd_00049 / Ld_FFFD0));
            Ld_FFFC8 = ((Ld_FFFD0 * Gd_00049) - Ld_FFF60);
         }
      }
   }
   if ((Ld_FFFC8 < Ld_FFFE0)) {
      Ld_FFFC8 = Ld_FFFE0;
   }
   if ((Ld_FFFC8 > Ld_FFFD8)) {
      Ld_FFFC8 = Ld_FFFD8;
   }
   if ((Ld_FFFC8 > InpMaxLot)) {
      Ld_FFFC8 = InpMaxLot;
   }
   if ((InpManualInitGrid && Li_FFF94 == 0)
      || InpOpenOneCandle == false || Fa_l_14 != iTime(NULL, InpTimeframeBarOpen, 0)) {

      Fa_l_14 = iTime(NULL, InpTimeframeBarOpen, 0);
      if (Lb_FFF81 && func_1098(0) == false) {
         if (((Ld_FFF68 + Ld_FFFC8) == Ld_FFF60)) {
            Ld_FFFC8 = (Ld_FFF60 + Ld_FFFE0);
         }
         returned_double = SymbolInfoDouble(Is_00248, SYMBOL_POINT);
         Ld_FFBD8 = returned_double;
         if (HardSL > 0) {
            Gd_00049 = (HardSL * returned_double);
            Gd_00049 = (Ld_FFF20 - Gd_00049);
         }
         else {
            Gd_00049 = 0;
         }
         Ld_FFBD0 = Gd_00049;
         Li_FFFEC = OrderSend(Is_00248, 0, Ld_FFFC8, Ld_FFF20, Ii_00140, Gd_00049, 0, "", Fa_i_04, 0, 4294967295);
         if (Li_FFFEC > 0) {
            if (HardSL > 0) {
               Gi_0004A = Fa_i_04;
               Gi_0004B = 0;
               Gi_0004C = 10;
               Gi_0004D = OrdersTotal() - 1;
               Gi_0004E = Gi_0004D;
               if (Gi_0004D >= 0) {
                  do {
                     if (OrderSelect(Gi_0004E, 0, 0) && OrderMagicNumber() == Gi_0004A && OrderType() == Gi_0004B && OrderSymbol() == Is_00248) {
                        Gd_0004D = fabs((OrderStopLoss() - Gd_00049));
                        if ((Gd_0004D > SymbolInfoDouble(Is_00248, SYMBOL_POINT))) {
                           Gi_0004D = 0;
                           Gb_0004F = false;
                           if (Gi_0004C > 0) {
                              do {
                                 Gb_0004F = OrderModify(OrderTicket(), OrderOpenPrice(), Gd_00049, OrderTakeProfit(), 0, 4294967295);
                                 if (Gi_0004D >= Gi_0004C) break;
                              } while (Gb_0004F == false);
                           }
                        }
                     }
                     Gi_0004E = Gi_0004E - 1;
                  } while (Gi_0004E >= 0);
               }
            }
            Lb_FFF07 = OrderSelect(Li_FFFEC, 1, 0);
            Ld_FFFA8 = OrderOpenPrice();
            Ld_FFF58 = ((Ld_FFFA8 * Ld_FFFC8) + Ld_FFF58);
            Ld_FFF68 = (Ld_FFF68 + Ld_FFFC8);
            Gd_00052 = (Ld_FFF58 - Ld_FFF50);
            Fa_d_0C = (NormalizeDouble((Gd_00052 / (Ld_FFF68 - Ld_FFF60)), _Digits) + Fa_d_13);
            if (FuncArg_Boolean_00000007 != true) {
               Ld_FFF70 = Fa_d_0C;
            }
            else {
               Ld_FFF70 = (Fa_d_0C + Fa_d_13);
            }
            if (Li_FFF88 == 0) {
               Fa_d_0D = Ld_FFFA8;
            }
            Fa_i_09 = 1;
            Lb_FFF83 = true;
         }
      }
      if (Lb_FFF80 && func_1098(1) == false) {
         if (((Ld_FFF60 + Ld_FFFC8) == Ld_FFF68)) {
            Ld_FFFC8 = (Ld_FFF68 + Ld_FFFE0);
         }
         returned_double = SymbolInfoDouble(Is_00248, SYMBOL_POINT);
         Ld_FFBC8 = returned_double;
         if (HardSL > 0) {
            Gd_00052 = ((HardSL * returned_double) + Ld_FFF28);
         }
         else {
            Gd_00052 = 0;
         }
         Ld_FFBC0 = Gd_00052;
         Li_FFFEC = OrderSend(Is_00248, 1, Ld_FFFC8, Ld_FFF28, Ii_00140, Gd_00052, 0, "", Fa_i_04, 0, 4294967295);
         if (Li_FFFEC > 0) {
            if (HardSL > 0) {
               Gi_00053 = Fa_i_04;
               Gi_00054 = 1;
               Gi_00055 = 10;
               Gi_00056 = OrdersTotal() - 1;
               Gi_00057 = Gi_00056;
               if (Gi_00056 >= 0) {
                  do {
                     if (OrderSelect(Gi_00057, 0, 0) && OrderMagicNumber() == Gi_00053 && OrderType() == Gi_00054 && OrderSymbol() == Is_00248) {
                        Gd_00056 = fabs((OrderStopLoss() - Gd_00052));
                        if ((Gd_00056 > SymbolInfoDouble(Is_00248, SYMBOL_POINT))) {
                           Gi_00056 = 0;
                           Gb_00058 = false;
                           if (Gi_00055 > 0) {
                              do {
                                 Gb_00058 = OrderModify(OrderTicket(), OrderOpenPrice(), Gd_00052, OrderTakeProfit(), 0, 4294967295);
                                 if (Gi_00056 >= Gi_00055) break;
                              } while (Gb_00058 == false);
                           }
                        }
                     }
                     Gi_00057 = Gi_00057 - 1;
                  } while (Gi_00057 >= 0);
               }
            }
            Lb_FFF07 = OrderSelect(Li_FFFEC, 1, 0);
            Ld_FFFA8 = OrderOpenPrice();
            Ld_FFF50 = ((Ld_FFFA8 * Ld_FFFC8) + Ld_FFF50);
            Ld_FFF60 = (Ld_FFF60 + Ld_FFFC8);
            Gd_0005B = (Ld_FFF50 - Ld_FFF58);
            Fa_d_0C = (NormalizeDouble((Gd_0005B / (Ld_FFF60 - Ld_FFF68)), _Digits) - Fa_d_13);
            if (FuncArg_Boolean_00000007 != true) {
               Ld_FFF70 = Fa_d_0C;
            }
            else {
               Ld_FFF70 = (Fa_d_0C - Fa_d_13);
            }
            if (Li_FFF84 == 0) {
               Fa_d_0E = Ld_FFFA8;
            }
            Fa_i_09 = -1;
            Lb_FFF83 = true;
         }
      }
   }
   if (InpEnableMinProfit && ProtectGridLastFist == false) {
      if ((Ld_FFEF8 >= MinProfit) && Li_FFF88 >= QtdTradesMinProfit) {
         Gi_0005B = Fa_i_04;
         Gi_0005C = Li_FFF9C;
         Gi_0005D = 0;
         Gi_0005E = OrdersTotal() - 1;
         Gi_0005F = Gi_0005E;
         if (Gi_0005E >= 0) {
            do {
               if (OrderSelect(Gi_0005F, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0005B) {
                  if (OrderType() == Gi_0005D && OrderType() == OP_BUY) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_0005C) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_BUY Error N", GetLastError());
                        }
                     }
                  }
                  if (OrderType() == Gi_0005D && OrderType() == OP_SELL) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_0005C) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_SELL Error N", GetLastError());
                        }
                     }
                  }
               }
               Gi_0005F = Gi_0005F - 1;
            } while (Gi_0005F >= 0);
         }
      }
      if ((Ld_FFEF0 >= MinProfit) && Li_FFF84 >= QtdTradesMinProfit) {
         Gi_00063 = Fa_i_04;
         Gi_00064 = Li_FFF98;
         Gi_00065 = 1;
         Gi_00066 = OrdersTotal() - 1;
         Gi_00067 = Gi_00066;
         if (Gi_00066 >= 0) {
            do {
               if (OrderSelect(Gi_00067, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00063) {
                  if (OrderType() == Gi_00065 && OrderType() == OP_BUY) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_00064) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_BUY Error N", GetLastError());
                        }
                     }
                  }
                  if (OrderType() == Gi_00065 && OrderType() == OP_SELL) {
                     if (OrderProfit() > 0 || OrderTicket() == Gi_00064) {

                        if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, _Digits), Ii_00140, 255) != true) {
                           Print(" OrderClose OP_SELL Error N", GetLastError());
                        }
                     }
                  }
               }
               Gi_00067 = Gi_00067 - 1;
            } while (Gi_00067 >= 0);
         }
      }
   }
   if (Lb_FFF83) {
      Li_FFFF8 = OrdersTotal();
      Li_FFFFC = Li_FFFF8 - 1;
      if (Li_FFFFC >= 0) {
         do {
            if (OrderSelect(Li_FFFFC, 0, 0) && OrderMagicNumber() == Fa_i_04 && OrderSymbol() == Is_00248) {
               Li_FFFF0 = OrderType();
               if (Fa_i_09 > 0) {
                  if (Li_FFFF0 == 0) {
                     Lb_FFF07 = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Ld_FFF70, 0, 4294967295);
                  }
                  if (Li_FFFF0 == 1) {
                     Lb_FFF07 = OrderModify(OrderTicket(), OrderOpenPrice(), Ld_FFF70, 0, 0, 4294967295);
                  }
               }
               if (Fa_i_09 < 0) {
                  if (Li_FFFF0 == 0) {
                     Lb_FFF07 = OrderModify(OrderTicket(), OrderOpenPrice(), Ld_FFF70, 0, 0, 4294967295);
                  }
                  if (Li_FFFF0 == 1) {
                     Lb_FFF07 = OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), Ld_FFF70, 0, 4294967295);
                  }
               }
            }
            Li_FFFFC = Li_FFFFC - 1;
         } while (Li_FFFFC >= 0);
      }
   }
   ArrayFree(Li_FFE10);

}

bool func_1098(int Fa_i_00)
{
   bool Lb_FFFFF;
   int Li_FFFF8;
   int Li_FFFF4;

   if (Fa_i_00 == 0) {
      if (MaxBuy <= 0) {
         Lb_FFFFF = false;
         return Lb_FFFFF;
      }
      Gi_00000 = InpMagic;
      Gi_00001 = 0;
      Gi_00002 = OrdersTotal() - 1;
      Gi_00003 = Gi_00002;
      if (Gi_00002 >= 0) {
         do {
            if (OrderSelect(Gi_00003, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00000 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00000 && OrderType() == OP_BUY) {
               Gi_00001 = Gi_00001 + 1;
            }
            Gi_00003 = Gi_00003 - 1;
         } while (Gi_00003 >= 0);
      }
      Gi_00002 = Gi_00001;
      Gi_00004 = InpMagic2;
      Gi_00005 = 0;
      Gi_00006 = OrdersTotal() - 1;
      Gi_00007 = Gi_00006;
      if (Gi_00006 >= 0) {
         do {
            if (OrderSelect(Gi_00007, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00004 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00004 && OrderType() == OP_BUY) {
               Gi_00005 = Gi_00005 + 1;
            }
            Gi_00007 = Gi_00007 - 1;
         } while (Gi_00007 >= 0);
      }
      Li_FFFF8 = Gi_00002 + Gi_00005;
      if (Li_FFFF8 < MaxBuy) return false;
      Lb_FFFFF = true;
      return Lb_FFFFF;
   }
   if (MaxSell <= 0) {
      Lb_FFFFF = false;
      return Lb_FFFFF;
   }
   Gi_00006 = InpMagic;
   Gi_00008 = 0;
   Gi_00009 = OrdersTotal() - 1;
   Gi_0000A = Gi_00009;
   if (Gi_00009 >= 0) {
      do {
         if (OrderSelect(Gi_0000A, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00006 && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_00006 && OrderType() == OP_SELL) {
            Gi_00008 = Gi_00008 + 1;
         }
         Gi_0000A = Gi_0000A - 1;
      } while (Gi_0000A >= 0);
   }
   Gi_00009 = Gi_00008;
   Gi_0000B = InpMagic2;
   Gi_0000C = 0;
   Gi_0000D = OrdersTotal() - 1;
   Gi_0000E = Gi_0000D;
   if (Gi_0000D >= 0) {
      do {
         if (OrderSelect(Gi_0000E, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0000B && OrderSymbol() == _Symbol && OrderMagicNumber() == Gi_0000B && OrderType() == OP_SELL) {
            Gi_0000C = Gi_0000C + 1;
         }
         Gi_0000E = Gi_0000E - 1;
      } while (Gi_0000E >= 0);
   }
   Li_FFFF4 = Gi_00009 + Gi_0000C;
   if (Li_FFFF4 < MaxSell) return false;
   Lb_FFFFF = true;
   return Lb_FFFFF;

   Lb_FFFFF = false;

   return Lb_FFFFF;
}

void func_1116(int Fa_i_00, int Fa_i_01, double Fa_d_02, int Fa_i_03)
{
   string tmp_str00000;
   string tmp_str00001;
   int Li_FFFFC;
   double Ld_FFFF0;
   double Ld_FFFE8;
   double Ld_FFFE0;
   bool Lb_FFFDF;
   int Li_FFFD8;

   Li_FFFFC = 0;
   Ld_FFFF0 = _Point;
   Ld_FFFE8 = 0;
   Ld_FFFE0 = 0;
   Lb_FFFDF = false;
   if (Fa_i_01 == 0) return;
   Li_FFFD8 = OrdersTotal() - 1;
   if (Li_FFFD8 < 0) return;
   do {
      if (OrderSelect(Li_FFFD8, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Fa_i_03) {
         if (OrderSymbol() == _Symbol || OrderMagicNumber() == Fa_i_03) {

            if (OrderType() == OP_BUY) {
               Gd_00000 = (Bid - Fa_d_02);
               Li_FFFFC = (int)NormalizeDouble((Gd_00000 / _Point), 0);
               if (Li_FFFFC >= Fa_i_00) {
                  Ld_FFFE8 = OrderStopLoss();
                  Gd_00000 = (Fa_i_01 * Ld_FFFF0);
                  Ld_FFFE0 = (Bid - Gd_00000);
                  Gd_00000 = Ld_FFFE0;
                  Gd_00001 = Bid;
                  Gi_00002 = 0;
                  Gd_00003 = 0;
                  Gd_00004 = 0;
                  Gd_00004 = MarketInfo(_Symbol, MODE_STOPLEVEL);
                  if (_Digits == 3 || _Digits == 5) {

                     Gd_00004 = (Gd_00004 / 10);
                  }
                  Gd_00003 = Gd_00000;
                  if (Gi_00002 == 0) {
                     Gd_00005 = (Gd_00001 - Gd_00000);
                     if ((Gd_00005 < (Gd_00004 * _Point))) {
                        Gd_00003 = 0;
                     }
                  }
                  if (Gi_00002 == 1) {
                     Gd_00005 = (Gd_00003 - Gd_00001);
                     if ((Gd_00005 < (Gd_00004 * _Point))) {
                        Gd_00003 = 0;
                     }
                  }
                  returned_double = NormalizeDouble(Gd_00003, (int)MarketInfo(_Symbol, MODE_DIGITS));
                  Ld_FFFE0 = returned_double;
                  if (Ld_FFFE8 == 0 || (Ld_FFFE8 != 0 && returned_double > Ld_FFFE8)) {

                     Gd_00005 = (Bid - Ld_FFFE8);
                     Gi_00006 = InpTrailStop + InpTrailStep;
                     if ((Gd_00005 > (Gi_00006 * _Point))) {
                        OrderTicket();
                        if (OrdersTotal() > 0 && (Fa_d_02 < Ld_FFFE0)) {
                           Lb_FFFDF = OrderModify(OrderTicket(), Fa_d_02, Ld_FFFE0, OrderTakeProfit(), 0, 16776960);
                           if (Lb_FFFDF != true) {
                              tmp_str00000 = "Normal";
                              Gi_00007 = GetLastError();
                              if (Gi_00007 != 1 && Gi_00007 != 130) {
                                 Print(tmp_str00000, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", Gi_00007, " ");
                              }
                           }
                        }
                     }
                  }
               }
            }
            if (OrderType() == OP_SELL) {
               Gd_00008 = (Fa_d_02 - Ask);
               Li_FFFFC = (int)NormalizeDouble((Gd_00008 / _Point), 0);
               if (Li_FFFFC >= Fa_i_00) {
                  Ld_FFFE8 = OrderStopLoss();
                  Ld_FFFE0 = ((Fa_i_01 * Ld_FFFF0) + Ask);
                  Gd_00008 = Ld_FFFE0;
                  Gd_00009 = Ask;
                  Gi_0000A = 1;
                  Gd_0000B = 0;
                  Gd_0000C = 0;
                  Gd_0000C = MarketInfo(_Symbol, MODE_STOPLEVEL);
                  if (_Digits == 3 || _Digits == 5) {

                     Gd_0000C = (Gd_0000C / 10);
                  }
                  Gd_0000B = Gd_00008;
                  if (Gi_0000A == 0) {
                     Gd_0000D = (Gd_00009 - Gd_00008);
                     if ((Gd_0000D < (Gd_0000C * _Point))) {
                        Gd_0000B = 0;
                     }
                  }
                  if (Gi_0000A == 1) {
                     Gd_0000D = (Gd_0000B - Gd_00009);
                     if ((Gd_0000D < (Gd_0000C * _Point))) {
                        Gd_0000B = 0;
                     }
                  }
                  returned_double = NormalizeDouble(Gd_0000B, (int)MarketInfo(_Symbol, MODE_DIGITS));
                  Ld_FFFE0 = returned_double;
                  if (Ld_FFFE8 == 0 || (Ld_FFFE8 != 0 && returned_double < Ld_FFFE8)) {

                     Gd_0000D = (Ld_FFFE8 - Ask);
                     Gi_0000E = InpTrailStop + InpTrailStep;
                     if (Ld_FFFE8 == 0 || (Gd_0000D > (Gi_0000E * _Point))) {

                        OrderTicket();
                        if (OrdersTotal() > 0 && (Fa_d_02 > Ld_FFFE0)) {
                           Lb_FFFDF = OrderModify(OrderTicket(), Fa_d_02, Ld_FFFE0, OrderTakeProfit(), 0, 255);
                           if (Lb_FFFDF != true) {
                              tmp_str00001 = "Normal";
                              Gi_0000F = GetLastError();
                              if (Gi_0000F != 1 && Gi_0000F != 130) {
                                 Print(tmp_str00001, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", Gi_0000F, " ");
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      Li_FFFD8 = Li_FFFD8 - 1;
   } while (Li_FFFD8 >= 0);

}

void func_1117(int Fa_i_00, int Fa_i_01, double Fa_d_02, int Fa_i_03)
{
   string tmp_str00000;
   string tmp_str00001;
   int Li_FFFFC;
   double Ld_FFFF0;
   double Ld_FFFE8;
   double Ld_FFFE0;
   bool Lb_FFFDF;
   int Li_FFFD8;

   Li_FFFFC = 0;
   Ld_FFFF0 = _Point;
   Ld_FFFE8 = 0;
   Ld_FFFE0 = 0;
   Lb_FFFDF = false;
   if (Fa_i_01 == 0) return;
   Li_FFFD8 = OrdersTotal() - 1;
   if (Li_FFFD8 < 0) return;
   do {
      if (OrderSelect(Li_FFFD8, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Fa_i_03) {
         if (OrderSymbol() == _Symbol || OrderMagicNumber() == Fa_i_03) {

            if (OrderType() == OP_BUY) {
               Gd_00000 = (Bid - Fa_d_02);
               Li_FFFFC = (int)NormalizeDouble((Gd_00000 / _Point), 0);
               Gd_00000 = (Fa_i_00 * Ld_FFFF0);
               if (Li_FFFFC >= Gd_00000) {
                  Ld_FFFE8 = OrderStopLoss();
                  Gd_00000 = (Fa_i_01 * Ld_FFFF0);
                  Ld_FFFE0 = (Bid - Gd_00000);
                  Gd_00000 = Ld_FFFE0;
                  Gd_00001 = Bid;
                  Gi_00002 = 0;
                  Gd_00003 = 0;
                  Gd_00004 = 0;
                  Gd_00004 = MarketInfo(_Symbol, MODE_STOPLEVEL);
                  if (_Digits == 3 || _Digits == 5) {

                     Gd_00004 = (Gd_00004 / 10);
                  }
                  Gd_00003 = Gd_00000;
                  if (Gi_00002 == 0) {
                     Gd_00005 = (Gd_00001 - Gd_00000);
                     if ((Gd_00005 < (Gd_00004 * _Point))) {
                        Gd_00003 = 0;
                     }
                  }
                  if (Gi_00002 == 1) {
                     Gd_00005 = (Gd_00003 - Gd_00001);
                     if ((Gd_00005 < (Gd_00004 * _Point))) {
                        Gd_00003 = 0;
                     }
                  }
                  returned_double = NormalizeDouble(Gd_00003, (int)MarketInfo(_Symbol, MODE_DIGITS));
                  Ld_FFFE0 = returned_double;
                  if (Ld_FFFE8 == 0 || (Ld_FFFE8 != 0 && returned_double > Ld_FFFE8)) {

                     Gd_00005 = (Bid - Ld_FFFE0);
                     Gi_00006 = InpTrailStop + InpTrailStep;
                     if ((Gd_00005 > (Gi_00006 * _Point))) {
                        OrderTicket();
                        if (OrdersTotal() > 0 && (Fa_d_02 < Ld_FFFE0)) {
                           Lb_FFFDF = OrderModify(OrderTicket(), Fa_d_02, Ld_FFFE0, OrderTakeProfit(), 0, 16776960);
                           if (Lb_FFFDF != true) {
                              tmp_str00000 = "Normal";
                              Gi_00007 = GetLastError();
                              if (Gi_00007 != 1 && Gi_00007 != 130) {
                                 Print(tmp_str00000, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", Gi_00007, " ");
                              }
                           }
                        }
                     }
                  }
               }
            }
            if (OrderType() == OP_SELL) {
               Gd_00008 = (Fa_d_02 - Ask);
               Li_FFFFC = (int)NormalizeDouble((Gd_00008 / _Point), 0);
               Gd_00008 = (Fa_i_00 * Ld_FFFF0);
               if (Li_FFFFC >= Gd_00008) {
                  Ld_FFFE8 = OrderStopLoss();
                  Ld_FFFE0 = ((Fa_i_01 * Ld_FFFF0) + Ask);
                  Gd_00008 = Ld_FFFE0;
                  Gd_00009 = Ask;
                  Gi_0000A = 1;
                  Gd_0000B = 0;
                  Gd_0000C = 0;
                  Gd_0000C = MarketInfo(_Symbol, MODE_STOPLEVEL);
                  if (_Digits == 3 || _Digits == 5) {

                     Gd_0000C = (Gd_0000C / 10);
                  }
                  Gd_0000B = Gd_00008;
                  if (Gi_0000A == 0) {
                     Gd_0000D = (Gd_00009 - Gd_00008);
                     if ((Gd_0000D < (Gd_0000C * _Point))) {
                        Gd_0000B = 0;
                     }
                  }
                  if (Gi_0000A == 1) {
                     Gd_0000D = (Gd_0000B - Gd_00009);
                     if ((Gd_0000D < (Gd_0000C * _Point))) {
                        Gd_0000B = 0;
                     }
                  }
                  returned_double = NormalizeDouble(Gd_0000B, (int)MarketInfo(_Symbol, MODE_DIGITS));
                  Ld_FFFE0 = returned_double;
                  if (Ld_FFFE8 == 0 || (Ld_FFFE8 != 0 && returned_double < Ld_FFFE8)) {

                     Gd_0000D = (Ld_FFFE0 - Ask);
                     Gi_0000E = InpTrailStop + InpTrailStep;
                     if ((Gd_0000D > (Gi_0000E * _Point))) {
                        OrderTicket();
                        if (OrdersTotal() > 0 && (Fa_d_02 > Ld_FFFE0)) {
                           Lb_FFFDF = OrderModify(OrderTicket(), Fa_d_02, Ld_FFFE0, OrderTakeProfit(), 0, 255);
                           if (Lb_FFFDF != true) {
                              tmp_str00001 = "Normal";
                              Gi_0000F = GetLastError();
                              if (Gi_0000F != 1 && Gi_0000F != 130) {
                                 Print(tmp_str00001, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", Gi_0000F, " ");
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         Sleep(1000);
      }
      Li_FFFD8 = Li_FFFD8 - 1;
   } while (Li_FFFD8 >= 0);

}

void func_1129(int Fa_i_00, int Fa_i_01, double Fa_d_02, int Fa_i_03)
{
   string tmp_str00000;
   string tmp_str00001;
   int Li_FFFFC;
   double Ld_FFFF0;
   double Ld_FFFE8;
   double Ld_FFFE0;
   bool Lb_FFFDF;
   int Li_FFFD8;

   Li_FFFFC = 0;
   Gi_00000 = _Digits - 1;
   returned_double = MathPow(10, Gi_00000);
   Ld_FFFF0 = (1.0 / returned_double);
   if (_Digits == 3 || _Digits == 5) {

      Gi_00000 = _Digits - 1;
      returned_double = MathPow(10, Gi_00000);
      Ld_FFFF0 = (1.0 / returned_double);
   }
   else {
      Ld_FFFF0 = _Point;
   }
   Ld_FFFE8 = 0;
   Ld_FFFE0 = 0;
   Lb_FFFDF = false;
   if (Fa_i_00 == 0) return;
   Li_FFFD8 = OrdersTotal() - 1;
   if (Li_FFFD8 < 0) return;
   do {
      if (OrderSelect(Li_FFFD8, 0, 0) && OrderSymbol() == _Symbol && OrderMagicNumber() == Fa_i_03) {
         if (OrderSymbol() == _Symbol || OrderMagicNumber() == Fa_i_03) {

            if (OrderType() == OP_BUY) {
               Gd_00000 = (Bid - Fa_d_02);
               Li_FFFFC = (int)NormalizeDouble((Gd_00000 / _Point), 0);
               Gd_00000 = (Fa_i_00 * Ld_FFFF0);
               if (Li_FFFFC > Gd_00000) {
                  Ld_FFFE8 = OrderStopLoss();
                  Ld_FFFE0 = ((Fa_i_01 * Ld_FFFF0) + Fa_d_02);
                  Gd_00000 = Ld_FFFE0;
                  Gd_00001 = Bid;
                  Gi_00002 = 0;
                  Gd_00003 = 0;
                  Gd_00004 = 0;
                  Gd_00004 = MarketInfo(_Symbol, MODE_STOPLEVEL);
                  if (_Digits == 3 || _Digits == 5) {

                     Gd_00004 = (Gd_00004 / 10);
                  }
                  Gd_00003 = Gd_00000;
                  if (Gi_00002 == 0) {
                     Gd_00005 = (Gd_00001 - Gd_00000);
                     if ((Gd_00005 < (Gd_00004 * _Point))) {
                        Gd_00003 = 0;
                     }
                  }
                  if (Gi_00002 == 1) {
                     Gd_00005 = (Gd_00003 - Gd_00001);
                     if ((Gd_00005 < (Gd_00004 * _Point))) {
                        Gd_00003 = 0;
                     }
                  }
                  returned_double = NormalizeDouble(Gd_00003, (int)MarketInfo(_Symbol, MODE_DIGITS));
                  Ld_FFFE0 = returned_double;
                  if ((Bid >= ((Fa_i_01 * Ld_FFFF0) + Fa_d_02))) {
                     if (Ld_FFFE8 == 0 || (Ld_FFFE8 != 0 && returned_double > Ld_FFFE8)) {

                        OrderTicket();
                        if (OrdersTotal() > 0) {
                           Lb_FFFDF = OrderModify(OrderTicket(), Fa_d_02, Ld_FFFE0, OrderTakeProfit(), 0, 16776960);
                           if (Lb_FFFDF != true) {
                              tmp_str00000 = "Normal";
                              Gi_00006 = GetLastError();
                              if (Gi_00006 != 1 && Gi_00006 != 130) {
                                 Print(tmp_str00000, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", Gi_00006, " ");
                              }
                           }
                        }
                     }
                  }
               }
            }
            if (OrderType() == OP_SELL) {
               Gd_00007 = (Fa_d_02 - Ask);
               Li_FFFFC = (int)NormalizeDouble((Gd_00007 / _Point), 0);
               Gd_00007 = (Fa_i_00 * Ld_FFFF0);
               if (Li_FFFFC > Gd_00007) {
                  Ld_FFFE8 = OrderStopLoss();
                  Gd_00007 = (Fa_i_01 * Ld_FFFF0);
                  Ld_FFFE0 = (Fa_d_02 - Gd_00007);
                  Gd_00007 = Ld_FFFE0;
                  Gd_00008 = Ask;
                  Gi_00009 = 1;
                  Gd_0000A = 0;
                  Gd_0000B = 0;
                  Gd_0000B = MarketInfo(_Symbol, MODE_STOPLEVEL);
                  if (_Digits == 3 || _Digits == 5) {

                     Gd_0000B = (Gd_0000B / 10);
                  }
                  Gd_0000A = Gd_00007;
                  if (Gi_00009 == 0) {
                     Gd_0000C = (Gd_00008 - Gd_00007);
                     if ((Gd_0000C < (Gd_0000B * _Point))) {
                        Gd_0000A = 0;
                     }
                  }
                  if (Gi_00009 == 1) {
                     Gd_0000C = (Gd_0000A - Gd_00008);
                     if ((Gd_0000C < (Gd_0000B * _Point))) {
                        Gd_0000A = 0;
                     }
                  }
                  returned_double = NormalizeDouble(Gd_0000A, (int)MarketInfo(_Symbol, MODE_DIGITS));
                  Ld_FFFE0 = returned_double;
                  Gd_0000C = (Fa_i_01 * Ld_FFFF0);
                  if ((Ask <= (Fa_d_02 - Gd_0000C))) {
                     if (Ld_FFFE8 == 0 || (Ld_FFFE8 != 0 && returned_double < Ld_FFFE8)) {

                        OrderTicket();
                        if (OrdersTotal() > 0) {
                           Lb_FFFDF = OrderModify(OrderTicket(), Fa_d_02, Ld_FFFE0, OrderTakeProfit(), 0, 255);
                           if (Lb_FFFDF != true) {
                              tmp_str00001 = "Normal";
                              Gi_0000D = GetLastError();
                              if (Gi_0000D != 1 && Gi_0000D != 130) {
                                 Print(tmp_str00001, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", Gi_0000D, " ");
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         Sleep(1000);
      }
      Li_FFFD8 = Li_FFFD8 - 1;
   } while (Li_FFFD8 >= 0);

}

double get_total_loss(int Fa_i_00, string Fa_s_01, int Fa_i_02, int Fa_i_03, int& Fa_i_04[])
{
   int Li_FFFF4;
   double Ld_FFFE8;
   long Ll_FFFE0;
   int Li_FFFDC;
   int Li_FFC84;
   int Li_FFC80;
   double Ld_FFFF8;

   Li_FFFF4 = 0;
   Ld_FFFE8 = 0;
   Ll_FFFE0 = 4102358400;
   Li_FFFDC = 0;
   double Ld_FFCBC[100];
   ArrayInitialize(Ld_FFCBC, 0);
   Li_FFC84 = 0;
   if (OrdersTotal() > 0) {
      do {
         if (OrderSelect(Li_FFC84, 0, 0) && OrderType() == Fa_i_02 && OrderSymbol() == Fa_s_01 && OrderMagicNumber() == Fa_i_00 && Ll_FFFE0 > OrderOpenTime()) {
            Ll_FFFE0 = OrderOpenTime();
            Li_FFFF4 = OrderTicket();
            Gd_00000 = OrderProfit();
            Gd_00000 = (Gd_00000 + OrderCommission());
            Ld_FFFE8 = (Gd_00000 + OrderSwap());
            if ((Ld_FFFE8 < 0)) {
               Fa_i_04[Li_FFFDC] = Li_FFFF4;
               Ld_FFCBC[Li_FFFDC] = Ld_FFFE8;
               Li_FFFDC = Li_FFFDC + 1;
            }
         }
         Li_FFC84 = Li_FFC84 + 1;
      } while (Li_FFC84 < OrdersTotal());
   }
   Li_FFC80 = 0;
   if (Fa_i_03 > 0) {
      do {
         Ld_FFFE8 = (Ld_FFFE8 + Ld_FFCBC[Li_FFC80]);
         Li_FFC80 = Li_FFC80 + 1;
      } while (Li_FFC80 < Fa_i_03);
   }
   Ld_FFFF8 = Ld_FFFE8;
   ArrayFree(Ld_FFCBC);
   return Ld_FFFE8;
}

void func_1137(int Fa_i_00)
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;
   string tmp_str00004;
   string tmp_str00005;
   string tmp_str00006;
   int Li_FFFFC;
   int Li_FFFF8;
   double Ld_FFFF0;
   int Li_FFFEC;
   int Li_FFFE8;
   double Ld_FFFE0;
   int Li_FFFDC;
   int Li_FFFD8;
   double Ld_FFFD0;

   if (Fa_i_00 == 1) {
      Li_FFFFC = 0;
      Gi_00000 = 0;
      Gi_00001 = OrdersTotal() - 1;
      Gi_00002 = Gi_00001;
      if (Gi_00001 >= 0) {
         do {
            if (OrderSelect(Gi_00002, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if (OrderSymbol() == _Symbol) {
                     if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                        if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                           Gi_00000 = Gi_00000 + 1;
                        }
                     }
                  }
               }
            }
            Gi_00002 = Gi_00002 - 1;
         } while (Gi_00002 >= 0);
      }
      Li_FFFF8 = Gi_00000;
      if (Gi_00000 == 0) {
         ObjectSetInteger(0, "butCAO", 1018, 0);
         return;
      }
      ObjectSetInteger(0, "butCAO", 6, 11119017);
      Gd_00001 = 0;
      Gi_00003 = OrdersTotal() - 1;
      Gi_00004 = Gi_00003;
      if (Gi_00003 >= 0) {
         do {
            if (OrderSelect(Gi_00004, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if (OrderSymbol() == _Symbol) {
                     if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                        if (OrderType() == OP_BUY || OrderType() == OP_SELL) {

                           Gd_00001 = (Gd_00001 + OrderProfit());
                        }
                     }
                  }
               }
            }
            Gi_00004 = Gi_00004 - 1;
         } while (Gi_00004 >= 0);
      }
      returned_double = NormalizeDouble(Gd_00001, 2);
      Ld_FFFF0 = returned_double;
      tmp_str00000 = "CLOSE ALL ORDERS : " + _Symbol;
      tmp_str00001 = "Are you sure to CLOSE ALL ORDERS of " + _Symbol;
      tmp_str00001 = tmp_str00001 + ".\nThere are ";
      tmp_str00002 = (string)Li_FFFF8;
      tmp_str00001 = tmp_str00001 + tmp_str00002;
      tmp_str00001 = tmp_str00001 + " orders, and Total P/L of $";
      tmp_str00001 = tmp_str00001 + DoubleToString(returned_double, 2);
      Li_FFFFC = MessageBox(tmp_str00001, tmp_str00000, 308);
      if (Li_FFFFC == 6) {
         Ii_0029C = OrdersTotal() - 1;
         if (Ii_0029C >= 0) {
            do {
               Ii_00294 = OrderSelect(Ii_0029C, 0, 0);
               if (OrderSymbol() == _Symbol) {
                  if (OrderType() == OP_BUY) {
                     Ii_00298 = OrderClose(OrderTicket(), OrderLots(), Bid, 5, 4294967295);
                  }
                  if (OrderType() == OP_SELL) {
                     Ii_00298 = OrderClose(OrderTicket(), OrderLots(), Ask, 5, 4294967295);
                  }
               }
               Ii_0029C = Ii_0029C - 1;
            } while (Ii_0029C >= 0);
         }
         ObjectSetInteger(0, "butCAO", 1018, 0);
         ObjectSetInteger(0, "butCAO", 6, 0);
      }
      else {
         if (Li_FFFFC == 7) {
            ObjectSetInteger(0, "butCAO", 1018, 0);
            ObjectSetInteger(0, "butCAO", 6, 0);
         }
      }
   }
   if (Fa_i_00 == 2) {
      Li_FFFEC = 0;
      Gi_00008 = 0;
      Gi_00009 = OrdersTotal() - 1;
      Gi_0000A = Gi_00009;
      if (Gi_00009 >= 0) {
         do {
            if (OrderSelect(Gi_0000A, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if (OrderSymbol() == _Symbol) {
                     if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                        if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                           Gi_00008 = Gi_00008 + 1;
                        }
                     }
                  }
               }
            }
            Gi_0000A = Gi_0000A - 1;
         } while (Gi_0000A >= 0);
      }
      Li_FFFE8 = Gi_00008;
      if (Gi_00008 == 0) {
         ObjectSetInteger(0, "butCAP", 1018, 0);
         return;
      }
      ObjectSetInteger(0, "butCAP", 6, 11119017);
      Gd_00009 = 0;
      Ii_002B0 = 0;
      Gi_0000B = OrdersTotal() - 1;
      Gi_0000C = Gi_0000B;
      if (Gi_0000B >= 0) {
         do {
            Ii_00294 = OrderSelect(Gi_0000C, 0, 0);
            if (OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if ((OrderProfit() > 0)) {
                     Gd_00009 = (Gd_00009 + OrderProfit());
                     Ii_002B0 = Ii_002B0 + 1;
                  }
               }
            }
            Gi_0000C = Gi_0000C - 1;
         } while (Gi_0000C >= 0);
      }
      returned_double = NormalizeDouble(Gd_00009, 2);
      Ld_FFFE0 = returned_double;
      tmp_str00002 = "CLOSE ALL PROFITS : " + _Symbol;
      tmp_str00003 = "Are you sure to CLOSE ALL PROFITS of " + _Symbol;
      tmp_str00003 = tmp_str00003 + ".\nThere are ";
      tmp_str00004 = (string)Ii_002B0;
      tmp_str00003 = tmp_str00003 + tmp_str00004;
      tmp_str00003 = tmp_str00003 + " orders profit, and Total P/L of $";
      tmp_str00003 = tmp_str00003 + DoubleToString(returned_double, 2);
      Li_FFFEC = MessageBox(tmp_str00003, tmp_str00002, 308);
      if (Li_FFFEC == 6) {
         Ii_0029C = OrdersTotal() - 1;
         if (Ii_0029C >= 0) {
            do {
               Ii_00294 = OrderSelect(Ii_0029C, 0, 0);
               if (OrderSymbol() == _Symbol) {
                  if (OrderType() == OP_BUY && (OrderProfit() > 0.01)) {
                     Ii_00298 = OrderClose(OrderTicket(), OrderLots(), Bid, 5, 4294967295);
                  }
                  if (OrderType() == OP_SELL && (OrderProfit() > 0.01)) {
                     Ii_00298 = OrderClose(OrderTicket(), OrderLots(), Ask, 5, 4294967295);
                  }
               }
               Ii_0029C = Ii_0029C - 1;
            } while (Ii_0029C >= 0);
         }
         ObjectSetInteger(0, "butCAP", 1018, 0);
         ObjectSetInteger(0, "butCAP", 6, 0);
      }
      else {
         if (Li_FFFEC == 7) {
            ObjectSetInteger(0, "butCAP", 1018, 0);
            ObjectSetInteger(0, "butCAP", 6, 0);
         }
      }
   }
   if (Fa_i_00 == 3) {
      Li_FFFDC = 0;
      Gi_00010 = 0;
      Gi_00011 = OrdersTotal() - 1;
      Gi_00012 = Gi_00011;
      if (Gi_00011 >= 0) {
         do {
            if (OrderSelect(Gi_00012, 0, 0) && OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if (OrderSymbol() == _Symbol) {
                     if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                        if (OrderType() == OP_SELL || OrderType() == OP_BUY) {

                           Gi_00010 = Gi_00010 + 1;
                        }
                     }
                  }
               }
            }
            Gi_00012 = Gi_00012 - 1;
         } while (Gi_00012 >= 0);
      }
      Li_FFFD8 = Gi_00010;
      if (Gi_00010 == 0) {
         ObjectSetInteger(0, "butCAL", 1018, 0);
         return;
      }
      ObjectSetInteger(0, "butCAL", 6, 11119017);
      Gd_00011 = 0;
      Ii_002B4 = 0;
      Gi_00013 = OrdersTotal() - 1;
      Gi_00014 = Gi_00013;
      if (Gi_00013 >= 0) {
         do {
            Ii_00294 = OrderSelect(Gi_00014, 0, 0);
            if (OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if ((OrderProfit() < 0)) {
                     Gd_00011 = (Gd_00011 + OrderProfit());
                     Ii_002B4 = Ii_002B4 + 1;
                  }
               }
            }
            Gi_00014 = Gi_00014 - 1;
         } while (Gi_00014 >= 0);
      }
      returned_double = NormalizeDouble(Gd_00011, 2);
      Ld_FFFD0 = returned_double;
      tmp_str00004 = "CLOSE ALL LOSSES : " + _Symbol;
      tmp_str00005 = "Are you sure to CLOSE ALL LOSSES of " + _Symbol;
      tmp_str00005 = tmp_str00005 + ".\nThere are ";
      tmp_str00006 = (string)Ii_002B4;
      tmp_str00005 = tmp_str00005 + tmp_str00006;
      tmp_str00005 = tmp_str00005 + " orders loss, and Total P/L of $";
      tmp_str00005 = tmp_str00005 + DoubleToString(returned_double, 2);
      Li_FFFDC = MessageBox(tmp_str00005, tmp_str00004, 308);
      if (Li_FFFDC == 6) {
         Ii_0029C = OrdersTotal() - 1;
         if (Ii_0029C >= 0) {
            do {
               Ii_00294 = OrderSelect(Ii_0029C, 0, 0);
               if (OrderSymbol() == _Symbol) {
                  if (OrderType() == OP_BUY && (OrderProfit() <= -0.01)) {
                     Ii_00298 = OrderClose(OrderTicket(), OrderLots(), Bid, 5, 4294967295);
                  }
                  if (OrderType() == OP_SELL && (OrderProfit() <= -0.01)) {
                     Ii_00298 = OrderClose(OrderTicket(), OrderLots(), Ask, 5, 4294967295);
                  }
               }
               Ii_0029C = Ii_0029C - 1;
            } while (Ii_0029C >= 0);
         }
         ObjectSetInteger(0, "butCAL", 1018, 0);
         ObjectSetInteger(0, "butCAL", 6, 0);
      }
      else {
         if (Li_FFFDC == 7) {
            ObjectSetInteger(0, "butCAL", 1018, 0);
            ObjectSetInteger(0, "butCAL", 6, 0);
         }
      }
   }
   if (Fa_i_00 != 4) return;
   if (Ii_002B8 == 0) {
      Ii_002B8 = 1;
      func_1093('');
      ObjectSetInteger(0, "butN4", 1018, 0);
      return;
   }
   if (Ii_002B8 != 1) return;
   Ii_002B8 = 0;
   func_1093('');
   ObjectSetInteger(0, "butN4", 1018, 0);

}

void func_1139()
{
   int Li_FFFFC;
   string Ls_FFFF0;
   int Li_FFFEC;
   int Li_FFFE8;
   int Li_FFFE4;
   int Li_FFFE0;

   Li_FFFFC = 0;
   Li_FFFEC = 0;
   if (ArraySize(Is_0BECC) > 0) {
      do {
         Ls_FFFF0 = Is_0BECC[Li_FFFEC];
         if (Ls_FFFF0 == "Day1") {
            Ls_FFFF0 = TimeToString(iTime(_Symbol, 1440, 2), 1);
         }
         if (Ls_FFFF0 == "Day2") {
            Ls_FFFF0 = TimeToString(iTime(_Symbol, 1440, 3), 1);
         }
         if (Ls_FFFF0 == "Day3") {
            Ls_FFFF0 = TimeToString(iTime(_Symbol, 1440, 4), 1);
         }
         Gi_00001 = Li_FFFEC * Ii_0C184;
         Li_FFFFC = Ii_0C180 + Gi_00001;
         if (Li_FFFEC == 0) {
            Li_FFFFC = Li_FFFFC - 10;
         }
         func_1142(Is_0BECC[Li_FFFEC], Ii_0C17C, Li_FFFFC, Ls_FFFF0, 16777215, 8);
         if (Li_FFFEC == 0) {
            Gi_00002 = Li_FFFEC * Ii_0C184;
            Gi_00002 = Ii_0C180 + Gi_00002;
            func_1142("Dotted_Line0", (Ii_0C17C - 30), (Gi_00002 + 5), "---------------------------------------------------------------------------------------------------", 16777215, 11);
         }
         Gi_00003 = ArraySize(Is_0BECC) - 1;
         if (Li_FFFEC == Gi_00003) {
            Gi_00003 = Li_FFFEC * Ii_0C184;
            Gi_00003 = Ii_0C180 + Gi_00003;
            func_1142("Dotted_Line1", (Ii_0C17C - 30), (Gi_00003 + 15), "---------------------------------------------------------------------------------------------------", 16777215, 11);
         }
         Li_FFFEC = Li_FFFEC + 1;
      } while (Li_FFFEC < ArraySize(Is_0BECC));
   }
   Li_FFFE8 = 0;
   if (ArraySize(Is_0BF6C) > 0) {
      do {
         if (Li_FFFE8 == 0) {
            Gi_00005 = Li_FFFE8 * Ii_0C184;
            Gi_00005 = Ii_0C180 + Gi_00005;
            func_1142(Is_0BF6C[Li_FFFE8], (Ii_0C17C + 100), (Gi_00005 - 10), Is_0BF6C[Li_FFFE8], 16777215, 8);
         }
         else {
            Gi_00006 = Li_FFFE8 * Ii_0C184;
            func_1142(Is_0BF6C[Li_FFFE8], (Ii_0C17C + 100), (Ii_0C180 + Gi_00006), "0", 16777215, 8);
         }
         Li_FFFE8 = Li_FFFE8 + 1;
      } while (Li_FFFE8 < ArraySize(Is_0BF6C));
   }
   Li_FFFE4 = 0;
   if (ArraySize(Is_0C00C) > 0) {
      do {
         if (Li_FFFE4 == 0) {
            Gi_0000A = Li_FFFE4 * Ii_0C184;
            Gi_0000A = Ii_0C180 + Gi_0000A;
            func_1142(Is_0C00C[Li_FFFE4], (Ii_0C17C + 200), (Gi_0000A - 10), Is_0C00C[Li_FFFE4], 16777215, 8);
         }
         else {
            Gi_0000B = Li_FFFE4 * Ii_0C184;
            func_1142(Is_0C00C[Li_FFFE4], (Ii_0C17C + 200), (Ii_0C180 + Gi_0000B), "0", 16777215, 8);
         }
         Li_FFFE4 = Li_FFFE4 + 1;
      } while (Li_FFFE4 < ArraySize(Is_0C00C));
   }
   Li_FFFE0 = 0;
   if (ArraySize(Is_0C0AC) <= 0) return;
   do {
      if (Li_FFFE0 == 0) {
         Gi_0000F = Li_FFFE0 * Ii_0C184;
         Gi_0000F = Ii_0C180 + Gi_0000F;
         func_1142(Is_0C0AC[Li_FFFE0], (Ii_0C17C + 300), (Gi_0000F - 10), Is_0C0AC[Li_FFFE0], 16777215, 8);
      }
      else {
         Gi_00010 = Li_FFFE0 * Ii_0C184;
         func_1142(Is_0C0AC[Li_FFFE0], (Ii_0C17C + 300), (Ii_0C180 + Gi_00010), "0", 16777215, 10);
      }
      Li_FFFE0 = Li_FFFE0 + 1;
   } while (Li_FFFE0 < ArraySize(Is_0C0AC));

}

bool func_1141(string Fa_s_00, int Fa_i_01, int Fa_i_02, string Fa_s_03)
{
   long Ll_FFFF0;
   int Li_FFFEC;
   int Li_FFFE8;
   int Li_FFFE4;
   string Ls_FFFD8;
   int Li_FFFD4;
   int Li_FFFD0;
   bool Lb_FFFCF;
   int Li_FFFC8;
   int Li_FFFC4;
   int Li_FFFC0;
   int Li_FFFBC;
   bool Lb_FFFBB;
   bool Lb_FFFBA;
   bool Lb_FFFB9;
   long Ll_FFFB0;
   bool Lb_FFFFF;

   Ll_FFFF0 = 0;
   Li_FFFEC = 0;
   Li_FFFE8 = 90;
   Li_FFFE4 = 40;
   Ls_FFFD8 = "Arial";
   Li_FFFD4 = 13;
   Li_FFFD0 = 2;
   Lb_FFFCF = true;
   Li_FFFC8 = 1;
   Li_FFFC4 = 16777215;
   Li_FFFC0 = 255;
   Li_FFFBC = (int)4294967295;
   Lb_FFFBB = false;
   Lb_FFFBA = false;
   Lb_FFFB9 = true;
   Ll_FFFB0 = 0;
   ObjectDelete(0, Fa_s_00);
   if (ObjectCreate(0, Fa_s_00, OBJ_EDIT, 0, 0, 0) != true) {
      Print("EditCreate", ": failed to create \"Edit\" object! Error code = ", GetLastError());
      Lb_FFFFF = false;
      return Lb_FFFFF;
   }
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 102, Fa_i_01);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 103, Fa_i_02);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1019, Li_FFFE8);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1020, Li_FFFE4);
   ObjectSetString(Ll_FFFF0, Fa_s_00, 999, Fa_s_03);
   ObjectSetString(Ll_FFFF0, Fa_s_00, 1001, Ls_FFFD8);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 100, Li_FFFD4);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1036, Li_FFFD0);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1028, Lb_FFFCF);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 101, Li_FFFC8);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 6, Li_FFFC4);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1025, Li_FFFC0);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1035, Li_FFFBC);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 9, Lb_FFFBB);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1000, Lb_FFFBA);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 17, Lb_FFFBA);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 208, Lb_FFFB9);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 207, Ll_FFFB0);
   Lb_FFFFF = true;

   return Lb_FFFFF;
}

bool func_1142(string Fa_s_00, int Fa_i_01, int Fa_i_02, string Fa_s_03, int Fa_i_04, int Fa_i_05)
{
   long Ll_FFFF0;
   int Li_FFFEC;
   int Li_FFFE8;
   string Ls_FFFD8;
   double Ld_FFFD0;
   int Li_FFFCC;
   bool Lb_FFFCB;
   bool Lb_FFFCA;
   bool Lb_FFFC9;
   long Ll_FFFC0;
   bool Lb_FFFFF;

   Ll_FFFF0 = 0;
   Li_FFFEC = 0;
   Li_FFFE8 = 0;
   Ls_FFFD8 = "Arial";
   Ld_FFFD0 = 0;
   Li_FFFCC = 0;
   Lb_FFFCB = false;
   Lb_FFFCA = false;
   Lb_FFFC9 = true;
   Ll_FFFC0 = 0;
   ObjectDelete(Fa_s_00);
   if (ObjectCreate(0, Fa_s_00, OBJ_LABEL, 0, 0, 0) != true) {
      Print("LabelCreate", ": failed to create text label! Error code = ", GetLastError());
      Lb_FFFFF = false;
      return Lb_FFFFF;
   }
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 102, Fa_i_01);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 103, Fa_i_02);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 101, Li_FFFE8);
   ObjectSetString(Ll_FFFF0, Fa_s_00, 999, Fa_s_03);
   ObjectSetString(Ll_FFFF0, Fa_s_00, 1001, Ls_FFFD8);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 100, Fa_i_05);
   ObjectSetDouble(Ll_FFFF0, Fa_s_00, 13, Ld_FFFD0);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1011, Li_FFFCC);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 6, Fa_i_04);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 9, Lb_FFFCB);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1000, Lb_FFFCA);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 17, Lb_FFFCA);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 208, Lb_FFFC9);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 207, Ll_FFFC0);
   Lb_FFFFF = true;

   return Lb_FFFFF;
}

bool func_1143(string Fa_s_00, int Fa_i_01, int Fa_i_02, string Fa_s_03, int Fa_i_04, int Fa_i_05)
{
   long Ll_FFFF0;
   int Li_FFFEC;
   int Li_FFFE8;
   string Ls_FFFD8;
   double Ld_FFFD0;
   int Li_FFFCC;
   bool Lb_FFFCB;
   bool Lb_FFFCA;
   bool Lb_FFFC9;
   long Ll_FFFC0;
   bool Lb_FFFFF;

   Ll_FFFF0 = 0;
   Li_FFFEC = 0;
   Li_FFFE8 = 1;
   Ls_FFFD8 = "Arial";
   Ld_FFFD0 = 0;
   Li_FFFCC = 6;
   Lb_FFFCB = false;
   Lb_FFFCA = false;
   Lb_FFFC9 = true;
   Ll_FFFC0 = 0;
   ObjectDelete(Fa_s_00);
   if (ObjectCreate(0, Fa_s_00, OBJ_LABEL, 0, 0, 0) != true) {
      Print("LabelCreate2", ": failed to create text label! Error code = ", GetLastError());
      Lb_FFFFF = false;
      return Lb_FFFFF;
   }
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 102, Fa_i_01);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 103, Fa_i_02);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 101, Li_FFFE8);
   ObjectSetString(Ll_FFFF0, Fa_s_00, 999, Fa_s_03);
   ObjectSetString(Ll_FFFF0, Fa_s_00, 1001, Ls_FFFD8);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 100, Fa_i_05);
   ObjectSetDouble(Ll_FFFF0, Fa_s_00, 13, Ld_FFFD0);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1011, Li_FFFCC);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 6, Fa_i_04);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 9, Lb_FFFCB);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 1000, Lb_FFFCA);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 17, Lb_FFFCA);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 208, Lb_FFFC9);
   ObjectSetInteger(Ll_FFFF0, Fa_s_00, 207, Ll_FFFC0);
   Lb_FFFFF = true;

   return Lb_FFFFF;
}

void func_1152()
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;
   string tmp_str00004;
   string tmp_str00005;
   string tmp_str00006;
   string tmp_str00007;
   string tmp_str00008;
   string tmp_str00009;
   string tmp_str0000A;
   string tmp_str0000B;
   string tmp_str0000C;
   string tmp_str0000D;
   string tmp_str0000E;
   string tmp_str0000F;
   string tmp_str00010;
   string tmp_str00011;
   string tmp_str00012;
   string tmp_str00013;
   string tmp_str00014;
   string tmp_str00015;
   string tmp_str00016;
   string tmp_str00017;
   string tmp_str00018;
   long Ll_FFFF8;
   long Ll_FFFF0;
   long Ll_FFFE8;
   long Ll_FFFE0;
   long Ll_FFFD8;
   long Ll_FFFD0;
   long Ll_FFFC8;
   double Ld_FFFC0;
   double Ld_FFFB8;
   double Ld_FFFB0;
   double Ld_FFFA8;
   double Ld_FFFA0;
   double Ld_FFF98;
   double Ld_FFF90;
   double Ld_FFF88;
   double Ld_FFF80;
   double Ld_FFF78;
   double Ld_FFF70;
   double Ld_FFF68;
   double Ld_FFF60;
   double Ld_FFF58;
   double Ld_FFF50;
   double Ld_FFF48;
   double Ld_FFF40;
   double Ld_FFF38;
   double Ld_FFF30;
   double Ld_FFF28;
   double Ld_FFF20;
   double Ld_FFF18;
   double Ld_FFF10;
   double Ld_FFF08;
   double Ld_FFF00;
   double Ld_FFEF8;

   Ll_FFFF8 = iTime(_Symbol, 1440, 1);
   Ll_FFFF0 = iTime(_Symbol, 1440, 2);
   Ll_FFFE8 = iTime(_Symbol, 1440, 3);
   Ll_FFFE0 = iTime(_Symbol, 1440, 4);
   Ll_FFFD8 = iTime(_Symbol, 10080, 0);
   Ll_FFFD0 = iTime(_Symbol, 43200, 0);
   Gl_00000 = iTime(_Symbol, 1440, 0);
   Gi_00001 = DayOfYear() * 86400;
   Gl_00001 = Gi_00001;
   Ll_FFFC8 = Gl_00000 - Gl_00001;
   Gi_00001 = 0;
   Gi_00002 = 0;
   if (OrdersTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00002, 0, 0) == true && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00004 = (NormalizeDouble((Bid - OrderOpenPrice()), _Digits) / _Point);
                  Gi_00001 = (int)(Gi_00001 + Gd_00004);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00005 = (NormalizeDouble((OrderOpenPrice() - Ask), _Digits) / _Point);
                  Gi_00001 = (int)(Gi_00001 + Gd_00005);
               }
            }
         }
         Gi_00002 = Gi_00002 + 1;
      } while (Gi_00002 <= OrdersTotal());
   }
   Gi_00005 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00005, 0, 1) == true) {
            Gl_00006 = OrderOpenTime();
            if (Gl_00006 > iTime(_Symbol, 1440, 0) && OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if (OrderType() == OP_BUY) {
                     Gd_00007 = OrderClosePrice();
                     Gd_00007 = (NormalizeDouble((Gd_00007 - OrderOpenPrice()), _Digits) / _Point);
                     Gi_00001 = (int)(Gi_00001 + Gd_00007);
                  }
                  if (OrderType() == OP_SELL) {
                     Gd_00008 = OrderOpenPrice();
                     Gd_00008 = (NormalizeDouble((Gd_00008 - OrderClosePrice()), _Digits) / _Point);
                     Gi_00001 = (int)(Gi_00001 + Gd_00008);
                  }
               }
            }
         }
         Gi_00005 = Gi_00005 + 1;
      } while (Gi_00005 <= HistoryTotal());
   }
   Gi_00008 = Gi_00001 / 10;
   returned_double = NormalizeDouble(Gi_00008, 2);
   Ld_FFFC0 = returned_double;
   Gd_00008 = Ld_FFFC0;
   if ((returned_double == 0)) {
      Gi_00009 = 16777215;
   }
   else {
      if ((Gd_00008 > 0)) {
         Gi_00009 = 3329330;
      }
      else {
         Gi_00009 = 255;
      }
   }
   tmp_str00000 = DoubleToString(Ld_FFFC0, 2);
   ObjectSetText(Is_0BF6C[1], tmp_str00000, 10, "Arial", Gi_00009);
   Gl_0000B = iTime(_Symbol, 1440, 0);
   Gl_0000C = Ll_FFFF8;
   Gi_0000D = 0;
   Gi_0000E = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0000E, 0, 1) == true && OrderCloseTime() > Gl_0000C && OrderCloseTime() < Gl_0000B && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00010 = OrderClosePrice();
                  Gd_00010 = (NormalizeDouble((Gd_00010 - OrderOpenPrice()), _Digits) / _Point);
                  Gi_0000D = (int)(Gi_0000D + Gd_00010);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00011 = OrderOpenPrice();
                  Gd_00011 = (NormalizeDouble((Gd_00011 - OrderClosePrice()), _Digits) / _Point);
                  Gi_0000D = (int)(Gi_0000D + Gd_00011);
               }
            }
         }
         Gi_0000E = Gi_0000E + 1;
      } while (Gi_0000E <= HistoryTotal());
   }
   Gi_00011 = Gi_0000D / 10;
   returned_double = NormalizeDouble(Gi_00011, 2);
   Ld_FFFB8 = returned_double;
   Gd_00011 = Ld_FFFB8;
   if ((returned_double == 0)) {
      Gi_00012 = 16777215;
   }
   else {
      if ((Gd_00011 > 0)) {
         Gi_00012 = 3329330;
      }
      else {
         Gi_00012 = 255;
      }
   }
   tmp_str00001 = DoubleToString(Ld_FFFB8, 2);
   ObjectSetText(Is_0BF6C[2], tmp_str00001, 10, "Arial", Gi_00012);
   Gl_00014 = Ll_FFFF8;
   Gl_00015 = Ll_FFFF0;
   Gi_00016 = 0;
   Gi_00017 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00017, 0, 1) == true && OrderCloseTime() > Gl_00015 && OrderCloseTime() < Gl_00014 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00019 = OrderClosePrice();
                  Gd_00019 = (NormalizeDouble((Gd_00019 - OrderOpenPrice()), _Digits) / _Point);
                  Gi_00016 = (int)(Gi_00016 + Gd_00019);
               }
               if (OrderType() == OP_SELL) {
                  Gd_0001A = OrderOpenPrice();
                  Gd_0001A = (NormalizeDouble((Gd_0001A - OrderClosePrice()), _Digits) / _Point);
                  Gi_00016 = (int)(Gi_00016 + Gd_0001A);
               }
            }
         }
         Gi_00017 = Gi_00017 + 1;
      } while (Gi_00017 <= HistoryTotal());
   }
   Gi_0001A = Gi_00016 / 10;
   returned_double = NormalizeDouble(Gi_0001A, 2);
   Ld_FFFB0 = returned_double;
   Gd_0001A = Ld_FFFB0;
   if ((returned_double == 0)) {
      Gi_0001B = 16777215;
   }
   else {
      if ((Gd_0001A > 0)) {
         Gi_0001B = 3329330;
      }
      else {
         Gi_0001B = 255;
      }
   }
   tmp_str00002 = DoubleToString(Ld_FFFB0, 2);
   ObjectSetText(Is_0BF6C[3], tmp_str00002, 10, "Arial", Gi_0001B);
   Gl_0001D = Ll_FFFF0;
   Gl_0001E = Ll_FFFE8;
   Gi_0001F = 0;
   Gi_00020 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00020, 0, 1) == true && OrderCloseTime() > Gl_0001E && OrderCloseTime() < Gl_0001D && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00022 = OrderClosePrice();
                  Gd_00022 = (NormalizeDouble((Gd_00022 - OrderOpenPrice()), _Digits) / _Point);
                  Gi_0001F = (int)(Gi_0001F + Gd_00022);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00023 = OrderOpenPrice();
                  Gd_00023 = (NormalizeDouble((Gd_00023 - OrderClosePrice()), _Digits) / _Point);
                  Gi_0001F = (int)(Gi_0001F + Gd_00023);
               }
            }
         }
         Gi_00020 = Gi_00020 + 1;
      } while (Gi_00020 <= HistoryTotal());
   }
   Gi_00023 = Gi_0001F / 10;
   returned_double = NormalizeDouble(Gi_00023, 2);
   Ld_FFFA8 = returned_double;
   Gd_00023 = Ld_FFFA8;
   if ((returned_double == 0)) {
      Gi_00024 = 16777215;
   }
   else {
      if ((Gd_00023 > 0)) {
         Gi_00024 = 3329330;
      }
      else {
         Gi_00024 = 255;
      }
   }
   tmp_str00003 = DoubleToString(Ld_FFFA8, 2);
   ObjectSetText(Is_0BF6C[4], tmp_str00003, 10, "Arial", Gi_00024);
   Gl_00026 = Ll_FFFE8;
   Gl_00027 = Ll_FFFE0;
   Gi_00028 = 0;
   Gi_00029 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00029, 0, 1) == true && OrderCloseTime() > Gl_00027 && OrderCloseTime() < Gl_00026 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_0002B = OrderClosePrice();
                  Gd_0002B = (NormalizeDouble((Gd_0002B - OrderOpenPrice()), _Digits) / _Point);
                  Gi_00028 = (int)(Gi_00028 + Gd_0002B);
               }
               if (OrderType() == OP_SELL) {
                  Gd_0002C = OrderOpenPrice();
                  Gd_0002C = (NormalizeDouble((Gd_0002C - OrderClosePrice()), _Digits) / _Point);
                  Gi_00028 = (int)(Gi_00028 + Gd_0002C);
               }
            }
         }
         Gi_00029 = Gi_00029 + 1;
      } while (Gi_00029 <= HistoryTotal());
   }
   Gi_0002C = Gi_00028 / 10;
   returned_double = NormalizeDouble(Gi_0002C, 2);
   Ld_FFFA0 = returned_double;
   Gd_0002C = Ld_FFFA0;
   if ((returned_double == 0)) {
      Gi_0002D = 16777215;
   }
   else {
      if ((Gd_0002C > 0)) {
         Gi_0002D = 3329330;
      }
      else {
         Gi_0002D = 255;
      }
   }
   tmp_str00004 = DoubleToString(Ld_FFFA0, 2);
   ObjectSetText(Is_0BF6C[5], tmp_str00004, 10, "Arial", Gi_0002D);
   Gl_0002F = TimeCurrent();
   Gl_00030 = Ll_FFFD8;
   Gi_00031 = 0;
   Gi_00032 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00032, 0, 1) == true && OrderCloseTime() > Gl_00030 && OrderCloseTime() < Gl_0002F && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00034 = OrderClosePrice();
                  Gd_00034 = (NormalizeDouble((Gd_00034 - OrderOpenPrice()), _Digits) / _Point);
                  Gi_00031 = (int)(Gi_00031 + Gd_00034);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00035 = OrderOpenPrice();
                  Gd_00035 = (NormalizeDouble((Gd_00035 - OrderClosePrice()), _Digits) / _Point);
                  Gi_00031 = (int)(Gi_00031 + Gd_00035);
               }
            }
         }
         Gi_00032 = Gi_00032 + 1;
      } while (Gi_00032 <= HistoryTotal());
   }
   Gi_00035 = Gi_00031 / 10;
   returned_double = NormalizeDouble(Gi_00035, 2);
   Ld_FFF98 = returned_double;
   Gd_00035 = Ld_FFF98;
   if ((returned_double == 0)) {
      Gi_00036 = 16777215;
   }
   else {
      if ((Gd_00035 > 0)) {
         Gi_00036 = 3329330;
      }
      else {
         Gi_00036 = 255;
      }
   }
   tmp_str00005 = DoubleToString(Ld_FFF98, 2);
   ObjectSetText(Is_0BF6C[6], tmp_str00005, 10, "Arial", Gi_00036);
   Gl_00038 = TimeCurrent();
   Gl_00039 = Ll_FFFD0;
   Gi_0003A = 0;
   Gi_0003B = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0003B, 0, 1) == true && OrderCloseTime() > Gl_00039 && OrderCloseTime() < Gl_00038 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_0003D = OrderClosePrice();
                  Gd_0003D = (NormalizeDouble((Gd_0003D - OrderOpenPrice()), _Digits) / _Point);
                  Gi_0003A = (int)(Gi_0003A + Gd_0003D);
               }
               if (OrderType() == OP_SELL) {
                  Gd_0003E = OrderOpenPrice();
                  Gd_0003E = (NormalizeDouble((Gd_0003E - OrderClosePrice()), _Digits) / _Point);
                  Gi_0003A = (int)(Gi_0003A + Gd_0003E);
               }
            }
         }
         Gi_0003B = Gi_0003B + 1;
      } while (Gi_0003B <= HistoryTotal());
   }
   Gi_0003E = Gi_0003A / 10;
   returned_double = NormalizeDouble(Gi_0003E, 2);
   Ld_FFF90 = returned_double;
   Gd_0003E = Ld_FFF90;
   if ((returned_double == 0)) {
      Gi_0003F = 16777215;
   }
   else {
      if ((Gd_0003E > 0)) {
         Gi_0003F = 3329330;
      }
      else {
         Gi_0003F = 255;
      }
   }
   tmp_str00006 = DoubleToString(Ld_FFF90, 2);
   ObjectSetText(Is_0BF6C[7], tmp_str00006, 10, "Arial", Gi_0003F);
   Gl_00041 = TimeCurrent();
   Gl_00042 = Ll_FFFC8;
   Gi_00043 = 0;
   Gi_00044 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00044, 0, 1) == true && OrderCloseTime() > Gl_00042 && OrderCloseTime() < Gl_00041 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00046 = OrderClosePrice();
                  Gd_00046 = (NormalizeDouble((Gd_00046 - OrderOpenPrice()), _Digits) / _Point);
                  Gi_00043 = (int)(Gi_00043 + Gd_00046);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00047 = OrderOpenPrice();
                  Gd_00047 = (NormalizeDouble((Gd_00047 - OrderClosePrice()), _Digits) / _Point);
                  Gi_00043 = (int)(Gi_00043 + Gd_00047);
               }
            }
         }
         Gi_00044 = Gi_00044 + 1;
      } while (Gi_00044 <= HistoryTotal());
   }
   Gi_00047 = Gi_00043 / 10;
   returned_double = NormalizeDouble(Gi_00047, 2);
   Ld_FFF88 = returned_double;
   Gd_00047 = Ld_FFF88;
   if ((returned_double == 0)) {
      Gi_00048 = 16777215;
   }
   else {
      if ((Gd_00047 > 0)) {
         Gi_00048 = 3329330;
      }
      else {
         Gi_00048 = 255;
      }
   }
   tmp_str00007 = DoubleToString(Ld_FFF88, 2);
   ObjectSetText(Is_0BF6C[8], tmp_str00007, 10, "Arial", Gi_00048);
   Gd_0004A = 0;
   Gi_0004B = 0;
   if (OrdersTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0004B, 0, 0) == true && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_0004C = OrderProfit();
                  Gd_0004C = (Gd_0004C + OrderCommission());
                  Gd_0004A = ((Gd_0004C + OrderSwap()) + Gd_0004A);
               }
               if (OrderType() == OP_SELL) {
                  Gd_0004C = OrderProfit();
                  Gd_0004C = (Gd_0004C + OrderCommission());
                  Gd_0004A = ((Gd_0004C + OrderSwap()) + Gd_0004A);
               }
            }
         }
         Gi_0004B = Gi_0004B + 1;
      } while (Gi_0004B <= OrdersTotal());
   }
   Gi_0004C = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0004C, 0, 1) == true) {
            Gl_0004D = OrderOpenTime();
            if (Gl_0004D > iTime(_Symbol, 1440, 0) && OrderSymbol() == _Symbol) {
               if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

                  if (OrderType() == OP_BUY) {
                     Gd_0004D = OrderProfit();
                     Gd_0004D = (Gd_0004D + OrderCommission());
                     Gd_0004A = ((Gd_0004D + OrderSwap()) + Gd_0004A);
                  }
                  if (OrderType() == OP_SELL) {
                     Gd_0004D = OrderProfit();
                     Gd_0004D = (Gd_0004D + OrderCommission());
                     Gd_0004A = ((Gd_0004D + OrderSwap()) + Gd_0004A);
                  }
               }
            }
         }
         Gi_0004C = Gi_0004C + 1;
      } while (Gi_0004C <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_0004A, 2);
   Ld_FFF80 = returned_double;
   Gd_0004D = Ld_FFF80;
   if ((returned_double == 0)) {
      Gi_0004E = 16777215;
   }
   else {
      if ((Gd_0004D > 0)) {
         Gi_0004E = 3329330;
      }
      else {
         Gi_0004E = 255;
      }
   }
   tmp_str00008 = DoubleToString(Ld_FFF80, 2);
   ObjectSetText(Is_0C00C[1], tmp_str00008, 10, "Arial", Gi_0004E);
   Gl_00050 = iTime(_Symbol, 1440, 0);
   Gl_00051 = Ll_FFFF8;
   Gd_00052 = 0;
   Gi_00053 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00053, 0, 1) == true && OrderCloseTime() > Gl_00051 && OrderCloseTime() < Gl_00050 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00054 = OrderProfit();
                  Gd_00054 = (Gd_00054 + OrderCommission());
                  Gd_00052 = ((Gd_00054 + OrderSwap()) + Gd_00052);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00054 = OrderProfit();
                  Gd_00054 = (Gd_00054 + OrderCommission());
                  Gd_00052 = ((Gd_00054 + OrderSwap()) + Gd_00052);
               }
            }
         }
         Gi_00053 = Gi_00053 + 1;
      } while (Gi_00053 <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_00052, 2);
   Ld_FFF78 = returned_double;
   Gd_00054 = Ld_FFF78;
   if ((returned_double == 0)) {
      Gi_00055 = 16777215;
   }
   else {
      if ((Gd_00054 > 0)) {
         Gi_00055 = 3329330;
      }
      else {
         Gi_00055 = 255;
      }
   }
   tmp_str00009 = DoubleToString(Ld_FFF78, 2);
   ObjectSetText(Is_0C00C[2], tmp_str00009, 10, "Arial", Gi_00055);
   Gl_00057 = Ll_FFFF8;
   Gl_00058 = Ll_FFFF0;
   Gd_00059 = 0;
   Gi_0005A = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0005A, 0, 1) == true && OrderCloseTime() > Gl_00058 && OrderCloseTime() < Gl_00057 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_0005B = OrderProfit();
                  Gd_0005B = (Gd_0005B + OrderCommission());
                  Gd_00059 = ((Gd_0005B + OrderSwap()) + Gd_00059);
               }
               if (OrderType() == OP_SELL) {
                  Gd_0005B = OrderProfit();
                  Gd_0005B = (Gd_0005B + OrderCommission());
                  Gd_00059 = ((Gd_0005B + OrderSwap()) + Gd_00059);
               }
            }
         }
         Gi_0005A = Gi_0005A + 1;
      } while (Gi_0005A <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_00059, 2);
   Ld_FFF70 = returned_double;
   Gd_0005B = Ld_FFF70;
   if ((returned_double == 0)) {
      Gi_0005C = 16777215;
   }
   else {
      if ((Gd_0005B > 0)) {
         Gi_0005C = 3329330;
      }
      else {
         Gi_0005C = 255;
      }
   }
   tmp_str0000A = DoubleToString(Ld_FFF70, 2);
   ObjectSetText(Is_0C00C[3], tmp_str0000A, 10, "Arial", Gi_0005C);
   Gl_0005E = Ll_FFFF0;
   Gl_0005F = Ll_FFFE8;
   Gd_00060 = 0;
   Gi_00061 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00061, 0, 1) == true && OrderCloseTime() > Gl_0005F && OrderCloseTime() < Gl_0005E && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00062 = OrderProfit();
                  Gd_00062 = (Gd_00062 + OrderCommission());
                  Gd_00060 = ((Gd_00062 + OrderSwap()) + Gd_00060);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00062 = OrderProfit();
                  Gd_00062 = (Gd_00062 + OrderCommission());
                  Gd_00060 = ((Gd_00062 + OrderSwap()) + Gd_00060);
               }
            }
         }
         Gi_00061 = Gi_00061 + 1;
      } while (Gi_00061 <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_00060, 2);
   Ld_FFF68 = returned_double;
   Gd_00062 = Ld_FFF68;
   if ((returned_double == 0)) {
      Gi_00063 = 16777215;
   }
   else {
      if ((Gd_00062 > 0)) {
         Gi_00063 = 3329330;
      }
      else {
         Gi_00063 = 255;
      }
   }
   tmp_str0000B = DoubleToString(Ld_FFF68, 2);
   ObjectSetText(Is_0C00C[4], tmp_str0000B, 10, "Arial", Gi_00063);
   Gl_00065 = Ll_FFFE8;
   Gl_00066 = Ll_FFFE0;
   Gd_00067 = 0;
   Gi_00068 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00068, 0, 1) == true && OrderCloseTime() > Gl_00066 && OrderCloseTime() < Gl_00065 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00069 = OrderProfit();
                  Gd_00069 = (Gd_00069 + OrderCommission());
                  Gd_00067 = ((Gd_00069 + OrderSwap()) + Gd_00067);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00069 = OrderProfit();
                  Gd_00069 = (Gd_00069 + OrderCommission());
                  Gd_00067 = ((Gd_00069 + OrderSwap()) + Gd_00067);
               }
            }
         }
         Gi_00068 = Gi_00068 + 1;
      } while (Gi_00068 <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_00067, 2);
   Ld_FFF60 = returned_double;
   Gd_00069 = Ld_FFF60;
   if ((returned_double == 0)) {
      Gi_0006A = 16777215;
   }
   else {
      if ((Gd_00069 > 0)) {
         Gi_0006A = 3329330;
      }
      else {
         Gi_0006A = 255;
      }
   }
   tmp_str0000C = DoubleToString(Ld_FFF60, 2);
   ObjectSetText(Is_0C00C[5], tmp_str0000C, 10, "Arial", Gi_0006A);
   Gl_0006C = TimeCurrent();
   Gl_0006D = Ll_FFFD8;
   Gd_0006E = 0;
   Gi_0006F = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0006F, 0, 1) == true && OrderCloseTime() > Gl_0006D && OrderCloseTime() < Gl_0006C && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00070 = OrderProfit();
                  Gd_00070 = (Gd_00070 + OrderCommission());
                  Gd_0006E = ((Gd_00070 + OrderSwap()) + Gd_0006E);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00070 = OrderProfit();
                  Gd_00070 = (Gd_00070 + OrderCommission());
                  Gd_0006E = ((Gd_00070 + OrderSwap()) + Gd_0006E);
               }
            }
         }
         Gi_0006F = Gi_0006F + 1;
      } while (Gi_0006F <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_0006E, 2);
   Ld_FFF58 = returned_double;
   Gd_00070 = Ld_FFF58;
   if ((returned_double == 0)) {
      Gi_00071 = 16777215;
   }
   else {
      if ((Gd_00070 > 0)) {
         Gi_00071 = 3329330;
      }
      else {
         Gi_00071 = 255;
      }
   }
   tmp_str0000D = DoubleToString(Ld_FFF58, 2);
   ObjectSetText(Is_0C00C[6], tmp_str0000D, 10, "Arial", Gi_00071);
   Gl_00073 = TimeCurrent();
   Gl_00074 = Ll_FFFD0;
   Gd_00075 = 0;
   Gi_00076 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00076, 0, 1) == true && OrderCloseTime() > Gl_00074 && OrderCloseTime() < Gl_00073 && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_00077 = OrderProfit();
                  Gd_00077 = (Gd_00077 + OrderCommission());
                  Gd_00075 = ((Gd_00077 + OrderSwap()) + Gd_00075);
               }
               if (OrderType() == OP_SELL) {
                  Gd_00077 = OrderProfit();
                  Gd_00077 = (Gd_00077 + OrderCommission());
                  Gd_00075 = ((Gd_00077 + OrderSwap()) + Gd_00075);
               }
            }
         }
         Gi_00076 = Gi_00076 + 1;
      } while (Gi_00076 <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_00075, 2);
   Ld_FFF50 = returned_double;
   Gd_00077 = Ld_FFF50;
   if ((returned_double == 0)) {
      Gi_00078 = 16777215;
   }
   else {
      if ((Gd_00077 > 0)) {
         Gi_00078 = 3329330;
      }
      else {
         Gi_00078 = 255;
      }
   }
   tmp_str0000E = DoubleToString(Ld_FFF50, 2);
   ObjectSetText(Is_0C00C[7], tmp_str0000E, 10, "Arial", Gi_00078);
   Gl_0007A = TimeCurrent();
   Gl_0007B = Ll_FFFC8;
   Gd_0007C = 0;
   Gi_0007D = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_0007D, 0, 1) == true && OrderCloseTime() > Gl_0007B && OrderCloseTime() < Gl_0007A && OrderSymbol() == _Symbol) {
            if (OrderMagicNumber() == InpMagic || OrderMagicNumber() == InpMagic2) {

               if (OrderType() == OP_BUY) {
                  Gd_0007E = OrderProfit();
                  Gd_0007E = (Gd_0007E + OrderCommission());
                  Gd_0007C = ((Gd_0007E + OrderSwap()) + Gd_0007C);
               }
               if (OrderType() == OP_SELL) {
                  Gd_0007E = OrderProfit();
                  Gd_0007E = (Gd_0007E + OrderCommission());
                  Gd_0007C = ((Gd_0007E + OrderSwap()) + Gd_0007C);
               }
            }
         }
         Gi_0007D = Gi_0007D + 1;
      } while (Gi_0007D <= HistoryTotal());
   }
   returned_double = NormalizeDouble(Gd_0007C, 2);
   Ld_FFF48 = returned_double;
   Gd_0007E = Ld_FFF48;
   if ((returned_double == 0)) {
      Gi_0007F = 16777215;
   }
   else {
      if ((Gd_0007E > 0)) {
         Gi_0007F = 3329330;
      }
      else {
         Gi_0007F = 255;
      }
   }
   tmp_str0000F = DoubleToString(Ld_FFF48, 2);
   ObjectSetText(Is_0C00C[8], tmp_str0000F, 10, "Arial", Gi_0007F);
   returned_double = NormalizeDouble(((Ld_FFF80 / AccountBalance()) * 100), 2);
   Ld_FFF40 = returned_double;
   Gd_00081 = Ld_FFF40;
   if ((returned_double == 0)) {
      Gi_00082 = 16777215;
   }
   else {
      if ((Gd_00081 > 0)) {
         Gi_00082 = 3329330;
      }
      else {
         Gi_00082 = 255;
      }
   }
   tmp_str00010 = DoubleToString(Ld_FFF40, 2);
   ObjectSetText(Is_0C0AC[1], tmp_str00010, 10, "Arial", Gi_00082);
   returned_double = NormalizeDouble(((Ld_FFF78 / AccountBalance()) * 100), 2);
   Ld_FFF38 = returned_double;
   Gd_00084 = Ld_FFF38;
   if ((returned_double == 0)) {
      Gi_00085 = 16777215;
   }
   else {
      if ((Gd_00084 > 0)) {
         Gi_00085 = 3329330;
      }
      else {
         Gi_00085 = 255;
      }
   }
   tmp_str00011 = DoubleToString(Ld_FFF38, 2);
   ObjectSetText(Is_0C0AC[2], tmp_str00011, 10, "Arial", Gi_00085);
   returned_double = NormalizeDouble(((Ld_FFF70 / AccountBalance()) * 100), 2);
   Ld_FFF30 = returned_double;
   Gd_00087 = Ld_FFF30;
   if ((returned_double == 0)) {
      Gi_00088 = 16777215;
   }
   else {
      if ((Gd_00087 > 0)) {
         Gi_00088 = 3329330;
      }
      else {
         Gi_00088 = 255;
      }
   }
   tmp_str00012 = DoubleToString(Ld_FFF30, 2);
   ObjectSetText(Is_0C0AC[3], tmp_str00012, 10, "Arial", Gi_00088);
   returned_double = NormalizeDouble(((Ld_FFF68 / AccountBalance()) * 100), 2);
   Ld_FFF28 = returned_double;
   Gd_0008A = Ld_FFF28;
   if ((returned_double == 0)) {
      Gi_0008B = 16777215;
   }
   else {
      if ((Gd_0008A > 0)) {
         Gi_0008B = 3329330;
      }
      else {
         Gi_0008B = 255;
      }
   }
   tmp_str00013 = DoubleToString(Ld_FFF28, 2);
   ObjectSetText(Is_0C0AC[4], tmp_str00013, 10, "Arial", Gi_0008B);
   returned_double = NormalizeDouble(((Ld_FFF60 / AccountBalance()) * 100), 2);
   Ld_FFF20 = returned_double;
   Gd_0008D = Ld_FFF20;
   if ((returned_double == 0)) {
      Gi_0008E = 16777215;
   }
   else {
      if ((Gd_0008D > 0)) {
         Gi_0008E = 3329330;
      }
      else {
         Gi_0008E = 255;
      }
   }
   tmp_str00014 = DoubleToString(Ld_FFF20, 2);
   ObjectSetText(Is_0C0AC[5], tmp_str00014, 10, "Arial", Gi_0008E);
   returned_double = NormalizeDouble(((Ld_FFF58 / AccountBalance()) * 100), 2);
   Ld_FFF18 = returned_double;
   Gd_00090 = Ld_FFF18;
   if ((returned_double == 0)) {
      Gi_00091 = 16777215;
   }
   else {
      if ((Gd_00090 > 0)) {
         Gi_00091 = 3329330;
      }
      else {
         Gi_00091 = 255;
      }
   }
   tmp_str00015 = DoubleToString(Ld_FFF18, 2);
   ObjectSetText(Is_0C0AC[6], tmp_str00015, 10, "Arial", Gi_00091);
   returned_double = NormalizeDouble(((Ld_FFF50 / AccountBalance()) * 100), 2);
   Ld_FFF10 = returned_double;
   Gd_00093 = Ld_FFF10;
   if ((returned_double == 0)) {
      Gi_00094 = 16777215;
   }
   else {
      if ((Gd_00093 > 0)) {
         Gi_00094 = 3329330;
      }
      else {
         Gi_00094 = 255;
      }
   }
   tmp_str00016 = DoubleToString(Ld_FFF10, 2);
   ObjectSetText(Is_0C0AC[7], tmp_str00016, 10, "Arial", Gi_00094);
   Gl_00096 = TimeCurrent();
   Gl_00097 = Ll_FFFD0;
   Gd_00098 = 0;
   Gi_00099 = 0;
   if (HistoryTotal() >= 0) {
      do {
         if (OrderSelect(Gi_00099, 0, 1) == true && OrderCloseTime() > Gl_00097 && OrderCloseTime() < Gl_00096) {
            if (OrderType() == OP_BUY) {
               Gd_0009A = OrderProfit();
               Gd_0009A = (Gd_0009A + OrderCommission());
               Gd_00098 = ((Gd_0009A + OrderSwap()) + Gd_00098);
            }
            if (OrderType() == OP_SELL) {
               Gd_0009A = OrderProfit();
               Gd_0009A = (Gd_0009A + OrderCommission());
               Gd_00098 = ((Gd_0009A + OrderSwap()) + Gd_00098);
            }
         }
         Gi_00099 = Gi_00099 + 1;
      } while (Gi_00099 <= HistoryTotal());
   }
   Ld_FFF08 = NormalizeDouble(Gd_00098, 2);
   returned_double = NormalizeDouble(((Ld_FFF08 / AccountBalance()) * 100), 2);
   Ld_FFF00 = returned_double;
   tmp_str00017 = DoubleToString(returned_double, 2);
   tmp_str00017 = tmp_str00017 + " %";
   ObjectSetText("Monthly_P", tmp_str00017, 13, "Arial", 16777215);
   if ((Ld_FFF10 == 0)) {
      ObjectSetInteger(0, "Monthly_P", 1025, 8421504);
   }
   else {
      if ((Ld_FFF10 > 0)) {
         ObjectSetInteger(0, "Monthly_P", 1025, 3329330);
      }
      else {
         ObjectSetInteger(0, "Monthly_P", 1025, 255);
      }
   }
   returned_double = NormalizeDouble(((Ld_FFF48 / AccountBalance()) * 100), 2);
   Ld_FFEF8 = returned_double;
   Gd_0009A = Ld_FFEF8;
   if ((returned_double == 0)) {
      Gi_0009B = 16777215;
   }
   else {
      if ((Gd_0009A > 0)) {
         Gi_0009B = 3329330;
      }
      else {
         Gi_0009B = 255;
      }
   }
   tmp_str00018 = DoubleToString(Ld_FFEF8, 2);
   ObjectSetText(Is_0C0AC[8], tmp_str00018, 10, "Arial", Gi_0009B);
}

void func_1153()
{
   string tmp_str00000;
   string tmp_str00001;
   string tmp_str00002;
   string tmp_str00003;
   string tmp_str00004;
   double Ld_FFFF8;
   double Ld_FFFF0;
   double Ld_FFFE8;

   tmp_str00000 = "Daily_DD" + _Symbol;
   tmp_str00000 = tmp_str00000 + "";
   tmp_str00001 = (string)InpMagic;
   tmp_str00000 = tmp_str00000 + tmp_str00001;
   tmp_str00000 = tmp_str00000 + "";
   tmp_str00001 = (string)InpMagic2;
   tmp_str00000 = tmp_str00000 + tmp_str00001;
   Ld_FFFF8 = GlobalVariableGet(tmp_str00000);
   tmp_str00001 = "Monthly_DD" + _Symbol;
   tmp_str00001 = tmp_str00001 + "";
   tmp_str00002 = (string)InpMagic;
   tmp_str00001 = tmp_str00001 + tmp_str00002;
   tmp_str00001 = tmp_str00001 + "";
   tmp_str00002 = (string)InpMagic2;
   tmp_str00001 = tmp_str00001 + tmp_str00002;
   Ld_FFFF0 = GlobalVariableGet(tmp_str00001);
   Gd_00000 = AccountEquity();
   Gd_00000 = (Gd_00000 - AccountBalance());
   Ld_FFFE8 = NormalizeDouble(((Gd_00000 / AccountBalance()) * 100), 2);
   tmp_str00002 = DoubleToString(Ld_FFFF8, 2);
   tmp_str00002 = tmp_str00002 + " %";
   ObjectSetText("Daily_DD", tmp_str00002, 13, "Arial", 16777215);
   tmp_str00003 = DoubleToString(Ld_FFFF0, 2);
   tmp_str00003 = tmp_str00003 + " %";
   ObjectSetText("Monthly_DD", tmp_str00003, 13, "Arial", 16777215);
   tmp_str00004 = DoubleToString(Ld_FFFE8, 2);
   tmp_str00004 = tmp_str00004 + " %";
   ObjectSetText("Open_DD", tmp_str00004, 13, "Arial", 16777215);
   if ((Ld_FFFF8 == 0)) {
      ObjectSetInteger(0, "Daily_DD", 1025, 8421504);
   }
   else {
      if ((Ld_FFFF8 > 0)) {
         ObjectSetInteger(0, "Daily_DD", 1025, 3329330);
      }
      else {
         ObjectSetInteger(0, "Daily_DD", 1025, 255);
      }
   }
   if ((Ld_FFFF0 == 0)) {
      ObjectSetInteger(0, "Monthly_DD", 1025, 8421504);
   }
   else {
      if ((Ld_FFFF0 > 0)) {
         ObjectSetInteger(0, "Monthly_DD", 1025, 3329330);
      }
      else {
         ObjectSetInteger(0, "Monthly_DD", 1025, 255);
      }
   }
   if ((Ld_FFFE8 == 0)) {
      ObjectSetInteger(0, "Open_DD", 1025, 8421504);
      return;
   }
   if ((Ld_FFFE8 > 0)) {
      ObjectSetInteger(0, "Open_DD", 1025, 3329330);
      return;
   }
   ObjectSetInteger(0, "Open_DD", 1025, 255);

}

bool func_1154(int Fa_i_00, int Fa_i_01)
{
   long Ll_FFFF0;
   string Ls_FFFE0;
   int Li_FFFDC;
   int Li_FFFD8;
   int Li_FFFD4;
   int Li_FFFD0;
   int Li_FFFCC;
   int Li_FFFC8;
   int Li_FFFC4;
   int Li_FFFC0;
   int Li_FFFBC;
   bool Lb_FFFBB;
   bool Lb_FFFBA;
   bool Lb_FFFB9;
   long Ll_FFFB0;
   bool Lb_FFFFF;

   Ll_FFFF0 = 0;
   Ls_FFFE0 = "RectLabel_2";
   Li_FFFDC = 0;
   Li_FFFD8 = 400;
   Li_FFFD4 = 210;
   Li_FFFD0 = 0;
   Li_FFFCC = 2;
   Li_FFFC8 = 0;
   Li_FFFC4 = 0;
   Li_FFFC0 = 0;
   Li_FFFBC = 1;
   Lb_FFFBB = true;
   Lb_FFFBA = false;
   Lb_FFFB9 = true;
   Ll_FFFB0 = 0;
   ObjectDelete(0, Ls_FFFE0);
   if (ObjectCreate(0, Ls_FFFE0, OBJ_RECTANGLE_LABEL, 0, 0, 0) != true) {
      Print("RectLabelCreate", ": failed to create a rectangle label! Error code = ", GetLastError());
      Lb_FFFFF = false;
      return Lb_FFFFF;
   }
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 102, Fa_i_00);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 103, Fa_i_01);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 1019, Li_FFFD8);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 1020, Li_FFFD4);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 1025, 0);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 1029, Li_FFFCC);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 101, Li_FFFC8);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 6, Li_FFFC4);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 7, Li_FFFC0);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 8, Li_FFFBC);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 9, Lb_FFFBB);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 1000, Lb_FFFBA);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 17, Lb_FFFBA);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 208, Lb_FFFB9);
   ObjectSetInteger(Ll_FFFF0, Ls_FFFE0, 207, Ll_FFFB0);
   Lb_FFFFF = true;

   return Lb_FFFFF;
}


