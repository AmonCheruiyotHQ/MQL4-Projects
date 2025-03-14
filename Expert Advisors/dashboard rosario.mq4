#property version "1.00"
#property strict


string Name=MQLInfoString(0)+"_";


// input color ccek = clrLightGreen;


input string sep1="---------- Panel Position Setting ----------";//-
extern int x_coordinate = 10;//Position X
extern int y_coordinate = 30;//Position Y

input int font_right_size=16;//Font Size Right Lable
input color font_right_color=clrYellowGreen;//Font Color Right Lable

//extern int mn = 1;
input string sep2="---------- Magic Number Setting ----------";//-
extern int mn_sell = 11;//Magic Sell
extern int mn_buy = 22;//Magic Buy
extern int mn_pira = 33;//Magic Piramidation
extern int mn_pend = 44;//Magic Pending
extern int mn_multi = 55;//Magic Multi
extern int mn_ea = 66;//Magic EA

input string sep3="---------- Trade Setting ----------";//-
extern double la = 0.01;//Lots
input bool state_sl_trade = false;// State SL Trade
extern int pn_stoploss = 500;//Stop Loss
input bool state_tp_trade = false;// State TP Trade
extern int pn_takeprofit = 500;//Take Profit
input bool state_trailing_trade = false;// State Trailing Trade
extern int pn_trailing = 100;//Trailing Point
extern int trail_step = 1;//Trailing Step

input string sep4="---------- Piramidation Setting ----------";//-
input bool state_piramid = false;// State Piramidation
extern int dist_piramidation = 300;//Piramidation Distance
extern int num_piramidation = 3;//Piramidation Number
input int sensitivity = 1;//Sensitivity
input bool state_sl_piramid = false;// State SL Piramid
extern int sl_piramidx = 400;//Stop Loss
input bool state_tp_piramid = false;// State TP Piramid
extern int tp_piramidx = 400;//Take Profit
input bool state_trailing_piramid = false;// State Trailing Piramid
extern int trail_piramidx = 110;//Trailing Point
extern int step_piramidx = 2;//Trailing Step

input string sep4a="---------- Contrarian Setting ----------";//-
input bool state_pending = false;// State Contrarian
extern int manual_distance = 200;//Manual Distance
extern int trailsteps_pending = 10;
input bool state_sl_pending = false;// State SL Pending
extern int sl_pendingx = 300;//Stop Loss
input bool state_tp_pending = false;// State TP Pending
extern int tp_pendingx = 300;//Take Profit
input bool state_trailing_pending = false;// State Trailing Pending
extern int trail_pendingx = 120;//Trailing Point
extern int step_pendingx = 3;//Trailing Step
input bool state_trailing_pending_pending = false;// State Trailing Pending for pending
extern int trail_pendingx_pending = 120;//Trailing Point for pending
extern int step_pendingx_pending = 3;//Trailing Step for pending

input string sep4a1="---------- zigzag for Contrarian----------";//-
input string IndicatorFileName = "ZigZag-Pips-Bars-Number-Indicator";//Indicator Name

input ENUM_TIMEFRAMES ZigZag_TimeFrame_contrarian = PERIOD_H1;//Zigzag Timeframe
input int ZigZag_depth_contrarian = 12;//Zigzag Depth
input int ZigZag_deviation_contrarian = 5;//Zigzag Deviation
input int ZigZag_backstep_contrarian = 3;//Zigzag Backstep
input int barsToScan_contrarian = 100;//Bar To Scan
input int zzValuesFilterPoints_contrarian = 1000;//Value Filter Point, use only zig < x, x=
input double multiplierAverageZZPoint_contrarian = 0.5;//Multiplier

input string sep4b="---------- Multi Pending Setting ----------";//-
input bool state_multi = false;// State Multi Pending
extern int max_hedging = 2;//Max Hedging
input int multi_distance_price=200;//Distance Price
extern int distance_hedging = 100;//Distance Hedging
input bool state_sl_multi = false;// State SL Multi
extern int sl_multix = 200;//Stop Loss
input bool state_tp_multi = false;// State TP Multi
extern int tp_multix = 200;//Take Profit
input bool state_trailing_multi = false;// State Trailing Multi
extern int trail_multix = 130;//Trailing Point
extern int step_multix = 4;//Trailing Step
input bool state_trailing_multi_pending = false;// State Trailing Multi for pending
extern int trail_multix_pending = 130;//Trailing Point for pending
extern int step_multix_pending = 4;//Trailing Step for pending

input string sep4c="---------- zigzag for Multi Pending----------";//-
input ENUM_TIMEFRAMES ZigZag_TimeFrame_multi = PERIOD_H1;//Zigzag Timeframe
input int ZigZag_depth_multi = 12;//Zigzag Depth
input int ZigZag_deviation_multi = 5;//Zigzag Deviation
input int ZigZag_backstep_multi = 3;//Zigzag Backstep
input int barsToScan_multi = 100;//Bar To Scan
input int zzValuesFilterPoints_multi = 1000;//Value Filter Point, use only zig < x, x=
input double multiplierAverageZZPoint_multi = 0.5;//Multiplier

input string sep5="---------- Automation / EA----------";//-
input bool state_EA = false;// State EA
input int distance_price_ea=200;//Distance Price
input int max_hedging_ea=2;//Max Hedging

enum distance_grid_ea{
  _auto = 0,//Auto
  _manual = 1//Manual
};
input distance_grid_ea distance_grid_eaX=1;//Hedging Grid Range

input int distance_grid_manual_ea=100;//Grid Range Manual

input int sl_ea = 200;//Stop Loss
input int tp_ea = 200;//Take Profit

input int trail_trade_ea=300;//Trailing Active Trade
input int trail_step_trade_ea=5;//Trailing Step Active Trade

input int trail_pending_ea=300;//Trailing Pending Trade
input int trail_step_pending_ea=5;//Trailing Step Pending Trade

input string sep5a="---------- zigzag for EA----------";//-
input ENUM_TIMEFRAMES ZigZag_TimeFrame_ea = PERIOD_H1;//Zigzag Timeframe
input int ZigZag_depth_ea = 12;//Zigzag Depth
input int ZigZag_deviation_ea = 5;//Zigzag Deviation
input int ZigZag_backstep_ea = 3;//Zigzag Backstep
input int barsToScan_ea = 100;//Bar To Scan
input int zzValuesFilterPoints_ea = 1000;//Value Filter Point, use only zig < x, x=
input double multiplierAverageZZPoint_ea = 0.5;//Multiplier

input string sep6="---------- Time Setting ----------";//-
input bool state_time1=false;//Use Time1
input string start_time1="08:00";//Start Time1
input string end_time1="10:00";//End Time1

input bool state_time2=false;//Use Time2
input string start_time2="12:00";//Start Time2
input string end_time2="14:00";//End Time2

input bool state_time3=false;//Use Time3
input string start_time3="17:00";//Start Time3
input string end_time3="23:00";//End Time3

input string sep7="---------- Trade Setting ----------";//-
input int max_trade_day=0;//Max Trade For A Day (0=ignored)
input double max_loss_in_number_day=0;//Max Loss For A Day (0=ignored)
input int max_loss_value_day=0;//Max Loss (value) For A Day (0=ignored)

int zigzag_bufferIndex = 0;
int swing_bufferIndex = 1;

int updateFirstradesCount;

int firstTradesInts[][2]; // containing orderticket number and optype
                          // information
double firstTradesOpenPrice[]; // containing price information
double firstTradesLots[];

// had second dimenstion standing for num_piramidation limited to 30; hence
// limited to 30 piramid levels
double piramidPriceLevelsBuy[][30];
double piramidPriceLevelsSell[][30];
string commentsLevelsBuy[][30][5];
string commentsLevelsSell[][30][5];

// auto and manual pending
double autopendingLevels[][1];
double manualpendingLevels[][1];
int pendingTradeType[][1];
string pendingComments[][1];

int pendingTicketsActive[][3];

////indicator settings
// string   IndicatorFileName    =  "ZigZag-Pips-Bars-Number-Indicator";
// int
// int   Indicator_depth         =  12;
// int   Indicator_deviation     =  5;
// int   Indicator_backstep      =  3;
//


double point = MarketInfo(Symbol(), MODE_POINT);

double swingDepth_Array[];

int depth = 20;
int widthd = 80;
int row1 = 80;
int col1 = 1400;
int row2 = row1 + depth;

int row[22] = {};
int col[5] = {};

int handle1_new_x;
int handle1_new_y;
int xchange1;
int ychange1;

double sellstop;
double buystop;
int distpira_pts;
int numpira_pts;

// --------------------------
int note_inc_trade;
bool __time_is_ok;

bool reached_max_trade_day;
bool reached_loss_trade_day;
bool reached_value_trade_day;

// double zigzag(int shift) {
//   double zigzagVal;
//   zigzagVal =
//       iCustom(Symbol(), ZigZag_TimeFrame, IndicatorFileName, ZigZag_depth,
//               ZigZag_deviation, ZigZag_backstep, zigzag_bufferIndex, shift);
//   return (zigzagVal);
// }

// double swingDepth(int shift) {
//   double swingDepthVal;
//   swingDepthVal =
//       iCustom(Symbol(), ZigZag_TimeFrame, IndicatorFileName, ZigZag_depth,
//               ZigZag_deviation, ZigZag_backstep, swing_bufferIndex, shift);
//   return (swingDepthVal);
// }

void handle1(string name, int x, int y) {
  DrawLABEL(name, name, x, y, "Wingdings", 12, clrWhite, ANCHOR_LEFT_UPPER);
  ObjectSetInteger(0, name, OBJPROP_SELECTABLE, true);
  ObjectSetInteger(0, name, OBJPROP_SELECTED, true);
  handle1_new_x = (int)ObjectGetInteger(0, name, OBJPROP_XDISTANCE);
  handle1_new_y = (int)ObjectGetInteger(0, name, OBJPROP_YDISTANCE);
  xchange1 = handle1_new_x - x;
  ychange1 = handle1_new_y - y;

  // ChartRedraw();
}

// void move_by_handle1(string objectname, // Object name
//                      int x,             // x coordinate
//                      int y)             // y coordinate
// {
//   if (ObjectFind(0, objectname) == 0) {
//     LabelMove(0, objectname, x + xchange1, y + ychange1);
//   }
// }


int OnInit() {
  
  
  ChartSetInteger(0,CHART_FOREGROUND,false);
  
  int AN = AccountNumber();
  string FIO = AccountName();
  // EventSetTimer(1);

  row[0] = y_coordinate;
  int baris = 21;
  for (int i = 1; i < baris; i++) {
    row[i] = row[i - 1] + depth;    
  }

  col[0] = x_coordinate;
  for (int i = 1; i < 5; i++) {
    col[i] = col[i - 1] + widthd;
  }

  ButtonCreate(0, Name+"btn_sell", 0, col[0], row[0], 80, 20, "Sell", "Century", 10,clrBlack, clrMoccasin, clrMoccasin, clrNONE);
  EditCreate(0, Name+"rc lot", 0, col[1], row[0], 160, 20, DoubleToString(la, 2),"Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, 0, clrWhite,clrWhite);
  ButtonCreate(0, Name+"btn_buy", 0, col[3], row[0], 80, 20, "Buy", "Century", 10,clrBlack, clrMoccasin, clrMoccasin, clrNONE);

  // DrawLABEL("rc
  // plevsell",Bid,320,110,"Century",10,clrWhite,ANCHOR_LEFT_UPPER);
  EditCreate(0, Name+"rc sell_pl", 0, col[0], row[1], 80, 20,DoubleToString(Bid, Digits), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrWhite, clrWhite);
  EditCreate(0, Name+"rc buy_pl", 0, col[3], row[1], 80, 20,DoubleToString(Ask, Digits), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrWhite, clrWhite);

  ButtonCreate(0, Name+"btn_sellstop", 0, col[0], row[2], 80, 20, "Sell Stop","Century", 10, clrBlack, clrMoccasin, clrMoccasin, clrNONE);
  EditCreate(0, Name+"rc sellstop_pl", 0, col[1], row[2], 80, 20,DoubleToString(Bid, Digits), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrWhite, clrWhite);
  EditCreate(0, Name+"rc buystop_pl", 0, col[2], row[2], 80, 20,DoubleToString(Ask, Digits), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrWhite, clrWhite);
  ButtonCreate(0, Name+"btn_buystop", 0, col[3], row[2], 80, 20, "Buy Stop","Century", 10, clrBlack, clrMoccasin, clrMoccasin, clrNONE);

  int kasih_jarak = 2;
  for(int i=3;i<baris;i++){
    row[i] += kasih_jarak;
  }
  
  string data1, data2, data3;

  data1 = Name+"sl_trade";  
  data2 = Name+"sl_trade_edit";  
  data3 = "";
  ButtonCreate(0, data1, 0, col[0], row[3], 30, 20, "SL","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]-50, row[3], 50, 20,string(pn_stoploss), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_sl_trade);
  onoff_property(data1, data2, data3);
  button_sl_market(state_sl_trade);

  data1 = Name+"tp_trade";  
  data2 = Name+"tp_trade_edit";  
  data3 = "";
  ButtonCreate(0, data1, 0, col[0]+50+30, row[3], 30, 20, "TP","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);  
  EditCreate(0, data2, 0, col[1]+30, row[3], 50, 20,string(pn_takeprofit), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_tp_trade);
  onoff_property(data1, data2, data3);
  button_tp_market(state_tp_trade);
  
  data1 = Name+"trail_trade";  
  data2 = Name+"trail_trade_edit";  
  data3 = Name+"trail_step_trade_edit";
  ButtonCreate(0, data1, 0, col[2], row[3], 50, 20, "Trail","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);  
  EditCreate(0, data2, 0, col[3]-30, row[3], 60, 20,string(pn_trailing), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  EditCreate(0, data3, 0, col[4]-50, row[3], 50, 20,string(trail_step), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_trailing_trade);
  onoff_property(data1, data2, data3);


  for(int i=4;i<baris;i++){
    row[i] += kasih_jarak;
  }

  data1 = Name+"btn_piramid";
  data2 = Name+"rc distpira_pts";
  data3 = Name+"rc numpira_pts";
  ButtonCreate(0, data1, 0, col[0], row[4], widthd * 4, 20,"Active Piramidation", "Century", 10, clrBlack, clrBlack, clrRed, clrNONE);

  ButtonCreate(0, Name+"rc distpira_b", 0, col[0], row[5], 110, 20,"Distance", "Century", 10, clrBlack, clrDodgerBlue,clrDodgerBlue, clrNONE);
  EditCreate(0, data2, 0, col[1] + 30, row[5], 50, 20, string(dist_piramidation),"Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, 0, clrPink,clrWhite);
  ButtonCreate(0, Name+"rc numpira_b", 0, col[2], row[5], 110, 20,"No", "Century", 10, clrBlack, clrDodgerBlue,clrDodgerBlue, clrNONE);
  EditCreate(0, data3, 0, col[3] + 30, row[5], 50, 20, string(num_piramidation),"Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, 0, clrPink,clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_piramid);
  onoff_property(data1, data2, data3);
  piramid_monitor(state_piramid);
  
  data1 = Name+"sl_piramid";  
  data2 = Name+"sl_piramid_edit";
  data3 = "";
  ButtonCreate(0, data1, 0, col[0], row[6], 30, 20, "SL","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]-50, row[6], 50, 20,string(sl_piramidx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_sl_piramid);
  onoff_property(data1, data2, data3);
  button_sl_piramid(state_sl_piramid);
  
  data1 = Name+"tp_piramid";
  data2 = Name+"tp_piramid_edit";  
  data3 = "";
  ButtonCreate(0, data1, 0, col[0]+50+30, row[6], 30, 20, "TP","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]+30, row[6], 50, 20,string(tp_piramidx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_tp_piramid);
  onoff_property(data1, data2, data3);
  button_tp_piramid(state_tp_piramid);
  
  data1 = Name+"trail_piramid";  
  data2 = Name+"trail_piramid_edit";  
  data3 = Name+"trail_step_piramid_edit";
  ButtonCreate(0, data1, 0, col[2], row[6], 50, 20, "Trail","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[3]-30, row[6], 60, 20,string(trail_piramidx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  EditCreate(0, data3, 0, col[4]-50, row[6], 50, 20,string(step_piramidx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_trailing_piramid);
  onoff_property(data1, data2, data3);

  for(int i=7;i<baris;i++){
    row[i] += kasih_jarak;
  }
  
  data1 = Name+"btn_pending";
  data2 = "";
  data3 = "";
  ButtonCreate(0, data1, 0, col[0], row[7], widthd * 4, 20,"Active Pending", "Century", 10, clrBlack, clrBlack, clrRed, clrNONE);  
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_pending);
  onoff_property(data1, data2, data3);
  pending_monitor(state_pending);  

  ButtonCreate(0, Name+"rc activeap_b", 0, col[0], row[8], 110+50, 20,"Auto", "Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  ButtonCreate(0, Name+"rc manualdist_b", 0, col[2], row[8], 110, 20,"Manual", "Century", 10, clrBlack, clrBlack, clrLightGreen, clrNONE);
  ObjectSetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE, true);
  EditCreate(0, Name+"rc manualdist_pts", 0, col[3] + 30, row[8], 50, 20, string(manual_distance),"Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, 0, clrPaleTurquoise,clrWhite);  

  data1 = Name+"sl_pending";  
  data2 = Name+"sl_pending_edit";  
  data3 = "";
  ButtonCreate(0, data1, 0, col[0], row[9], 30, 20, "SL","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]-50, row[9], 50, 20,string(sl_pendingx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);  
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_sl_pending);
  onoff_property(data1, data2, data3);
  button_sl_pending(state_sl_pending);
  
  data1 = Name+"tp_pending";  
  data2 = Name+"tp_pending_edit";  
  data3 = "";
  ButtonCreate(0, data1, 0, col[0]+50+30, row[9], 30, 20, "TP","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]+30, row[9], 50, 20,string(tp_pendingx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_tp_pending);
  onoff_property(data1, data2, data3);
  button_tp_pending(state_tp_pending);
  
  data1 = Name+"trail_pending";
  data2 = Name+"trail_pending_edit";  
  data3 = Name+"trail_step_pending_edit";
  ButtonCreate(0, data1, 0, col[2], row[9], 50, 20, "Trail","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[3]-30, row[9], 60, 20,string(trail_pendingx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  EditCreate(0, data3, 0, col[4]-50, row[9], 50, 20,string(step_pendingx), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_trailing_pending);
  onoff_property(data1, data2, data3);

  ButtonCreate(0, Name+"base_trail_pending_pending", 0, col[0], row[10], 160, 20, "Trail For Pending","Century", 10, clrBlack, clrBlack, clrDodgerBlue, clrNONE);
  data1 = Name+"trail_pending_pending";
  data2 = Name+"trail_pending_pending_edit";  
  data3 = Name+"trail_step_pending_pending_edit";
  ButtonCreate(0, data1, 0, col[2], row[10], 50, 20, "Trail","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[3]-30, row[10], 60, 20,string(trail_pendingx_pending), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  EditCreate(0, data3, 0, col[4]-50, row[10], 50, 20,string(step_pendingx_pending), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_trailing_pending_pending);
  onoff_property(data1, data2, data3);

  for(int i=11;i<baris;i++){
    row[i] += kasih_jarak;
  }

  data1 = Name+"btn_multi_pending";
  data2 = Name+"distance_price_multi_edit";
  data3 = Name+"max_hedging_multi_edit";
  ButtonCreate(0, data1, 0, col[0], row[11], widthd * 4, 20,"Multi Pending", "Century", 10, clrBlack, clrBlack, clrRed, clrNONE);

  ButtonCreate(0, Name+"btn_multi_distance_price", 0, col[0], row[12], 110, 20,"Distance Price", "Century", 8, clrBlack, clrDodgerBlue,clrDodgerBlue, clrNONE);
  EditCreate(0, data2, 0, col[1] + 30, row[12], 50, 20, string(multi_distance_price),"Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, 0, clrPink,clrWhite);
  ButtonCreate(0, Name+"rc maxhedge_b", 0, col[2], row[12], 110, 20, "Max Hedging","Century", 8, clrBlack, clrDodgerBlue,clrDodgerBlue, clrNONE);
  EditCreate(0, data3, 0, col[3] + 30, row[12], 50, 20, string(max_hedging),"Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, 0, clrPink,clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_multi);
  onoff_property(data1, data2, data3);
  multi_monitor(state_multi);

  ButtonCreate(0, Name+"btn_auto_multi", 0, col[0], row[13], widthd * 2, 20,"Auto", "Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  ButtonCreate(0, Name+"btn_manual_multi", 0, col[2], row[13], 110, 20,"Manual", "Century", 10, clrBlack, clrBlack, clrLightGreen, clrNONE);
  ObjectSetInteger(0, Name+"btn_manual_multi", OBJPROP_STATE, true);
  EditCreate(0, Name+"manual_multi_edit", 0, col[3] + 30, row[13], 50, 20,string(distance_hedging), "Century", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER,0, clrPaleTurquoise, clrWhite);

  data1 = Name+"sl_multi";  
  data2 = Name+"sl_multi_edit";  
  data3 = "";
  ButtonCreate(0, data1, 0, col[0], row[14], 30, 20, "SL","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]-50, row[14], 50, 20,string(sl_multix), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_sl_multi);
  onoff_property(data1, data2, data3);
  button_sl_multi(state_sl_multi);
  
  data1 = Name+"tp_multi";  
  data2 = Name+"tp_multi_edit";
  data3 = "";
  ButtonCreate(0, data1, 0, col[0]+50+30, row[14], 30, 20, "TP","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[1]+30, row[14], 50, 20,string(tp_multix), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_tp_multi);
  onoff_property(data1, data2, data3);
  button_tp_multi(state_tp_multi);
  
  data1 = Name+"trail_multi";  
  data2 = Name+"trail_multi_edit";  
  data3 = Name+"trail_step_multi_edit";
  ButtonCreate(0, data1, 0, col[2], row[14], 50, 20, "Trail","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[3]-30, row[14], 60, 20,string(trail_multix), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  EditCreate(0, data3, 0, col[4]-50, row[14], 50, 20,string(step_multix), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_trailing_multi);
  onoff_property(data1, data2, data3);

  ButtonCreate(0, Name+"base_trail_multi_pending", 0, col[0], row[15], 160, 20, "Trail For Pending","Century", 10, clrBlack, clrBlack, clrDodgerBlue, clrNONE);
  data1 = Name+"trail_multi_pending";
  data2 = Name+"trail_multi_pending_edit";  
  data3 = Name+"trail_step_multi_pending_edit";
  ButtonCreate(0, data1, 0, col[2], row[15], 50, 20, "Trail","Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  EditCreate(0, data2, 0, col[3]-30, row[15], 60, 20,string(trail_pendingx_pending), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  EditCreate(0, data3, 0, col[4]-50, row[15], 50, 20,string(step_pendingx_pending), "Century", 10, ALIGN_CENTER, false,CORNER_LEFT_UPPER, 0, clrPink, clrWhite);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_trailing_pending_pending);
  onoff_property(data1, data2, data3);

  for(int i=16;i<baris;i++){
    row[i] += kasih_jarak;
  }
  
  ButtonCreate(0, Name+"rc closesell_b", 0, col[0], row[16], widthd * 2, 20,"Close Sell", "Century", 10, clrWhite, clrOrangeRed, clrGray,clrNONE);
  ButtonCreate(0, Name+"rc closebuy_b", 0, col[2], row[16], widthd * 2, 20,"Close Buy", "Century", 10, clrWhite, clrOrangeRed, clrGray,clrNONE);
  ButtonCreate(0, Name+"rc closeall_b", 0, col[0], row[17], widthd * 4, 20,"Close All", "Century", 10, clrWhite, clrDodgerBlue, clrGray,clrNONE);

  for(int i=16;i<baris;i++){
    row[i] += kasih_jarak;
  }

  data1 = Name+"btn_ea";
  data2 = "";
  data3 = "";
  ButtonCreate(0, data1, 0, col[0], row[18], widthd * 4, 20,"Active EA", "Century", 10, clrBlack, clrBlack, clrRed, clrNONE);
  ObjectSetInteger(0, data1, OBJPROP_STATE, state_EA);
  onoff_property(data1, data2, data3);
  ea_process(state_EA);
  
  ButtonCreate(0, Name+"block", 0, 110, 35, 100, 25,"Block Off", "Century", 10, clrBlack, clrBlack, clrLightGreen, clrNONE);
  ObjectSetInteger(0, Name+"block", OBJPROP_CORNER, CORNER_RIGHT_LOWER);

  LabelCreate(0, Name+"ltotal_profit", 0, 10, 100, CORNER_RIGHT_UPPER, "Total Profit: ","Arial", font_right_size, font_right_color, 0.0, ANCHOR_RIGHT_UPPER, false,false, true, 0);
  LabelCreate(0, Name+"lzz_pending", 0, 10, 140, CORNER_RIGHT_UPPER, "Zigzag Pending: ","Arial", font_right_size, font_right_color, 0.0, ANCHOR_RIGHT_UPPER, false,false, true, 0);
  LabelCreate(0, Name+"lzz_multi", 0, 10, 180, CORNER_RIGHT_UPPER, "Zigzag Multi: ","Arial", font_right_size, font_right_color, 0.0, ANCHOR_RIGHT_UPPER, false,false, true, 0);
  LabelCreate(0, Name+"lzz_ea", 0, 10, 220, CORNER_RIGHT_UPPER, "Zigzag EA: ","Arial", font_right_size, font_right_color, 0.0, ANCHOR_RIGHT_UPPER, false,false, true, 0);

  // EditCreate(0, Name+"rc piramid_buy", 0, 150, 70, 120, 20, string(0), "Century", 10,ALIGN_CENTER, false, 1, 0, clrWhite, clrWhite);
  // EditCreate(0, Name+"rc piramid_sell", 0, 150, 120, 120, 20, string(0), "Century",10, ALIGN_CENTER, false, 1, 0, clrWhite, clrWhite);

  // LabelCreate(0, Name+"Label1", 0, 120, 170, CORNER_RIGHT_UPPER, "Pending Number","Arial", 16, clrYellowGreen, 0.0, ANCHOR_RIGHT_UPPER, false,false, true, 0);
  // LabelCreate(0, Name+"Label2", 0, 160, 70, CORNER_RIGHT_UPPER, "Piramid Buy","Arial", 16, clrWheat, 0.0, ANCHOR_RIGHT_UPPER, false, false,true, 0);
  // LabelCreate(0, Name+"Label3", 0, 160, 119, CORNER_RIGHT_UPPER, "Piramid Sell","Arial", 16, clrWheat, 0.0, ANCHOR_RIGHT_UPPER, false, false,true, 0);

  if(GlobalVariableCheck(Name+_Symbol+"_note_inc_trade")){
    note_inc_trade = (int)GlobalVariableGet(Name+_Symbol+"_note_inc_trade");
  }else{
    note_inc_trade = 0;
  }
  // Print("note trade: "+string(note_inc_trade));

  // hitung_zigzag_auto();
  
  OnTick();
  
  return (INIT_SUCCEEDED);
}

void updateParameters() {

  la = StringToDouble(ObjectGetString(0, Name+"rc lot", OBJPROP_TEXT));

  pn_stoploss = (int)StringToInteger(ObjectGetString(0, Name+"sl_trade_edit", OBJPROP_TEXT));
  pn_takeprofit = (int)StringToInteger(ObjectGetString(0, Name+"tp_trade_edit", OBJPROP_TEXT));
  pn_trailing = (int)StringToInteger(ObjectGetString(0, Name+"trail_trade_edit", OBJPROP_TEXT));
  dist_piramidation = (int)StringToInteger(ObjectGetString(0, Name+"rc distpira_pts", OBJPROP_TEXT));

  num_piramidation = (int)StringToInteger(ObjectGetString(0, Name+"rc numpira_pts", OBJPROP_TEXT));
  // manual_distance = (int)StringToInteger(ObjectGetString(0, Name+"rc activeap_pts", OBJPROP_TEXT));
  trailsteps_pending = (int)StringToInteger( ObjectGetString(0, Name+"distance_price_multi_edit", OBJPROP_TEXT));
  max_hedging = (int)StringToInteger(ObjectGetString(0, Name+"max_hedging_multi_edit", OBJPROP_TEXT));
  distance_hedging = (int)StringToInteger(ObjectGetString(0, Name+"manual_multi_edit", OBJPROP_TEXT));

  sellstop = NormalizeDouble(StringToDouble(ObjectGetString(0, Name+"rc sellstop_pl", OBJPROP_TEXT)),(int)MarketInfo(Symbol(), MODE_DIGITS));
  buystop = NormalizeDouble(StringToDouble(ObjectGetString(0, Name+"rc buystop_pl", OBJPROP_TEXT)),(int)MarketInfo(Symbol(), MODE_DIGITS));
  distpira_pts = (int)StringToInteger(ObjectGetString(0, Name+"rc distpira_pts", OBJPROP_TEXT));
  numpira_pts = (int)StringToInteger(ObjectGetString(0, Name+"rc numpira_pts", OBJPROP_TEXT));
}

void colorButtonsLive(long chart_ID, string name, color clrON, color clrOFF) {
  color back_clr;
  if (ObjectGetInteger(chart_ID, name, OBJPROP_STATE)) {
    back_clr = clrON;
  } else {
    back_clr = clrOFF;
  }
  ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
}

void pricevalidButtons() {
  // valide sellstops
  if (double(ObjectGetString(0, Name+"rc sellstop_pl", OBJPROP_TEXT)) >= Bid) {
    ObjectSetString(0, Name+"rc sellstop_pl", OBJPROP_TEXT, DoubleToString(Bid, Digits));
  }

  // valid buystops
  if (double(DoubleToString(double(ObjectGetString(0, Name+"rc buystop_pl", OBJPROP_TEXT)),
                     Digits)) <= Ask) {
    ObjectSetString(0, Name+"rc buystop_pl", OBJPROP_TEXT, DoubleToString(Ask, Digits));
  }
}

void OnTick() {
  cek_transaksi();

  ObjectSetString(0, Name+"rc sell_pl", OBJPROP_TEXT, DoubleToString(Bid, Digits));
  ObjectSetString(0, Name+"rc buy_pl", OBJPROP_TEXT, DoubleToString(Ask, Digits));

  // int count=0;
  // for (int i = 0; i < barsToScan; i++) {
  //   if (zigzag(i) != 0 && count < zzNosToUse) {
  //     ArrayResize(swingDepth_Array, i + 1);
  //     swingDepth_Array[count] = swingDepth(i);
  //     count++;
  //   }
  //   if (count >= zzNosToUse) {
  //     break;
  //   }
  // }

  // double temp_sum=0;
  // double averageZZPoints=0;
  // int factoredAZP;
  // int frequency=0;
  // for (int i = 0; i < count; i++) {
  //   // filter zigzag values
  //   if (swingDepth_Array[i] < zzValuesFilterPoints) {
  //     temp_sum += swingDepth_Array[i];
  //     frequency++;
  //   }
  // }
  // // kill zero-divide
  // if (frequency != 0) {
  //   averageZZPoints = temp_sum / frequency;
  // }
  // // factoring using multiplier
  // factoredAZP = int(multiplierAverageZZPoint * averageZZPoints);

  // apply handle and move dashboard elements
  // handles_movement();

  // get updated parameters
  updateParameters();
  pricevalidButtons();

  // detectStartingTrade();

  //closeOrphanedPendings();
  
  // int piraSize = updateFirstradesCount;

  // ArrayResize(piramidPriceLevelsBuy, piraSize);
  // ArrayResize(piramidPriceLevelsSell, piraSize);

  // ArrayResize(commentsLevelsBuy, piraSize);
  // ArrayResize(commentsLevelsSell, piraSize);

  // for (int i = 0; i < piraSize; i++) {
  //   for (int j = 0; j < num_piramidation; j++) {
  //     string prefix;
  //     if (firstTradesInts[i][1] == OP_BUY) {
  //       prefix = "b_";
  //     }
  //     if (firstTradesInts[i][1] == OP_SELL) {
  //       prefix = "s_";
  //     }
  //     piramidPriceLevelsBuy[i][j] =
  //         firstTradesOpenPrice[i] + (j + 1) * (dist_piramidation * point);
  //     piramidPriceLevelsSell[i][j] =
  //         firstTradesOpenPrice[i] - (j + 1) * (dist_piramidation * point);

  //     ObjectSetString(0, Name+"rc piramid_buy", OBJPROP_TEXT,
  //                     string(piramidPriceLevelsBuy[i][j]));

  //     ObjectSetString(0, Name+"rc piramid_sell", OBJPROP_TEXT,
  //                     string(piramidPriceLevelsSell[i][j]));

  //     commentsLevelsBuy[i][j][0] = prefix + string(firstTradesInts[i][0]) +
  //                                  string((piramidPriceLevelsBuy[i][j] / point));
  //     commentsLevelsSell[i][j][0] = prefix + string(firstTradesInts[i][0]) +
  //                                   string((piramidPriceLevelsSell[i][j] / point));

  //     commentsLevelsBuy[i][j][1] =
  //         prefix + string(firstTradesInts[i][0]) + string((piramidPriceLevelsBuy[i][j] + point) / point);
  //     commentsLevelsSell[i][j][1] =
  //         prefix + string(firstTradesInts[i][0]) + string((piramidPriceLevelsSell[i][j] + point) / point);

  //     commentsLevelsBuy[i][j][2] =
  //         prefix + string(firstTradesInts[i][0]) + string((piramidPriceLevelsBuy[i][j] + 2 * point) / point);
  //     commentsLevelsSell[i][j][2] =
  //         prefix + string(firstTradesInts[i][0]) + string((piramidPriceLevelsSell[i][j] + 2 * point) / point);

  //     commentsLevelsBuy[i][j][3] =
  //         prefix + string(firstTradesInts[i][0]) +
  //         string((piramidPriceLevelsBuy[i][j] - point) / point);
  //     commentsLevelsSell[i][j][3] =
  //         prefix + string(firstTradesInts[i][0]) +
  //         string((piramidPriceLevelsSell[i][j] - point) / point);

  //     commentsLevelsBuy[i][j][4] =
  //         prefix + string(firstTradesInts[i][0]) +
  //         string((piramidPriceLevelsBuy[i][j] - 2 * point) / point);
  //     commentsLevelsSell[i][j][4] =
  //         prefix + string(firstTradesInts[i][0]) +
  //         string((piramidPriceLevelsSell[i][j] - 2 * point) / point);
  //   }
  // }

  // autopending and manual pending

  // ArrayResize(autopendingLevels, piraSize);
  // ArrayResize(manualpendingLevels, piraSize);
  // ArrayResize(pendingTradeType, piraSize);
  // ArrayResize(pendingComments, piraSize);
  // for (int i = 0; i < piraSize; i++) {
  //   for (int j = 0; j < 1; j++) {
  //     //string prefix;
  //     if (firstTradesInts[i][1] == OP_BUY) {
  //       pendingTradeType[i][j] = OP_SELLSTOP;
  //       autopendingLevels[i][j] =
  //           firstTradesOpenPrice[i] - (factoredAZP * 10 * point);
  //       manualpendingLevels[i][j] =
  //           firstTradesOpenPrice[i] - (manual_distance * point);
  //       pendingComments[i][j] = string(firstTradesInts[i][0]) + "p";
  //     }
  //     if (firstTradesInts[i][1] == OP_SELL) {
  //       pendingTradeType[i][j] = OP_BUYSTOP;
  //       autopendingLevels[i][j] =
  //           firstTradesOpenPrice[i] + (factoredAZP * 10 * point);
  //       manualpendingLevels[i][j] =
  //           firstTradesOpenPrice[i] + (manual_distance * point);
  //       pendingComments[i][j] = string(firstTradesInts[i][0]) + "p";
  //     }
  //   }
  // }

  // colorButtonslive

  // colorButtonsLive(0, Name+"btn_buy", clrSpringGreen, clrMoccasin);
  // colorButtonsLive(0, Name+"btn_sell", clrSpringGreen, clrMoccasin);
  // colorButtonsLive(0, Name+"btn_buystop", clrSpringGreen, clrMoccasin);
  // colorButtonsLive(0, Name+"btn_sellstop", clrSpringGreen, clrMoccasin);
  // colorButtonsLive(0, Name+"rc closesell_b", clrOrangeRed, clrGray);
  // colorButtonsLive(0, Name+"rc closebuy_b", clrOrangeRed, clrGray);
  // colorButtonsLive(0, Name+"rc closeall_b", clrOrangeRed, clrGray);

  // trail(mn_sell);
  // trail(mn_buy);
  // trail(mn_pend);
  // trail(mn_pira);

  
  //piramidation();

  // 5 automatic pending
  // if (ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == true) {
  //   ObjectSetString(0, Name+"rc activeap_b", OBJPROP_TEXT, "AUTOPEND ON");

  //   ObjectSetString(0, Name+"rc activeap_pts", OBJPROP_TEXT, string(factoredAZP * 10));
  //   ObjectSetInteger(0, Name+"rc activeap_pts", OBJPROP_BGCOLOR, clrPaleTurquoise);
  //   ObjectSetInteger(0, Name+"rc manualdist_pts", OBJPROP_BGCOLOR, clrPink);
  //   pendingFunction();

  // } else {
  //   ObjectSetString(0, Name+"rc activeap_b", OBJPROP_TEXT, "AUTOPEND OFF");

  //   ObjectSetInteger(0, Name+"rc activeap_pts", OBJPROP_BGCOLOR, clrPink);
  //   ObjectSetInteger(0, Name+"rc manualdist_pts", OBJPROP_BGCOLOR, clrPaleTurquoise);
  // }

  // // 5 manual pending
  // if (ObjectGetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE) == true &&
  //     ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == false) {
  //   pendingFunction();
  // }
  // if (ObjectGetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE) == false &&
  //     ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == false) {
  // }

  eful_ontick();
}

// bool detectStartingTrade(string tradeType, string orderComment,
//                          int magicNumber) {
//   bool detectStartingTrade = false;
//   if (tradeType == "s_") {
//     for (int i = 0; i < OrdersTotal(); i++) {
//       if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//         if (OrderComment() == orderComment &&
//             OrderMagicNumber() == magicNumber) {
//           detectStartingTrade = true;
//         }
//       }
//     }
//   }

//   if (tradeType == "buy") {
//     for (int i = 0; i < OrdersTotal(); i++) {
//       if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//         if (OrderComment() == orderComment &&
//             OrderMagicNumber() == magicNumber) {
//           detectStartingTrade = true;
//         }
//       }
//     }
//   }
//   return (detectStartingTrade);
// }

// void detectStartingTrade() // populate firstTrade array
// {

//   int count=0;
//   for (int i = 0; i < OrdersTotal(); i++) {
//     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//       if ((OrderComment() == "s_" || OrderComment() == "b_") &&
//           (OrderMagicNumber() == mn_buy || OrderMagicNumber() == mn_sell) &&
//           OrderSymbol() == Symbol() &&
//           (OrderType() == OP_BUY || OrderType() == OP_SELL)) {
//         count++;
//         ArrayResize(firstTradesInts, count);
//         ArrayResize(firstTradesOpenPrice, count);
//         ArrayResize(firstTradesLots, count);

//         firstTradesInts[count - 1][0] = OrderTicket();
//         firstTradesInts[count - 1][1] = OrderType();
//         firstTradesOpenPrice[count - 1] = OrderOpenPrice();
//         firstTradesLots[count - 1] = OrderLots();
//       }
//     }
//   }
//   // update the number of trades starters live
//   updateFirstradesCount = count;
// }

// void piramidation() {
//   if(!ObjectGetInteger(0, Name+"btn_piramid", OBJPROP_STATE))return;

//   int tempSize = updateFirstradesCount;
//   int ticket;

//   for (int i = 0; i < tempSize; i++) {
//     if (OrderSelect(firstTradesInts[i][0], SELECT_BY_TICKET, MODE_TRADES)) {
//       for (int j = 0; j < num_piramidation; j++) {
//         if (firstTradesInts[i][1] == OP_BUY &&
//             !isPiramidTradeFound_Buy(i, j) &&
//             piramidPriceLevelsBuy[i][j] + sensitivity * point > Ask &&
//             piramidPriceLevelsBuy[i][j] - sensitivity * point < Ask
//         ) {
          
//           ticket = OrderSend(Symbol(), OP_BUY, firstTradesLots[i],
//                                piramidPriceLevelsBuy[i][j], 0, 0, 0,
//                                commentsLevelsBuy[i][j][0], mn_pira);

//           break;
//         }

//         if (firstTradesInts[i][1] == OP_SELL &&
//             !isPiramidTradeFound_Sell(i, j) &&
//             piramidPriceLevelsSell[i][j] + sensitivity * point > Bid &&
//             piramidPriceLevelsSell[i][j] - sensitivity * point < Bid
//         ) {
//           ticket = OrderSend(Symbol(), OP_SELL, firstTradesLots[i],
//                                piramidPriceLevelsSell[i][j], 0, 0, 0,
//                                commentsLevelsSell[i][j][0], mn_pira);

//           break;
//         }
//       }
//     }
//   }
// }

// bool isPiramidTradeFound_Buy(
//     int firsttradeindex, // first Trade number being scanned
//     int piramidnumindex  // piramide number being scanned
// ) {
//   bool isPiramidFound = false;
//   for (int i = 0; i < OrdersTotal(); i++) {
//     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//       if ((OrderComment() ==
//                commentsLevelsBuy[firsttradeindex][piramidnumindex][0] || //&&
//            OrderComment() ==
//                commentsLevelsBuy[firsttradeindex][piramidnumindex][1] || //&&
//            OrderComment() ==
//                commentsLevelsBuy[firsttradeindex][piramidnumindex][2] || //&&
//            OrderComment() ==
//                commentsLevelsBuy[firsttradeindex][piramidnumindex][3] || //&&
//            OrderComment() ==
//                commentsLevelsBuy[firsttradeindex][piramidnumindex][4] //&&
//            ) &&
//           OrderMagicNumber() == mn_pira) {
//         isPiramidFound = true;
//         break;
//       }
//     }
//   }
//   return (isPiramidFound);
// }

// bool isPiramidTradeFound_Sell(
//     int firsttradeindex, // first Trade number being scanned
//     int piramidnumindex  // piramide number being scanned
// ) {
//   bool isPiramidFound = false;
//   for (int i = 0; i < OrdersTotal(); i++) {
//     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//       if ((OrderComment() ==
//                commentsLevelsSell[firsttradeindex][piramidnumindex][0] || //&&
//            OrderComment() ==
//                commentsLevelsSell[firsttradeindex][piramidnumindex][1] || //&&
//            OrderComment() ==
//                commentsLevelsSell[firsttradeindex][piramidnumindex][2] || //&&
//            OrderComment() ==
//                commentsLevelsSell[firsttradeindex][piramidnumindex][3] || //&&
//            OrderComment() ==
//                commentsLevelsSell[firsttradeindex][piramidnumindex][4] //&&
//            ) &&
//           OrderMagicNumber() == mn_pira) {
//         isPiramidFound = true;
//         break;
//       }
//     }
//   }
//   return (isPiramidFound);
// }

// autopending and manual pending function
// void pendingFunction() {
//   int tempSize = updateFirstradesCount;
//   int ticket;

//   for (int i = 0; i < tempSize; i++) {
//     if (OrderSelect(firstTradesInts[i][0], SELECT_BY_TICKET, MODE_TRADES)) {
//       for (int j = 0; j < 1; j++) {
//         if (firstTradesInts[i][1] == OP_BUY &&
//             isPendingFound(i, j) == false //&&
//         ) {
//           // autopending
//           if (ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == true) {
//             ticket = OrderSend(Symbol(), pendingTradeType[i][j],
//                                firstTradesLots[i], autopendingLevels[i][j], 0,
//                                0, 0, pendingComments[i][j], mn_pend);
//           }
//           // manual pending
//           if (ObjectGetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE) == true &&
//               ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == false) {
//             ticket = OrderSend(Symbol(), pendingTradeType[i][j],
//                                firstTradesLots[i], manualpendingLevels[i][j], 0,
//                                0, 0, pendingComments[i][j], mn_pend);
//           }
//         }

//         if (firstTradesInts[i][1] == OP_SELL &&
//             isPendingFound(i, j) == false //&&
//         ) {
//           // autopend
//           if (ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == true) {
//             ticket = OrderSend(Symbol(), pendingTradeType[i][j],
//                                firstTradesLots[i], autopendingLevels[i][j], 0,
//                                0, 0, pendingComments[i][j], mn_pend);
//           }
//           // manual pending
//           if (ObjectGetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE) == true &&
//               ObjectGetInteger(0, Name+"rc activeap_b", OBJPROP_STATE) == false) {
//             ticket = OrderSend(Symbol(), pendingTradeType[i][j],
//                                firstTradesLots[i], manualpendingLevels[i][j], 0,
//                                0, 0, pendingComments[i][j], mn_pend);
//           }
//         }
//       }
//     }
//   }
// }

// void closeOrphanedPendings() {
//   // closer for pending
//   // part1;populate source orders of all existing pending trades, ie finding
//   // their first trades
//   int countxx=0;
//   int source = 0;
//   int pendingLive = 1;
//   int pendingLive_TradeType = 2;
//   ArrayResize(pendingTicketsActive, 0);
//   for (int i = 0; i < OrdersTotal(); i++) {
//     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//       if (StringSubstr(OrderComment(), StringLen(OrderComment()) - 1, 1) ==
//               "p" &&
//           OrderMagicNumber() == mn_pend) {
//         countxx++;
//         ArrayResize(pendingTicketsActive, countxx);
//         pendingTicketsActive[countxx - 1][source] = (int)StringToInteger(
//             StringSubstr(OrderComment(), 0, StringLen(OrderComment()) - 1));
//         pendingTicketsActive[countxx - 1][pendingLive] = OrderTicket();
//         pendingTicketsActive[countxx - 1][pendingLive_TradeType] = OrderType();
//       }
//     }
//   }
//   // Kill pending orders with their source not selected amongs trade pool
//   // deletes orphaned pending orders
//   for (int i = 0; i < countxx; i++) {
//     // Alert("findme",OrderSelect(pendingTicketsActive[i][source]);
//     if (OrderSelect(pendingTicketsActive[i][source], SELECT_BY_TICKET,
//                     MODE_TRADES)) {
//       if (int(OrderCloseTime()) > 0 &&
//           (pendingTicketsActive[i][pendingLive_TradeType] == OP_SELLSTOP ||
//            pendingTicketsActive[i][pendingLive_TradeType] ==
//                OP_BUYSTOP)) // i.e. not buy(0) or sell(1)
//       {
//         // OrderClose(pendingTicketsActive[i][pendingLive],OrderLots(),OrderClosePrice(),0);
//         if (OrderDelete(pendingTicketsActive[i][pendingLive])) {
//         }
//       }
//     }
//   }
// }

// isPendingFound also deletes orphaned pending orders
// bool isPendingFound(int firsttradeindex, // first Trade number being scanned
//                     int pendingnumindex  // piramide number being scanned
// ) {
//   bool isPendingFound = false;

//   //
//   for (int i = 0; i < OrdersTotal(); i++) {
//     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
//       if (OrderComment() == pendingComments[firsttradeindex][pendingnumindex] &&
//           OrderMagicNumber() == mn_pend) {
//         isPendingFound = true;
//         break;
//       }
//     }
//   }
//   return (isPendingFound);
// }

double stoplossFunc(string tradetype = "sell") {

  // stoploss
  double sloss=0;
  updateParameters();
  if (ObjectGetInteger(0, Name+"sl_trade", OBJPROP_STATE)) // stoploss button on
  {
    ObjectSetString(0, "trade1 stoploss_pts", OBJPROP_TEXT,
                    string(pn_stoploss));
    ObjectSetInteger(0, "trade1 stoploss_pts", OBJPROP_COLOR, clrOrangeRed);

    if (pn_stoploss == 0) {
      sloss = 0;
    }

    if (pn_stoploss != 0 && tradetype == "sell") {
      // sloss = (Ask+(pn_stoploss*point));
      sloss = (Bid + (pn_stoploss * point)); // experimenting
    }
    if (pn_stoploss != 0 && tradetype == "buy") {
      // sloss = (Bid-pn_stoploss*point);
      sloss = (Ask - pn_stoploss * point); // experimenting
    }

    if (pn_stoploss != 0 && tradetype == "sellstop") {
      // sloss = (Ask+(pn_stoploss*point));
      sloss = (sellstop + (pn_stoploss * point)); // experimenting
    }
    if (pn_stoploss != 0 && tradetype == "buystop") {
      // sloss = (Bid-pn_stoploss*point);
      sloss = (buystop - pn_stoploss * point); // experimenting
    }
  }

  if (!ObjectGetInteger(0, Name+"sl_trade", OBJPROP_STATE)){ // stoploss button off
    sloss = 0;
  }
  return (NormalizeDouble(sloss, (int)MarketInfo(Symbol(), MODE_DIGITS)));
}

double takeprofitFunc(string tradetype = "sell") {
  double tprofit=0;
  if (ObjectGetInteger(0, Name+"tp_trade", OBJPROP_STATE) ==
      true) // stoploss button on
  {
    ObjectSetString(0, "trade1 takeprofit_pts", OBJPROP_TEXT,
                    string(pn_takeprofit));

    if (pn_takeprofit == 0) {
      tprofit = 0;
    }

    if (pn_takeprofit != 0 && tradetype == "sell") {
      //      tprofit = (Ask-(pn_takeprofit*point));
      tprofit = (Bid - (pn_takeprofit * point)); // experimenting
    }
    if (pn_takeprofit != 0 && tradetype == "buy") {
      // tprofit = (Bid+pn_takeprofit*point);
      tprofit = (Ask + pn_takeprofit * point); // experimenting
    }

    if (pn_takeprofit != 0 && tradetype == "sellstop") {
      //      tprofit = (Ask-(pn_takeprofit*point));
      tprofit = (sellstop - (pn_takeprofit * point)); // experimenting
    }
    if (pn_takeprofit != 0 && tradetype == "buystop") {
      // tprofit = (Bid+pn_takeprofit*point);
      tprofit = (buystop + pn_takeprofit * point); // experimenting
    }
  }

  if (ObjectGetInteger(0, Name+"tp_trade", OBJPROP_STATE) ==
      false) // stoploss button off
  {
    tprofit = 0;
  }
  return (NormalizeDouble(tprofit, (int)MarketInfo(Symbol(), MODE_DIGITS)));
}

// void handles_movement() {
//   // handle1("f",1500,80);

//   handle1("f", x_coordinate, y_coordinate);

//   move_by_handle1(Name+"btn_sell", col[0], row[0]);
//   move_by_handle1(Name+"rc lot", col[1], row[0]);
//   move_by_handle1(Name+"btn_buy", col[3], row[0]);

//   move_by_handle1(Name+"rc sell_pl", col[0], row[1]);
//   move_by_handle1(Name+"rc buy_pl", col[3], row[1]);

//   move_by_handle1(Name+"btn_sellstop", col[0], row[2]);
//   move_by_handle1(Name+"rc sellstop_pl", col[1], row[2]);
//   move_by_handle1(Name+"rc buystop_pl", col[2], row[2]);
//   move_by_handle1(Name+"btn_buystop", col[3], row[2]);

//   move_by_handle1(Name+"sl_trade", col[0], row[3]);
//   move_by_handle1(Name+"sl_trade_edit", col[1], row[3]);
//   move_by_handle1(Name+"trail_trade", col[2], row[3]);
//   move_by_handle1(Name+"trail_trade_edit", col[3], row[3]);

//   move_by_handle1(Name+"tp_trade", col[0], row[4]);
//   move_by_handle1(Name+"tp_trade_edit", col[1], row[4]);  
//   move_by_handle1(Name+"rc multipend_b", col[3], row[4]);

//   move_by_handle1(Name+"btn_piramid", col[0], row[5]);

//   move_by_handle1(Name+"rc distpira_b", col[0], row[6]);
//   move_by_handle1(Name+"rc distpira_pts", col[1] + 30, row[6]);
//   move_by_handle1(Name+"rc numpira_b", col[2], row[6]);
//   move_by_handle1(Name+"rc numpira_pts", col[3] + 30, row[6]);

//   move_by_handle1(Name+"rc activeap_b", col[0], row[8]);
//   // move_by_handle1(Name+"rc activeap_pts", col[1] + 30, row[8]);
//   move_by_handle1(Name+"rc manualdist_b", col[2], row[8]);
//   move_by_handle1(Name+"rc manualdist_pts", col[3] + 30, row[8]);

//   move_by_handle1(Name+"btn_multi_distance_price", col[0], row[10]);
//   move_by_handle1(Name+"distance_price_multi_edit", col[1] + 30, row[10]);
//   move_by_handle1(Name+"rc maxhedge_b", col[2], row[10]);
//   move_by_handle1(Name+"max_hedging_multi_edit", col[3] + 30, row[10]);

//   move_by_handle1(Name+"btn_auto_multi", col[0], row[11]);
//   move_by_handle1(Name+"btn_manual_multi", col[2], row[11]);
//   move_by_handle1(Name+"manual_multi_edit", col[3] + 30, row[11]);

//   move_by_handle1(Name+"rc closesell_b", col[0], row[12]);
//   move_by_handle1(Name+"rc closebuy_b", col[2], row[12]);

//   move_by_handle1(Name+"rc closeall_b", col[0], row[13]);

//   move_by_handle1(Name+"btn_ea", col[0], row[14]);
// }


// color Color(double P) {
//   if (P > 0)
//     return (clrGreen);
//   if (P < 0)
//     return (clrRed);
//   return (clrGray);
// }


void DrawLABEL(string name, string Namex, int X, int Y, string font = "Arial",
               int fontsize = 10, color clr = clrGray,
               ENUM_ANCHOR_POINT align = ANCHOR_RIGHT, int CORNER = 1) {
  if (ObjectFind(name) == -1) {
    ObjectCreate(name, OBJ_LABEL, 0, 0, 0);
    ObjectSet(name, OBJPROP_CORNER, CORNER);
    ObjectSet(name, OBJPROP_XDISTANCE, X);
    ObjectSet(name, OBJPROP_YDISTANCE, Y);
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
    ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
    ObjectSetInteger(0, name, OBJPROP_ANCHOR, align);
  }
  ObjectSetText(name, Namex, fontsize, font, clr);
}

void DrawHLINE(string name, double p, color clr = clrGray) {
  if (ObjectFind(name) != -1)
    ObjectDelete(name);
  ObjectCreate(name, OBJ_HLINE, 0, 0, p);
  ObjectSetInteger(0, name, OBJPROP_STYLE, 0);
  ObjectSetInteger(0, name, OBJPROP_COLOR, clr);
  ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
  ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
  ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
}

void OnDeinit(const int reason) {
  if (!IsTesting()) {
    ObjectsDeleteAll(0, "rc");
    ObjectsDeleteAll(0, "p");
    ObjectsDeleteAll(0, "a");
    ObjectsDeleteAll(0, "");
    ObjectsDeleteAll(0, "trade1");
  }
  Comment("");
  // EventKillTimer();
}

void limited_trade_day_monitor(){
  reached_max_trade_day = false;
  reached_loss_trade_day = false;
  reached_value_trade_day = false;

  //max trade day
  if(max_trade_day>0){
    int jml_trade_day = OrdersTotal();

    int total=OrdersHistoryTotal();
    
    int xyear=Year();
    int xmonth=Month();
    int xday=Day();
    string xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" 00:00";
    datetime awal = StringToTime(xt);

    
    for(int pos=total-1; pos>=0; pos--){
      if(OrderSelect(pos,SELECT_BY_POS,MODE_HISTORY)==false) continue;
      if( OrderSymbol()==_Symbol && OrderType()<2 
          && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell || OrderMagicNumber()==mn_pend || OrderMagicNumber()==mn_pira)
          && OrderOpenTime()>=awal
          ){
        jml_trade_day++;
      }
    }

    if(jml_trade_day >= max_trade_day){
      reached_max_trade_day = true;
    }
  }

  //max loss in number and value in a day
  if(max_loss_in_number_day>0){
    int total=OrdersHistoryTotal();
    
    int xyear=Year();
    int xmonth=Month();
    int xday=Day();
    string xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" 00:00";
    datetime awal = StringToTime(xt);

    int jml_loss_no_day = 0;
    double jml_pnl_day = 0;
    double pnlx;    
    
    for(int pos=total-1; pos>=0; pos--){
      if(OrderSelect(pos,SELECT_BY_POS,MODE_HISTORY)==false) continue;
      if( OrderSymbol()==_Symbol && OrderType()<2 
          && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell || OrderMagicNumber()==mn_pend || OrderMagicNumber()==mn_pira)
          && OrderOpenTime()>=awal
          ){
        pnlx = OrderProfit()+OrderCommission()+OrderSwap();
        jml_pnl_day += pnlx;

        if(pnlx < 0){
          jml_loss_no_day++;
        }        
      }
    }

    if(jml_pnl_day <= max_loss_value_day){
      reached_value_trade_day = true;
    }

    if(jml_loss_no_day >= max_loss_in_number_day){
      reached_loss_trade_day = true;
    }
  }

}

void time_monitor(){
  __time_is_ok=false;
  
  if(!state_time1 && !state_time2&& !state_time3){
    __time_is_ok=true;
    return;
  }
  
  int xyear=Year();
  int xmonth=Month();
  int xday=Day();
  
  datetime xnow=TimeCurrent();
  datetime xstart=0, xstop=0;
  string xt;
  
  if(state_time1){
    xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" "+start_time1;
    xstart=StringToTime(xt);
    xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" "+end_time1;
    xstop=StringToTime(xt);

    if(xnow>=xstart && xnow<=xstop){
      __time_is_ok=true;
      return;
    }
  }
 
  if(state_time2){
    xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" "+start_time2;
    xstart=StringToTime(xt);
    xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" "+end_time2;
    xstop=StringToTime(xt);

    if(xnow>=xstart && xnow<=xstop){
      __time_is_ok=true;
      return;
    }
  }

  if(state_time3){
    xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" "+start_time3;
    xstart=StringToTime(xt);
    xt=IntegerToString(xyear)+"."+IntegerToString(xmonth)+"."+IntegerToString(xday)+" "+end_time3;
    xstop=StringToTime(xt);

    if(xnow>=xstart && xnow<=xstop){
      __time_is_ok=true;
      return;
    }
  }
}

int placeOrder(int tradeTypeOP) {
  if(!__time_is_ok){
    MessageBox("Time setting not allowed to open trade", "Warning");
    return -1;
  }

  if(reached_max_trade_day){
    MessageBox("Max trade a day reached", "Warning");
    return -1;
  }

  if(reached_loss_trade_day){
    MessageBox("Max loss a day reached", "Warning");
    return -1;
  }

  if(reached_value_trade_day){
    MessageBox("Max loss value a day reached", "Warning");
    return -1;
  }

  int ordernum=0;
  if (tradeTypeOP == OP_BUY) {
    ordernum = OrderSend(Symbol(), tradeTypeOP, la, Ask, 0, stoplossFunc("buy"),takeprofitFunc("buy"), string(note_inc_trade), mn_buy, 0);
    if (ordernum > 0) {
      PlaySound("ok.wav");

      if(ObjectGetInteger(0,Name+"btn_piramid", OBJPROP_STATE)){
        proses_piramid(0, la, Ask, note_inc_trade);
      }
      
      if(ObjectGetInteger(0,Name+"btn_pending", OBJPROP_STATE)){
        proses_pending(0, Ask, note_inc_trade, la);
      }
      
      note_inc_trade++;
      GlobalVariableSet(Name+_Symbol+"_note_inc_trade", note_inc_trade);
    }

  } else if (tradeTypeOP == OP_SELL) {
    ordernum =
        OrderSend(Symbol(), tradeTypeOP, la, Bid, 0, stoplossFunc("sell"),takeprofitFunc("sell"), string(note_inc_trade), mn_sell, 0);
    if (ordernum > 0) {
      PlaySound("ok.wav");

      if(ObjectGetInteger(0,Name+"btn_pending", OBJPROP_STATE)){
        proses_pending(1, Bid, note_inc_trade, la);
      }

      if(ObjectGetInteger(0,Name+"btn_piramid", OBJPROP_STATE)){
        proses_piramid(1, la, Bid, note_inc_trade);
      }

      note_inc_trade++;
      GlobalVariableSet(Name+_Symbol+"_note_inc_trade", note_inc_trade);
    }

  } else if (tradeTypeOP == OP_BUYSTOP) {
    ordernum = OrderSend(Symbol(), tradeTypeOP, la, buystop, 0,stoplossFunc("buystop"), takeprofitFunc("buystop"),string(note_inc_trade), mn_buy, 0);
    if (ordernum > 0) {
      PlaySound("ok.wav");

      if(ObjectGetInteger(0,Name+"btn_piramid", OBJPROP_STATE)){
        proses_piramid(4, la, buystop, note_inc_trade);
      }

      note_inc_trade++;
      GlobalVariableSet(Name+_Symbol+"_note_inc_trade", note_inc_trade);
    }

  } else if (tradeTypeOP == OP_SELLSTOP) {
    ordernum = OrderSend(Symbol(), tradeTypeOP, la, sellstop, 0,stoplossFunc("sellstop"), takeprofitFunc("sellstop"),string(note_inc_trade), mn_sell, 0);
    if (ordernum > 0) {
      PlaySound("ok.wav");

      if(ObjectGetInteger(0,Name+"btn_piramid", OBJPROP_STATE)){
        proses_piramid(5, la, sellstop, note_inc_trade);
      }

      note_inc_trade++;
      GlobalVariableSet(Name+_Symbol+"_note_inc_trade", note_inc_trade);
    }
  }
  return (ordernum);
}

void closeAll(int tradeTypeOP, int mgno) {
  int MaxTries = 4;
  for (int i = OrdersTotal() - 1; i >= 0; i--) {
    // if (!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) continue;
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      if (OrderMagicNumber() == mgno && (OrderSymbol() == Symbol()) &&
          OrderType() == tradeTypeOP) {
        int try = 1;
        while (true) {
          // Alert(tradeTypeOP," ",OrderType());
          if (tradeTypeOP == OP_BUY || tradeTypeOP == OP_SELL) {
            Comment("Closing order " + string(OrderTicket()) + " attempt #" +
                    string(try) + "...");
            bool cnum = OrderClose(OrderTicket(), OrderLots(),
                                   MarketInfo(OrderSymbol(), MODE_BID), 10);
            if (cnum == true) {
              PlaySound("ok");
            }
          }
          if (tradeTypeOP != OP_BUY && tradeTypeOP != OP_SELL) {
            Comment("Closing order " + string(OrderTicket()) + " attempt #" +
                    string(try) + "...");
            bool result = OrderDelete(OrderTicket());
            if (result) {
              i++;
              PlaySound("ok");
            }
          }
          if (GetLastError() == 0)
            break;
          try++;
          if (try > MaxTries)
            break;
          RefreshRates();
        }
      }
    }
  }
}

void closeAll(int mgno) {
  int MaxTries = 4;
  for (int i = OrdersTotal() - 1; i >= 0; i--) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      if (OrderMagicNumber() == mgno && (OrderSymbol() == Symbol())) {
        int try = 1;
        while (true) {
          Comment("Closing order " + string(OrderTicket()) + " attempt #" +
                  string(try) + "...");
          if (OrderType() == OP_BUY && OrderMagicNumber() == mgno) {
            bool cnum = OrderClose(OrderTicket(), OrderLots(),
                                   MarketInfo(OrderSymbol(), MODE_BID), 10);
            if (cnum) {
              PlaySound("ok");
            }
          } else if (OrderType() == OP_SELL && OrderMagicNumber() == mgno) {
            bool cnum = OrderClose(OrderTicket(), OrderLots(),
                                   MarketInfo(OrderSymbol(), MODE_ASK), 10);
            if (cnum) {
              PlaySound("ok");
            }
          } else if (OrderType() != OP_BUY && OrderType() != OP_SELL &&
                     OrderMagicNumber() == mgno) {
            bool result = OrderDelete(OrderTicket());
            if (result) {
              i++;
              PlaySound("ok");
            }
          }
          if (GetLastError() == 0)
            break;
          try++;
          Sleep(1000);
          if (try > MaxTries)
            break;
          RefreshRates();
        }
      }
    }
  }
}

void straddle(int mgno) // moves side to side trailing no matter the direction
                        // ensuring the gap is constant no matter what.
{}

void trail(int mgno) {
  if(!ObjectGetInteger(0, Name+"trail_trade", OBJPROP_STATE))return;

  RefreshRates();
  double bid = MarketInfo(OrderSymbol(), MODE_BID);
  double ask = MarketInfo(OrderSymbol(), MODE_ASK);
  // double        initSL;
  bool result;

  int t = OrdersTotal();
  for (int i = 0; i < OrdersTotal(); i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      if (OrderType() == OP_BUY && OrderMagicNumber() == mgno &&
          ask > OrderOpenPrice() + pn_trailing * point &&
          ask - OrderOpenPrice() > pn_trailing * point &&
          ask - pn_trailing * point > OrderStopLoss()
          // OrderStopLoss()<OrderOpenPrice())
      ) {
        // initSL =
        result = OrderModify(OrderTicket(), OrderOpenPrice(),
                             ask - pn_trailing * point, OrderTakeProfit(), 0,
                             CLR_NONE);
        if (result == true) {
          Print("Trail ", OrderSymbol(), " ticket no ", OrderTicket());
          PlaySound("stops.wav");
        }
        if (!result) {
          int err = GetLastError();
          Print("Trail ", OrderSymbol(), " ticket no ", OrderTicket(),
                " failed with error (", err, "): ");
        }
      }

      if (OrderType() == OP_SELL && OrderMagicNumber() == mgno &&
          bid < OrderOpenPrice() -
                    pn_trailing *
                        point && // has moved at least the tail pips in favour
          OrderOpenPrice() - bid >
              pn_trailing *
                  point // price keeps on going in profit beyond trail pips
          // OrderStopLoss()>OrderOpenPrice())
      ) {
        if (OrderStopLoss() == 0) {
          result = OrderModify(OrderTicket(), OrderOpenPrice(),
                               bid + pn_trailing * point, OrderTakeProfit(), 0,
                               CLR_NONE);
          if (result == true) {
            Print("Trail ", OrderSymbol(), " ticket no ", OrderTicket());
            PlaySound("stops.wav");
          }
          if (!result) {
            int err = GetLastError();
            Print("Trailing ", OrderSymbol(), " ticket no ", OrderTicket(),
                  " failed with error (", err, "): ");
            Print("Stoploss ", bid + pn_trailing * point, " takeprofit ",
                  OrderTakeProfit());
          }
        }
        if ((bid + pn_trailing * point < OrderStopLoss())) {
          result = OrderModify(OrderTicket(), OrderOpenPrice(),
                               bid + pn_trailing * point, OrderTakeProfit(), 0,
                               CLR_NONE);
          if (result == true) {
            Print("Trailing ", OrderSymbol(), " ticket no ", OrderTicket());
            PlaySound("stops.wav");
          }
          if (!result) {
            int err = GetLastError();
            Print("Trailing ", OrderSymbol(), " ticket no ", OrderTicket(),
                  " failed with error (", err, "): ");
            Print("Stoploss ", bid + pn_trailing * point, " takeprofit ",
                  OrderTakeProfit());
          }
        }
      }
    }
  }
}
///////////////////////------------------------
string btn_text;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,         // Event ID
                  const long &lparam,   // Parameter of type long event
                  const double &dparam, // Parameter of type double event
                  const string &sparam  // Parameter of type string events
) {
  if(id == CHARTEVENT_OBJECT_CLICK){
    bool block_state = ObjectGetInteger(0, Name+"block", OBJPROP_STATE);
    if (sparam == Name+"block") {
      if(block_state){
        ObjectSetInteger(0, sparam, OBJPROP_BGCOLOR, clrRed);
        ObjectSetString(0, sparam, OBJPROP_TEXT, "Block ON");
      }else
      if(!block_state){
        ObjectSetInteger(0, sparam, OBJPROP_BGCOLOR, clrLightGreen);
        ObjectSetString(0, sparam, OBJPROP_TEXT, "Block OFF");
      }
    }

    if (sparam == Name+"btn_sell") {
      if(!block_state){
        RefreshRates();
        updateParameters();
        placeOrder(OP_SELL);
      }

      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }

    if (sparam == Name+"btn_buy") {
      if(!block_state){
        RefreshRates();
        updateParameters();
        placeOrder(OP_BUY);
      }

      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }

    if (sparam == Name+"btn_sellstop") {
      if(!block_state){
        RefreshRates();
        updateParameters();
        placeOrder(OP_SELLSTOP);
      }

      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }
    if (sparam == Name+"btn_buystop") {
      if(!block_state){
        RefreshRates();
        updateParameters();
        placeOrder(OP_BUYSTOP);
      }

      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }

    if (sparam == Name+"sl_trade") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"sl_trade_edit", "");

        button_sl_market(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }      
    }

    if (sparam == Name+"tp_trade") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"tp_trade_edit", "");
        
        button_tp_market(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"trail_trade") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"trail_trade_edit", Name+"trail_step_trade_edit");
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    // if ( ObjectGetInteger(0, Name+"trail_trade", OBJPROP_STATE) 
    //      || ObjectGetInteger(0, Name+"sl_trade", OBJPROP_STATE) 
    //      || ObjectGetInteger(0, Name+"tp_trade", OBJPROP_STATE)
    //    ) {
      
    //   ObjectSetInteger(0, Name+"rc activeap_b", OBJPROP_STATE, false);
    //   ObjectSetInteger(0, Name+"btn_auto_multi", OBJPROP_STATE, false);
    //   ObjectSetInteger(0, Name+"rc maxhedge_b", OBJPROP_STATE, false);
    //   ObjectSetInteger(0, Name+"btn_manual_multi", OBJPROP_STATE, false);

    //   ObjectSetInteger(0, Name+"max_hedging_multi_edit", OBJPROP_BGCOLOR, clrPink);
    //   ObjectSetInteger(0, Name+"manual_multi_edit", OBJPROP_BGCOLOR, clrPink);
    // }

    if (sparam == Name+"btn_piramid") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        // colorButtonsLive(0, sparam, clrLightGreen, clrRed);        
        // ganti_warna_edit(state, Name+"rc distpira_pts");
        // ganti_warna_edit(state, Name+"rc numpira_pts");

        onoff_property(sparam, Name+"rc distpira_pts", Name+"rc numpira_pts");
        
        piramid_monitor(state);
      }else
      {
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"sl_piramid") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"sl_piramid_edit", "");
        
        button_sl_piramid(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"tp_piramid") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"tp_piramid_edit", "");
        
        button_tp_piramid(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"trail_piramid") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"trail_piramid_edit", Name+"trail_step_piramid_edit");
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"rc distpira_b" 
    || sparam == Name+"rc numpira_b"
    || sparam == Name+"btn_multi_distance_price"
    || sparam == Name+"rc maxhedge_b"
    || sparam == Name+"base_trail_pending_pending"
    || sparam == Name+"base_trail_multi_pending"
    ) {
      ObjectSetInteger(0, sparam, OBJPROP_STATE,false);
    }

    if(sparam == Name+"btn_pending"){
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        colorButtonsLive(0, sparam, clrLightGreen, clrRed);

        pending_monitor(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }
    
    if (sparam == Name+"rc activeap_b") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        colorButtonsLive(0, sparam, clrLightGreen, clrRed);

        if (state) {
          ObjectSetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE, false);
          ObjectSetInteger(0,Name+"rc manualdist_b",OBJPROP_BGCOLOR,clrRed);
          ObjectSetInteger(0, Name+"rc manualdist_pts", OBJPROP_BGCOLOR, clrLightPink);
        
          btn_text = "Pending Number:1";
          ObjectSetString(0, Name+"Label1", OBJPROP_TEXT, btn_text);
        }else{
          ObjectSetInteger(0, Name+"rc manualdist_b", OBJPROP_STATE, true);
          ObjectSetInteger(0,Name+"rc manualdist_b",OBJPROP_BGCOLOR,clrLightGreen);
          ObjectSetInteger(0, Name+"rc manualdist_pts", OBJPROP_BGCOLOR, clrPaleTurquoise);
        }
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam ==  Name+"rc manualdist_b") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        colorButtonsLive(0, sparam, clrLightGreen, clrRed);

        if(state) {
          ObjectSetInteger(0, Name+"rc manualdist_pts", OBJPROP_BGCOLOR, clrPaleTurquoise);

          ObjectSetInteger(0, Name+"rc activeap_b", OBJPROP_STATE, false);
          ObjectSetInteger(0,Name+"rc activeap_b",OBJPROP_BGCOLOR,clrRed);
        
          btn_text = "Pending Number:1";
          ObjectSetString(0, Name+"Label1", OBJPROP_TEXT, btn_text);
        }else{
          ObjectSetInteger(0, Name+"rc manualdist_pts", OBJPROP_BGCOLOR, clrLightPink);

          ObjectSetInteger(0, Name+"rc activeap_b", OBJPROP_STATE, true);
          ObjectSetInteger(0,Name+"rc activeap_b",OBJPROP_BGCOLOR,clrLightGreen);
        }
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"sl_pending") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"sl_pending_edit", "");
        
        button_sl_pending(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"tp_pending") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"tp_pending_edit", "");
        
        button_tp_pending(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"trail_pending") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"trail_pending_edit", Name+"trail_step_pending_edit");
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"trail_pending_pending") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"trail_pending_pending_edit", Name+"trail_step_pending_pending_edit");
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if(sparam == Name+"btn_multi_pending"){
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        onoff_property(sparam, Name+"distance_price_multi_edit", Name+"max_hedging_multi_edit");
          
        multi_monitor(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }
    
    if (sparam == Name+"btn_auto_multi") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        colorButtonsLive(0, sparam, clrLightGreen, clrRed);

        if (state) {
          ObjectSetInteger(0, Name+"btn_manual_multi", OBJPROP_STATE, false);
          ObjectSetInteger(0,Name+"btn_manual_multi",OBJPROP_BGCOLOR,clrRed);
          ObjectSetInteger(0, Name+"manual_multi_edit", OBJPROP_BGCOLOR, clrPink);
        
          btn_text = "Pending Number:1";
          ObjectSetString(0, Name+"Label1", OBJPROP_TEXT, btn_text);
        }else{
          ObjectSetInteger(0, Name+"btn_manual_multi", OBJPROP_STATE, true);
          ObjectSetInteger(0,Name+"btn_manual_multi",OBJPROP_BGCOLOR,clrLightGreen);
          ObjectSetInteger(0, Name+"manual_multi_edit", OBJPROP_BGCOLOR, clrPaleTurquoise);
        }
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }
    
    if (sparam == Name+"btn_manual_multi") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        colorButtonsLive(0, sparam, clrLightGreen, clrRed);

        ganti_warna_edit(state, Name+"manual_multi_edit");

        if(state) {
          ObjectSetInteger(0, Name+"btn_auto_multi", OBJPROP_STATE, false);
          ObjectSetInteger(0,Name+"btn_auto_multi",OBJPROP_BGCOLOR,clrRed);
        }else{
          ObjectSetInteger(0, Name+"btn_auto_multi", OBJPROP_STATE, true);
          ObjectSetInteger(0,Name+"btn_auto_multi",OBJPROP_BGCOLOR,clrLightGreen);
        }
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"sl_multi") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"sl_multi_edit", "");
        
        button_sl_multi(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"tp_multi") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"tp_multi_edit", "");
        
        button_tp_multi(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"trail_multi") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"trail_multi_edit", Name+"trail_step_multi_edit");
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    if (sparam == Name+"trail_multi_pending") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
      if(!block_state){
        onoff_property(sparam, Name+"trail_multi_pending_edit", Name+"trail_step_multi_pending_edit");
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }
    
    if (sparam == Name+"rc closesell_b") {
      if(!block_state){
        close_trades(2);
        Sleep(100);
      }
      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }

    if (sparam == Name+"rc closebuy_b") {
      if(!block_state){
        close_trades(1);        
        Sleep(100);
      }      
      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }

    if (sparam == Name+"rc closeall_b") {
      if(!block_state){
        close_trades(0);        
        Sleep(100);
      }      
      ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
    }

    if (sparam == Name+"btn_ea") {
      bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);      
      if(!block_state){
        colorButtonsLive(0, sparam, clrLightGreen, clrRed);
        
        ea_process(state);
      }else{
        ObjectSetInteger(0, sparam, OBJPROP_STATE, !state);
      }
    }

    ChartRedraw();
  }
}

void onoff_property(string sparam, string edit1, string edit2){
  bool state = ObjectGetInteger(0, sparam, OBJPROP_STATE);
  
  colorButtonsLive(0, sparam, clrLightGreen, clrRed);
  
  if(edit1 != ""){
    ganti_warna_edit(state, edit1);
  }

  if(edit2 != ""){
    ganti_warna_edit(state, edit2);
  }
}

bool ButtonCreate(const long chart_ID = 0,      // ID ãðàôèêà
                  const string name = "Button", // èìÿ êíîïêè
                  const int sub_window = 0,     // íîìåð ïîäîêíà
                  const long x = 0,      // êîîðäèíàòà ïî îñè X
                  const long y = 0,      // êîîðäèíàòà ïî îñè Y
                  const int width = 50,  // øèðèíà êíîïêè
                  const int height = 18, // âûñîòà êíîïêè
                  const string text = "Button",     // òåêñò
                  const string font = "Arial",      // øðèôò
                  const int font_size = 8,          // ðàçìåð øðèôòà
                  const color clr = clrBlack,       // öâåò òåêñòà
                  const color clrON = clrLightGray, // öâåò ôîíà
                  const color clrOFF = clrLightGray, // öâåò ôîíà
                  const color border_clr = clrNONE,  // öâåò ãðàíèöû
                  // const color             back_clr=clrNONE,// öâåò ãðàíèöû
                  const bool state = false, //
                  const ENUM_BASE_CORNER CORNER = CORNER_LEFT_UPPER) {
  if (ObjectFind(chart_ID, name) == -1) {
    ObjectCreate(chart_ID, name, OBJ_BUTTON, sub_window, 0, 0);
    ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
    ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
    ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, CORNER);
    ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
    ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
    ObjectSetInteger(chart_ID, name, OBJPROP_BACK, 0);
    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, 0);
    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, 0);
    ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, 1);
    ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, 1);
    ObjectSetInteger(chart_ID, name, OBJPROP_STATE, state);
  }
  ObjectSetInteger(chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
  color back_clr;
  if (ObjectGetInteger(chart_ID, name, OBJPROP_STATE, true)) {
    back_clr = clrON;
  } else {
    back_clr = clrOFF;
  }
  ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
  ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
  ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
  ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
  ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
  return (true);
}

bool RectLabelCreate(
    const long chart_ID = 0,         // ID ãðàôèêà
    const string name = "RectLabel", // èìÿ ìåòêè
    const int sub_window = 0,        // íîìåð ïîäîêíà
    const long x = 0,                // êîîðäèíàòà ïî îñè X
    const long y = 0,                // êîîðäèíàòà ïî îñè y
    const int width = 50,            // øèðèíà
    const int height = 18,           // âûñîòà
    const color back_clr = clrWhite, // öâåò ôîíà
    const color clr = clrBlack, // öâåò ïëîñêîé ãðàíèöû (Flat)
    const ENUM_LINE_STYLE style = STYLE_SOLID, // ñòèëü ïëîñêîé ãðàíèöû
    const int line_width = 1, // òîëùèíà ïëîñêîé ãðàíèöû
    const bool back = false,  // íà çàäíåì ïëàíå
    const bool selection = false, // âûäåëèòü äëÿ ïåðåìåùåíèé
    const bool hidden = true,     // ñêðûò â ñïèñêå îáúåêòîâ
    const long z_order = 0) // ïðèîðèòåò íà íàæàòèå ìûøüþ
{
  ResetLastError();
  if (ObjectFind(chart_ID, name) == -1) {
    ObjectCreate(chart_ID, name, OBJ_RECTANGLE_LABEL, sub_window, 0, 0);
    ObjectSetInteger(chart_ID, name, OBJPROP_BORDER_TYPE, BORDER_FLAT);
    ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
    ObjectSetInteger(chart_ID, name, OBJPROP_STYLE, style);
    ObjectSetInteger(chart_ID, name, OBJPROP_WIDTH, line_width);
    ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
    ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
    ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
    // ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,ALIGN_RIGHT);
  }
  ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
  ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
  ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
  ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
  ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
  ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
  return (true);
}

string Error(int code) {
  switch (code) {
  case 0:
    return ("Íåò îøèáîê");
  case 1:
    return ("Íåò îøèáêè, íî ðåçóëüòàò íåèçâåñòåí");
  case 2:
    return ("Îáùàÿ îøèáêà");
  case 3:
    return ("Íåïðàâèëüíûå ïàðàìåòðû");
  case 4:
    return ("Òîðãîâûé ñåðâåð çàíÿò");
  case 5:
    return ("Ñòàðàÿ âåðñèÿ êëèåíòñêîãî òåðìèíàëà");
  case 6:
    return ("Íåò ñâÿçè ñ òîðãîâûì ñåðâåðîì");
  case 7:
    return ("Íåäîñòàòî÷íî ïðàâ");
  case 8:
    return ("Ñëèøêîì ÷àñòûå çàïðîñû");
  case 9:
    return ("Íåäîïóñòèìàÿ îïåðàöèÿ íàðóøàþùàÿ ôóíêöèîíèðîâàíèå ñåðâåðà");
  case 64:
    return ("Ñ÷åò çàáëîêèðîâàí");
  case 65:
    return ("Íåïðàâèëüíûé íîìåð ñ÷åòà");
  case 128:
    return ("Èñòåê ñðîê îæèäàíèÿ ñîâåðøåíèÿ ñäåëêè");
  case 129:
    return ("Íåïðàâèëüíàÿ öåíà");
  case 130:
    return ("Íåïðàâèëüíûå ñòîïû");
  case 131:
    return ("Íåïðàâèëüíûé îáúåì");
  case 132:
    return ("Ðûíîê çàêðûò");
  case 133:
    return ("Òîðãîâëÿ çàïðåùåíà");
  case 134:
    return ("Íåäîñòàòî÷íî äåíåã äëÿ ñîâåðøåíèÿ îïåðàöèè");
  case 135:
    return ("Öåíà èçìåíèëàñü");
  case 136:
    return ("Íåò öåí");
  case 137:
    return ("Áðîêåð çàíÿò");
  case 138:
    return ("Íîâûå öåíû");
  case 139:
    return ("Îðäåð çàáëîêèðîâàí è óæå îáðàáàòûâàåòñÿ");
  case 140:
    return ("Ðàçðåøåíà òîëüêî ïîêóïêà");
  case 141:
    return ("Ñëèøêîì ìíîãî çàïðîñîâ");
  case 145:
    return ("Ìîäèôèêàöèÿ çàïðåùåíà, òàê êàê îðäåð ñëèøêîì áëèçîê ê ðûíêó");
  case 146:
    return ("Ïîäñèñòåìà òîðãîâëè çàíÿòà");
  case 147:
    return ("Èñïîëüçîâàíèå äàòû èñòå÷åíèÿ îðäåðà çàïðåùåíî áðîêåðîì");
  case 148:
    return ("Êîëè÷åñòâî îòêðûòûõ è îòëîæåííûõ îðäåðîâ äîñòèãëî ïðåäåëà, "
            "óñòàíîâëåííîãî áðîêåðîì.");
  default:
    return (StringConcatenate("Îøèáêà ", code, " íåèçâåñòíà "));
  }
}

bool EditCreate(
    const long chart_ID = 0,     // ID ãðàôèêà
    const string name = "Edit",  // èìÿ îáúåêòà
    const int sub_window = 0,    // íîìåð ïîäîêíà
    const int x = 0,             // êîîðäèíàòà ïî îñè X
    const int y = 0,             // êîîðäèíàòà ïî îñè Y
    const int width = 50,        // øèðèíà
    const int height = 18,       // âûñîòà
    const string text = "Text",  // òåêñò
    const string font = "Arial", // øðèôò
    const int font_size = 8,     // ðàçìåð øðèôòà
    const ENUM_ALIGN_MODE align = ALIGN_RIGHT, // ñïîñîá âûðàâíèâàíèÿ
    const bool read_only = true, // âîçìîæíîñòü ðåäàêòèðîâàòü
    const ENUM_BASE_CORNER corner =
        CORNER_LEFT_UPPER, // óãîë ãðàôèêà äëÿ ïðèâÿçêè
    const color clr = clrBlack,       // öâåò òåêñòà
    const color back_clr = clrWhite,  // öâåò ôîíà
    const color border_clr = clrNONE, // öâåò ãðàíèöû
    const bool back = false,          // íà çàäíåì ïëàíå
    const bool selection = false, // âûäåëèòü äëÿ ïåðåìåùåíèé
    const bool hidden = true,     // ñêðûò â ñïèñêå îáúåêòîâ
    const long z_order = 0) // ïðèîðèòåò íà íàæàòèå ìûøüþ
{
  ResetLastError();
  if (!ObjectCreate(chart_ID, name, OBJ_EDIT, sub_window, 0, 0)) {
    if (GetLastError() != 4200) {
      Print(__FUNCTION__, ": Created ", name, "! Object = ", GetLastError());
    }
    return (false);
  }
  ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
  ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
  ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
  ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
  ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
  ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
  ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
  ObjectSetInteger(chart_ID, name, OBJPROP_ALIGN, align);
  ObjectSetInteger(chart_ID, name, OBJPROP_READONLY, read_only);
  ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
  ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
  ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
  ObjectSetInteger(chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
  ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
  ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
  ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
  ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
  ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
  return (true);
}

bool EditTextGet(string &text,               // text
                 const long chart_ID = 0,    // chart's ID
                 const string name = "Edit") // object name
{
  //--- reset the error value
  ResetLastError();
  //--- get object text
  if (!ObjectGetString(chart_ID, name, OBJPROP_TEXT, 0, text)) {
    if (GetLastError() != 4200) {
      Print(__FUNCTION__,
            ": failed to get the text! Error code = ", GetLastError());
    }
    return (false);
  }
  //--- successful execution
  return (true);
}

string Text(bool P, string a, string b) {
  if (P)
    return (a);
  else
    return (b);
}

void drawtext(string Namex, datetime T1, double Y1, string lt, color cc) {
  ObjectDelete(Namex);
  ObjectCreate(Namex, OBJ_TEXT, 0, T1, Y1, 0, 0, 0, 0);
  ObjectSetText(Namex, lt, 8, "Arial");
  ObjectSetInteger(0, Namex, OBJPROP_COLOR, cc);
  ObjectSetInteger(0, Namex, OBJPROP_ANCHOR, ANCHOR_LOWER);
}

bool EditMove(const long chart_ID = 0,    // chart's ID
              const string name = "Edit", // object name
              const int x = 0,            // X coordinate
              const int y = 0)            // Y coordinate
{
  //--- reset the error value
  ResetLastError();
  //--- move the object
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x)) {
    Print(__FUNCTION__,
          ": failed to move X coordinate of the object! Error code = ",
          GetLastError());
    return (false);
  }
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y)) {
    Print(__FUNCTION__,
          ": failed to move Y coordinate of the object! Error code = ",
          GetLastError());
    return (false);
  }
  //--- successful execution
  return (true);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonMove(const long chart_ID = 0,      // chart's ID
                const string name = "Button", // button name
                const int x = 0,              // X coordinate
                const int y = 0)              // Y coordinate
{
  //--- reset the error value
  ResetLastError();
  //--- move the button
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x)) {
    Print(__FUNCTION__,
          ": failed to move X coordinate of the button! Error code = ",
          GetLastError());
    return (false);
  }
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y)) {
    Print(__FUNCTION__,
          ": failed to move Y coordinate of the button! Error code = ",
          GetLastError());
    return (false);
  }
  //--- successful execution
  return (true);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool LabelMove(const long chart_ID = 0,     // chart's ID
               const string name = "Label", // label name
               const int x = 0,             // X coordinate
               const int y = 0)             // Y coordinate
{
  //--- reset the error value
  ResetLastError();
  //--- move the text label
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x)) {
    Print(__FUNCTION__,
          ": failed to move X coordinate of the label! Error code = ",
          GetLastError());
    return (false);
  }
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y)) {
    Print(__FUNCTION__,
          ": failed to move Y coordinate of the label! Error code = ",
          GetLastError());
    return (false);
  }
  //--- successful execution
  return (true);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool RectLabelMove(const long chart_ID = 0,         // chart's ID
                   const string name = "RectLabel", // label name
                   const int x = 0,                 // X coordinate
                   const int y = 0)                 // Y coordinate
{
  //--- reset the error value
  ResetLastError();
  //--- move the rectangle label
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x)) {
    Print(__FUNCTION__,
          ": failed to move X coordinate of the label! Error code = ",
          GetLastError());
    return (false);
  }
  if (!ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y)) {
    Print(__FUNCTION__,
          ": failed to move Y coordinate of the label! Error code = ",
          GetLastError());
    return (false);
  }
  //--- successful execution
  return (true);
}

//+------------------------------------------------------------------+

bool LabelCreate(
    const long chart_ID = 0,     // chart's ID
    const string name = "Label", // label name
    const int sub_window = 0,    // subwindow index
    const int x = 0,             // X coordinate
    const int y = 0,             // Y coordinate
    const ENUM_BASE_CORNER corner =
        CORNER_LEFT_UPPER,            // chart corner for anchoring
    const string text = "Text",       // text
    const string font = "Arial",      // font
    const int font_size = 12,         // font size
    const color clr = clrYellowGreen, // color
    const double angle = 0.0,         // text slope
    const ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT_UPPER, // anchor type
    const bool back = false,                            // in the background
    const bool selection = false,                       // highlight to move
    const bool hidden = true, // hidden in the object list
    const long z_order = 0)   // priority for mouse click
{
  //--- reset the error value
  ResetLastError();
  //--- create a text label
  if (!ObjectCreate(chart_ID, name, OBJ_LABEL, sub_window, 0, 0)) {
    Print(__FUNCTION__,
          ": failed to create text label! Error code = ", GetLastError());
    return (false);
  }
  //--- set label coordinates
  ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
  ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
  //--- set the chart's corner, relative to which point coordinates are defined
  ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
  //--- set the text
  ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
  //--- set text font
  ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
  //--- set font size
  ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
  //--- set the slope angle of the text
  ObjectSetDouble(chart_ID, name, OBJPROP_ANGLE, angle);
  //--- set anchor type
  ObjectSetInteger(chart_ID, name, OBJPROP_ANCHOR, anchor);
  //--- set color
  ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
  //--- display in the foreground (false) or background (true)
  ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
  //--- enable (true) or disable (false) the mode of moving the label by mouse
  ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
  ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
  //--- hide (true) or display (false) graphical object name in the object list
  ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
  //--- set the priority for receiving the event of a mouse click in the chart
  ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
  //--- successful execution
  return (true);
}

bool LabelTextChange(const long chart_ID = 0,     // chart's ID
                     const string name = "Label", // object name
                     const string text = "Text")  // text
{
  //--- reset the error value
  ResetLastError();
  //--- change object text
  if (!ObjectSetString(chart_ID, name, OBJPROP_TEXT, text)) {
    Print(__FUNCTION__,
          ": failed to change the text! Error code = ", GetLastError());
    return (false);
  }
  //--- successful execution
  return (true);
}
//+------------------------------------------------------------------+
//| Delete a text label                                              |
//+------------------------------------------------------------------+
bool LabelDelete(const long chart_ID = 0,     // chart's ID
                 const string name = "Label") // label name
{
  //--- reset the error value
  ResetLastError();
  //--- delete the label
  if (!ObjectDelete(chart_ID, name)) {
    Print(__FUNCTION__,
          ": failed to delete a text label! Error code = ", GetLastError());
    return (false);
  }
  //--- successful execution
  return (true);
}

// -------------------------------

double pointnum_to_pointdec(uint Fpointnum, double Fpointnya){double hasil=Fpointnum*Fpointnya;return(hasil);}
double pointdec_to_pointnum(double Fpointdec, double Fpointpair){double hasil=(int)MathRound(Fpointdec/Fpointpair);return(hasil);}

void stay_on_top(){
  int jml = ObjectsTotal(0,0, OBJ_TEXT);
  string vs;

  for(int i=0;i<jml;i++){
    
    vs = ObjectName(0,i,0);
    
    if(StringFind(vs,Name)<0){
      if(!ObjectGetInteger(0,vs,OBJPROP_BACK)){
        ObjectSetInteger(0,vs,OBJPROP_BACK,true);
      }      
    }
  }
}

int 
  jml_total, 
  jml_buy, jml_sell,   
  jml_piramid_buy, jml_piramid_sell,
  jml_pending_buy, jml_pending_sell, 
  jml_multi_buy, jml_multi_sell
  ;
double total_profit;
void cek_transaksi(){
  int total=OrdersTotal();
  
  jml_total = 0;
  jml_buy = 0;
  jml_sell = 0;
  
  jml_piramid_buy = 0;
  jml_piramid_sell = 0;

  jml_pending_buy = 0;
  jml_pending_sell = 0;

  jml_multi_buy = 0;
  jml_multi_sell = 0;  

  total_profit = 0;

  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol){
      jml_total++;
      
      if(OrderType()<2){
        if(OrderType()==0){
          jml_buy++;
        }else
        if(OrderType()==1){
          jml_sell++;
        }

        total_profit += OrderProfit() + OrderSwap() + OrderCommission();
      }else
      if(OrderType()>=2){
        if(OrderType()==2 || OrderType()==4){
          if(OrderMagicNumber()==mn_pend){
            jml_pending_buy++;
          }else
          if(OrderMagicNumber()==mn_pira){
            jml_piramid_buy++;
          }
        }else
        if(OrderType()==3 || OrderType()==5){
          if(OrderMagicNumber()==mn_pend){
            jml_pending_sell++;
          }else
          if(OrderMagicNumber()==mn_pira){
            jml_piramid_sell++;
          }
        }
      }
			
			if(OrderMagicNumber()==mn_multi){
			  if(OrderType()==0 || OrderType()==2 || OrderType()==4){
	        jml_multi_buy++;
	      }
	      if(OrderType()==1 || OrderType()==3 || OrderType()==5){
	        jml_multi_sell++;
	      }
			}
    }      
  }
}

void close_trades(int tipe){//0=all, 1=buy, 2=sell
  cek_transaksi();
  if(jml_total<1)return;

  int jum=0;
  if(tipe==0){
    jum = jml_total;
  }else
  if(tipe==1){
    jum = jml_buy+jml_pending_buy;
  }
  if(tipe==2){
    jum = jml_sell+jml_pending_sell;
  }
  bool lanjut=true;
  do{
    for(int i=0;i<OrdersTotal();i++){
      if(OrderSelect(i,SELECT_BY_POS)==false)continue;

      if(OrderSymbol()==_Symbol){
        if(tipe==0){//all
          if(OrderType()<2)
            if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),100)){}
      
          if(OrderType()>1)
            if(OrderDelete(OrderTicket())){}
        }else
        if(tipe==1){//buy
          if(OrderType()==0)
            if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),100)){}
      
          if(OrderType()==2 || OrderType()==4)
            if(OrderDelete(OrderTicket())){}
        }
        if(tipe==2){//sell
          if(OrderType()==1)
            if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),100)){}
      
          if(OrderType()==3 || OrderType()==5)
            if(OrderDelete(OrderTicket())){}
        }  
        Sleep(200);
      }
    }

    cek_transaksi();
    if(tipe==0){
      jum = jml_total;
    }else
    if(tipe==1){
      jum = jml_buy+jml_pending_buy;
    }
    if(tipe==2){
      jum = jml_sell+jml_pending_sell;
    }

    if(jum<1){
      lanjut = false;
    }
  }while(lanjut);
  
  // printf("Proses selesai");
}

void proses_pending(int tipe, double price, int note, double lot){
  // Print("proses pending");

  int jarak_price=0;
  if(ObjectGetInteger(0,Name+"rc activeap_b", OBJPROP_STATE)){
    jarak_price = hitung_zigzag_auto_contrarian();
  }else
  if(ObjectGetInteger(0,Name+"rc manualdist_b", OBJPROP_STATE)){
    jarak_price = (int)ObjectGetString(0,Name+"rc manualdist_pts", OBJPROP_TEXT);    
  }

  if(tipe==0){
    _trade_trade = 5;
    _price_trade = price - pointnum_to_pointdec(jarak_price, Point);
    _lot_trade = lot;
    _magic_trade = mn_pend;
    _note_trade = string(note);
    
    _sl_trade = 0;
    if(ObjectGetInteger(0,Name+"sl_pending",OBJPROP_STATE)){
      _sl_trade = _price_trade + pointnum_to_pointdec((int)ObjectGetString(0,Name+"sl_pending_edit",OBJPROP_TEXT), Point); 
    }
    
    _tp_trade = 0;
    if(ObjectGetInteger(0,Name+"tp_pending",OBJPROP_STATE)){
      _tp_trade = _price_trade - pointnum_to_pointdec((int)ObjectGetString(0,Name+"tp_pending_edit",OBJPROP_TEXT), Point); 
    }
    if(trade_execute()){}
    Sleep(200);

  }else
  if(tipe==1){
    _trade_trade = 4;
    _price_trade = price + pointnum_to_pointdec(jarak_price, Point);
    _lot_trade = lot;
    _magic_trade = mn_pend;
    _note_trade = string(note);
    
    _sl_trade = 0;
    if(ObjectGetInteger(0,Name+"sl_pending",OBJPROP_STATE)){
      _sl_trade = _price_trade - pointnum_to_pointdec((int)ObjectGetString(0,Name+"sl_pending_edit",OBJPROP_TEXT), Point); 
    }
    
    _tp_trade = 0;
    if(ObjectGetInteger(0,Name+"tp_pending",OBJPROP_STATE)){
      _tp_trade = _price_trade + pointnum_to_pointdec((int)ObjectGetString(0,Name+"tp_pending_edit",OBJPROP_TEXT), Point); 
    }
    if(trade_execute()){}
    Sleep(200);      
  }
}

void proses_piramid(int tipe, double lot, double price, int note){
  // Print("proses piramid");

  int jarak = (int)ObjectGetString(0,Name+"rc distpira_pts",OBJPROP_TEXT);
  int level = (int)ObjectGetString(0,Name+"rc numpira_pts",OBJPROP_TEXT);

  if(jarak==0)return;
  if(level==0)return;

  int magicx = mn_pira;
  int jsl=0;
  int jtp=0;

  if(ObjectGetInteger(0,Name+"sl_piramid",OBJPROP_STATE)){
    jsl = (int)ObjectGetString(0,Name+"sl_piramid_edit",OBJPROP_TEXT);
  }
  if(ObjectGetInteger(0,Name+"tp_piramid",OBJPROP_STATE)){
    jtp = (int)ObjectGetString(0,Name+"tp_piramid_edit",OBJPROP_TEXT);
  }

  if(tipe==0 || tipe==4){
    double next_price=price;
    for(int i=0;i<level;i++){
      _trade_trade = 4;
      next_price += pointnum_to_pointdec(jarak, Point);
      _price_trade = next_price;
      _lot_trade = lot;
      _magic_trade = magicx;
      _note_trade = string(note);
      
      _sl_trade = 0;
      if(jsl>0){
        _sl_trade = _price_trade - pointnum_to_pointdec(jsl, Point); 
      }
      
      _tp_trade = 0;
      if(jtp>0){
        _tp_trade = _price_trade + pointnum_to_pointdec(jtp, Point); 
      }
      if(trade_execute()){}
      Sleep(200);
    }
  }else
  if(tipe==1 || tipe==5){
    double next_price=price;
    for(int i=0;i<level;i++){
      _trade_trade = 5;
      next_price -= pointnum_to_pointdec(jarak, Point);
      _price_trade = next_price;
      _lot_trade = lot;
      _magic_trade = magicx;
      _note_trade = string(note);
      
      _sl_trade = 0;
      if(jsl>0){
        _sl_trade = _price_trade + pointnum_to_pointdec(jsl, Point); 
      }
      
      _tp_trade = 0;
      if(jtp>0){
        _tp_trade = _price_trade - pointnum_to_pointdec(jtp, Point); 
      }
      if(trade_execute()){}
      Sleep(200);
    }
  }
}


string _pair_trade;
int _trade_trade;    
double _lot_trade;
double _sl_trade;
double _tp_trade;
double _price_trade;
double _openprice_trade;
double _closeprice_trade;
int _magic_trade;
int _slip_trade=0;
string _note_trade;
datetime _expired_trade;
int _tiket_trade;
color _warna;
string _jika_error;
bool trade_execute(){
  bool hasil=false;
  
  if(_trade_trade==0){
    _price_trade = Ask;
  }else
  if(_trade_trade==1){
    _price_trade = Bid;
  }

  if(_trade_trade==0 || _trade_trade==2 || _trade_trade==4)_warna = clrBlue; else _warna = clrRed;
  
  if(IsTradeContextBusy()){do{Sleep(1000);}while(IsTradeContextBusy());}
  
  _tiket_trade = OrderSend(_pair_trade,_trade_trade,_lot_trade,_price_trade,_slip_trade,_sl_trade,_tp_trade,_note_trade,_magic_trade,_expired_trade,_warna);
  
  if(_tiket_trade>=0){
    hasil=true;
  }else{
    Print(_jika_error+" #",GetLastError());
  } 
  
  return(hasil);
}

bool apakah_trade_utama_ada(int xnote){
  bool hasil = false;

  int total=OrdersTotal();
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if( OrderSymbol()==_Symbol 
        && OrderComment()==string(xnote) 
        && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)){
      
      hasil = true;

    }
  }

  return hasil;
}

void trade_utama_monitor(){
  if(jml_pending_buy>0 || jml_pending_sell>0 || jml_piramid_buy>0 || jml_piramid_sell>0){
    int total=OrdersTotal();

    int jmlx=0;
    int daftar_hapus[];
    int xnote;
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol && OrderType()>1){
        xnote = (int)OrderComment();

        if(!apakah_trade_utama_ada(xnote)){
          jmlx++;
          ArrayResize(daftar_hapus, jmlx);
          daftar_hapus[jmlx-1] = xnote;
        }
      }
    }

    if(jmlx>0){
      bool lanjut;
      int jml_cek;
      for(int j=0;j<jmlx;j++){
        lanjut = true;
        do{
          for(int i=0;i<OrdersTotal();i++){
            if(OrderSelect(i,SELECT_BY_POS)==false)continue;
            if(OrderSymbol()==_Symbol && OrderComment()==string(daftar_hapus[j]) && OrderType()>1){
              _tiket_hapus = OrderTicket();
              if(hapus_execute()){}
              Sleep(200);
            }
          }

          jml_cek=0;
          for(int i=0;i<OrdersTotal();i++){
            if(OrderSelect(i,SELECT_BY_POS)==false)continue;
            if(OrderSymbol()==_Symbol && OrderComment()==string(daftar_hapus[j]) && OrderType()>1){
              jml_cek++;
            }
          }

          if(jml_cek==0){
            lanjut = false;
          }
        }while(lanjut);
      }
    }
  }
}

int _tiket_hapus;
bool hapus_execute(){
  if(IsTradeContextBusy()){do{Sleep(1000);}while(IsTradeContextBusy());}  
  
  _warna = clrWhite;
  bool hasil=OrderDelete(_tiket_hapus,_warna);
  
  if(!hasil)
    Print(_jika_error+" #",GetLastError());
  
  return(hasil);
}

int _tiket_modify;
double _openprice_modify;
double _sl_modify;
double _tp_modify;
int _expired_modify=0;

bool modify_execute(){
  if(IsTradeContextBusy()){do{Sleep(1000);}while(IsTradeContextBusy());}
   
   _warna =clrNONE;
   bool hasil=OrderModify(_tiket_modify,_openprice_modify,_sl_modify,_tp_modify,_expired_modify,_warna);

   if(!hasil)
      Print(_jika_error+" #",GetLastError());

   return(hasil);
}

void button_sl_market(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_sl = (int)ObjectGetString(0,Name+"sl_trade_edit", OBJPROP_TEXT);
    double hsl;

    if(jarak_sl<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)
      && OrderStopLoss()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify - pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify + pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)
      && OrderStopLoss()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();
        _sl_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_sl_piramid(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_sl = (int)ObjectGetString(0,Name+"sl_piramid_edit", OBJPROP_TEXT);
    double hsl;

    if(jarak_sl<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pira)
      && OrderStopLoss()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify - pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify + pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pira)
      && OrderStopLoss()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();
        _sl_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_sl_pending(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_sl = (int)ObjectGetString(0,Name+"sl_pending_edit", OBJPROP_TEXT);
    double hsl;

    if(jarak_sl<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pend)
      && OrderStopLoss()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify - pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify + pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pend)
      && OrderStopLoss()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();
        _sl_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_sl_multi(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_sl = (int)ObjectGetString(0,Name+"sl_multi_edit", OBJPROP_TEXT);
    double hsl;

    if(jarak_sl<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_multi)
      && OrderStopLoss()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify - pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _tp_modify = OrderTakeProfit();

          hsl = _openprice_modify + pointnum_to_pointdec(jarak_sl, Point);
          _sl_modify = NormalizeDouble(hsl, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_multi)
      && OrderStopLoss()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();
        _sl_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_tp_market(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_tp = (int)ObjectGetString(0,Name+"tp_trade_edit", OBJPROP_TEXT);
    double htp;

    if(jarak_tp<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)
      && OrderTakeProfit()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify + pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify - pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)
      && OrderTakeProfit()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _sl_modify = OrderStopLoss();
        _tp_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_tp_piramid(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_tp = (int)ObjectGetString(0,Name+"tp_piramid_edit", OBJPROP_TEXT);
    double htp;

    if(jarak_tp<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pira)
      && OrderTakeProfit()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify + pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify - pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pira)
      && OrderTakeProfit()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _sl_modify = OrderStopLoss();
        _tp_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_tp_pending(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_tp = (int)ObjectGetString(0,Name+"tp_pending_edit", OBJPROP_TEXT);
    double htp;

    if(jarak_tp<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pend)
      && OrderTakeProfit()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify + pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify - pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_pend)
      && OrderTakeProfit()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _sl_modify = OrderStopLoss();
        _tp_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void button_tp_multi(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak_tp = (int)ObjectGetString(0,Name+"tp_multi_edit", OBJPROP_TEXT);
    double htp;

    if(jarak_tp<1)return;

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_multi)
      && OrderTakeProfit()==0){
        if(OrderType()==0 || OrderType()==2 || OrderType()==4){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify + pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }else
        if(OrderType()==1 || OrderType()==3 || OrderType()==5){
          _tiket_modify = OrderTicket();
          _openprice_modify = OrderOpenPrice();
          _sl_modify = OrderStopLoss();

          htp = _openprice_modify - pointnum_to_pointdec(jarak_tp, Point);
          _tp_modify = NormalizeDouble(htp, Digits);
        }

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }else
  if(!state){
    int total=OrdersTotal();

    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_multi)
      && OrderTakeProfit()>0){
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _sl_modify = OrderStopLoss();
        _tp_modify = 0;

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

bool adakah_piramidnya(int xnote){
  bool hasil = false;
  
  int total=OrdersTotal();

  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_pira){
      hasil = true;
      break;
    }
  }

  return hasil;
}

void piramid_monitor(bool state){
  if(state){
    int total=OrdersTotal();

    int jarak  = (int)ObjectGetString(0,Name+"rc distpira_pts", OBJPROP_TEXT);
    
    int thenote,thetype;
    double thelot, theprice;

    if(jarak==0)return;

    int jmlx=0;
    int xtipe[], xnote[];
    double xlot[], xprice[];
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)){
        thenote = (int)OrderComment();
        thetype = OrderType();
        thelot = OrderLots();
        theprice = OrderOpenPrice();

        if(!adakah_piramidnya(thenote)){
          jmlx++;
          ArrayResize(xtipe, jmlx);
          ArrayResize(xlot, jmlx);
          ArrayResize(xprice, jmlx);
          ArrayResize(xnote, jmlx);

          xtipe[jmlx-1] = thetype;
          xlot[jmlx-1] = thelot;
          xprice[jmlx-1] = theprice;
          xnote[jmlx-1] = thenote;
        }
      }
    }

    if(jmlx>0){
      for(int i=0;i<jmlx;i++){
        proses_piramid(xtipe[i], xlot[i], xprice[i], xnote[i]);
      }
    }
  }else
  if(!state){
    delete_pending_by_magic(mn_pira);
  }
}

void delete_pending_by_magic(int mgx){
  int total=OrdersTotal();

  if(total==0)return;

  bool lanjut=true;
  do{
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol && OrderMagicNumber()==mgx && OrderType()>1){
        _tiket_hapus = OrderTicket();
        if(hapus_execute()){}
        Sleep(200);
      }
    }

    cek_transaksi();

    if(mgx==mn_pira){
      if(jml_piramid_buy+jml_piramid_sell<1){
        lanjut = false;
      }
    }else
    if(mgx==mn_pend){
      if(jml_pending_buy+jml_pending_sell<1){
        lanjut = false;
      }
    }
  }while(lanjut);

}

void delete_all_by_magic(int mgx){
  int total=OrdersTotal();

  if(total==0)return;

  bool lanjut=true;
  do{
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      // printf("magic: "+OrderMagicNumber());
      if(OrderSymbol()==_Symbol && OrderMagicNumber()==mgx){
        _tiket_hapus = OrderTicket();
        if(hapus_execute()){}
        Sleep(200);
      }
    }

    if(mgx==mn_multi){
      cek_transaksi();
      
      if(jml_multi_buy+jml_multi_sell<1){
        lanjut = false;
      }
    }
    
    if(mgx==mn_ea){
      hitung_trx_ea();
      
      if(jml_ea_buy_trade+jml_ea_sell_trade+jml_ea_buy_pending+jml_ea_sell_pending<1){
        lanjut = false;
      }
    }
    
  }while(lanjut);

}

bool adakah_pendingnya(int xnote){
  bool hasil = false;
  
  int total=OrdersTotal();

  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_pend){
      hasil = true;
      break;
    }
  }

  return hasil;
}

void pending_monitor(bool state){
  if(state){
    int jarak  = 0;
    if(ObjectGetInteger(0,Name+"rc manualdist_b",OBJPROP_STATE)){
      jarak  = (int)ObjectGetString(0,Name+"rc manualdist_pts", OBJPROP_TEXT);
    }else
    if(ObjectGetInteger(0,Name+"rc activeap_b",OBJPROP_STATE)){
      jarak = hitung_zigzag_auto_contrarian();
    }

    if(jarak==0)return;

    int total=OrdersTotal();

    int thenote,thetype;
    double thelot, theprice;

    int jmlx=0;
    int xtipe[], xnote[];
    double xlot[], xprice[];
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol 
      && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)
      && OrderType()<2){
        thenote = (int)OrderComment();
        thetype = OrderType();
        thelot = OrderLots();
        theprice = OrderOpenPrice();

        if(!adakah_pendingnya(thenote)){
          jmlx++;
          ArrayResize(xtipe, jmlx);
          ArrayResize(xlot, jmlx);
          ArrayResize(xprice, jmlx);
          ArrayResize(xnote, jmlx);

          xtipe[jmlx-1] = thetype;
          xlot[jmlx-1] = thelot;
          xprice[jmlx-1] = theprice;
          xnote[jmlx-1] = thenote;
        }
      }
    }

    if(jmlx>0){
      for(int i=0;i<jmlx;i++){
        proses_pending(xtipe[i], xprice[i], xnote[i], xlot[i]);
      }
    }
  }else
  if(!state){
    delete_pending_by_magic(mn_pend);
  }
}

void multi_monitor(bool state){
  if(state){
    int max_hedging_multi = (int)ObjectGetString(0,Name+"max_hedging_multi_edit",OBJPROP_TEXT);
    if(max_hedging_multi==0)return;

    double price_buystop=0; 
    double price_sellstop=0;
    int distance_price_multi = (int)ObjectGetString(0,Name+"distance_price_multi_edit",OBJPROP_TEXT);

    hitung_trx_multi();

    if(jml_multi < max_hedging_multi*2){
      for(int i=0; i<max_hedging_multi; i++){
        if(i==0){
          price_buystop = Bid + pointnum_to_pointdec(distance_price_multi, Point);
          price_sellstop = Bid - pointnum_to_pointdec(distance_price_multi, Point);

          buka_trx_multi(price_buystop, price_sellstop);
        }else
        if(i>0){
          price_buystop += pointnum_to_pointdec(distance_price_multi, Point);
          price_sellstop -= pointnum_to_pointdec(distance_price_multi, Point);

          buka_trx_multi(price_buystop, price_sellstop);
        }
      }
    }

  }else
  if(!state){
    delete_all_by_magic(mn_multi);
  }
}

void ganti_warna_edit(bool state, string nama){
  color warna_off = clrPink;
  color warna_on = clrPaleTurquoise;

  if(state){
    ObjectSetInteger(0, nama, OBJPROP_BGCOLOR, warna_on);
  }else{
    ObjectSetInteger(0, nama, OBJPROP_BGCOLOR, warna_off);
  }
}

void trailing_monitor_market(){
  if(!ObjectGetInteger(0,Name+"trail_trade",OBJPROP_STATE))return;

  int jarak_trail = int(ObjectGetString(0, Name+"trail_trade_edit", OBJPROP_TEXT));
  if(jarak_trail==0)return;

  int total=OrdersTotal();

  int posisi;
  double newsl;
  bool sikat_trail;
  int nilai_step = (int)ObjectGetString(0, Name+"trail_step_trade_edit",OBJPROP_TEXT);
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderType()<2
      && (OrderMagicNumber()==mn_buy || OrderMagicNumber()==mn_sell)){

      sikat_trail = false;
      if(OrderType()==0){
        posisi = (int)pointdec_to_pointnum(Bid - OrderOpenPrice(), Point);
        
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(Bid - OrderStopLoss(), Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

            if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
              sikat_trail = true;
            }
          }
        }
      }else
      if(OrderType()==1){
        posisi = (int)pointdec_to_pointnum(OrderOpenPrice() - Ask, Point);
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(OrderStopLoss() - Ask, Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

            if(OrderStopLoss()==0){
              sikat_trail = true;
            }else{
              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }
        }
      }

      if(sikat_trail){        
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();

        _sl_modify = NormalizeDouble(newsl, Digits);

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void trailing_monitor_piramid_market(){
  if(!ObjectGetInteger(0,Name+"trail_piramid",OBJPROP_STATE))return;

  int jarak_trail = int(ObjectGetString(0, Name+"trail_piramid_edit", OBJPROP_TEXT));
  if(jarak_trail==0)return;

  int total=OrdersTotal();

  int posisi;
  double newsl;
  bool sikat_trail;
  int nilai_step = (int)ObjectGetString(0, Name+"trail_step_piramid_edit",OBJPROP_TEXT);
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderType()<2
      && (OrderMagicNumber()==mn_pira)){

      sikat_trail = false;
      if(OrderType()==0){
        posisi = (int)pointdec_to_pointnum(Bid - OrderOpenPrice(), Point);
        
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(Bid - OrderStopLoss(), Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

            if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
              sikat_trail = true;
            }
          }
        }
      }else
      if(OrderType()==1){
        posisi = (int)pointdec_to_pointnum(OrderOpenPrice() - Ask, Point);
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(OrderStopLoss() - Ask, Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

            if(OrderStopLoss()==0){
              sikat_trail = true;
            }else{
              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }
        }
      }

      if(sikat_trail){        
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();

        _sl_modify = NormalizeDouble(newsl, Digits);

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void trailing_monitor_pending_market(){
  if(!ObjectGetInteger(0,Name+"trail_pending",OBJPROP_STATE))return;

  int jarak_trail = int(ObjectGetString(0, Name+"trail_pending_edit", OBJPROP_TEXT));
  if(jarak_trail==0)return;

  int total=OrdersTotal();

  int posisi;
  double newsl;
  bool sikat_trail;
  int nilai_step = (int)ObjectGetString(0, Name+"trail_step_pending_edit",OBJPROP_TEXT);
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderType()<2 && OrderMagicNumber()==mn_pend){

      sikat_trail = false;
      if(OrderType()==0){
        posisi = (int)pointdec_to_pointnum(Bid - OrderOpenPrice(), Point);
        
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(Bid - OrderStopLoss(), Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

            if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
              sikat_trail = true;
            }
          }
        }
      }else
      if(OrderType()==1){
        posisi = (int)pointdec_to_pointnum(OrderOpenPrice() - Ask, Point);
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(OrderStopLoss() - Ask, Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

            if(OrderStopLoss()==0){
              sikat_trail = true;
            }else{
              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }
        }
      }

      if(sikat_trail){        
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();

        _sl_modify = NormalizeDouble(newsl, Digits);

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void trailing_monitor_multi_market(){
  if(!ObjectGetInteger(0,Name+"trail_multi",OBJPROP_STATE))return;

  int jarak_trail = int(ObjectGetString(0, Name+"trail_multi_edit", OBJPROP_TEXT));
  if(jarak_trail==0)return;

  int total=OrdersTotal();

  int posisi;
  double newsl;
  bool sikat_trail;
  int nilai_step = (int)ObjectGetString(0, Name+"trail_step_multi_edit",OBJPROP_TEXT);
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderType()<2 && OrderMagicNumber()==mn_multi){

      sikat_trail = false;
      if(OrderType()==0){
        posisi = (int)pointdec_to_pointnum(Bid - OrderOpenPrice(), Point);
        
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(Bid - OrderStopLoss(), Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Bid - pointnum_to_pointdec(jarak_trail, Point);

            if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
              sikat_trail = true;
            }
          }
        }
      }else
      if(OrderType()==1){
        posisi = (int)pointdec_to_pointnum(OrderOpenPrice() - Ask, Point);
        if(posisi >= jarak_trail){
          if(posisi >= jarak_trail+nilai_step){
            posisi = (int)pointdec_to_pointnum(OrderStopLoss() - Ask, Point);
            if(posisi >= jarak_trail+nilai_step){
              newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Ask + pointnum_to_pointdec(jarak_trail, Point);

            if(OrderStopLoss()==0){
              sikat_trail = true;
            }else{
              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }
        }
      }

      if(sikat_trail){        
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();

        _sl_modify = NormalizeDouble(newsl, Digits);

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void trailing_monitor_ea_market(){
  if(trail_trade_ea==0)return;

  int total=OrdersTotal();

  int posisi;
  double newsl;
  bool sikat_trail;
  int nilai_step = trail_step_trade_ea;
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderType()<2 && OrderMagicNumber()==mn_ea){

      sikat_trail = false;
      if(OrderType()==0){
        posisi = (int)pointdec_to_pointnum(Bid - OrderOpenPrice(), Point);
        
        if(posisi >= trail_trade_ea){
          if(posisi >= trail_trade_ea+nilai_step){
            posisi = (int)pointdec_to_pointnum(Bid - OrderStopLoss(), Point);
            if(posisi >= trail_trade_ea+nilai_step){
              newsl = Bid - pointnum_to_pointdec(trail_trade_ea, Point);

              if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Bid - pointnum_to_pointdec(trail_trade_ea, Point);

            if(NormalizeDouble(newsl, Digits) > NormalizeDouble(OrderStopLoss(), Digits)){
              sikat_trail = true;
            }
          }
        }
      }else
      if(OrderType()==1){
        posisi = (int)pointdec_to_pointnum(OrderOpenPrice() - Ask, Point);
        if(posisi >= trail_trade_ea){
          if(posisi >= trail_trade_ea+nilai_step){
            posisi = (int)pointdec_to_pointnum(OrderStopLoss() - Ask, Point);
            if(posisi >= trail_trade_ea+nilai_step){
              newsl = Ask + pointnum_to_pointdec(trail_trade_ea, Point);

              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }else{
            newsl = Ask + pointnum_to_pointdec(trail_trade_ea, Point);

            if(OrderStopLoss()==0){
              sikat_trail = true;
            }else{
              if(NormalizeDouble(newsl, Digits) < NormalizeDouble(OrderStopLoss(), Digits)){
                sikat_trail = true;
              }
            }
          }
        }
      }

      if(sikat_trail){        
        _tiket_modify = OrderTicket();
        _openprice_modify = OrderOpenPrice();
        _tp_modify = OrderTakeProfit();

        _sl_modify = NormalizeDouble(newsl, Digits);

        if(modify_execute()){}
        Sleep(200);
      }
    }
  }
}

void trailing_monitor_pending_pending(){
  if(!ObjectGetInteger(0,Name+"trail_pending",OBJPROP_STATE))return;

  int jarak_trail = int(ObjectGetString(0, Name+"trail_pending_pending_edit", OBJPROP_TEXT));

  if(jarak_trail==0)return;

  int total=OrdersTotal();

  int posisi;

  int jmlx=0;
  int tiketnya[];
  double harganya[];
  double lotnya[];
  int typenya[];
  int slnya[];
  int tpnya[];

  int nilai_step = (int)ObjectGetString(0, Name+"trail_step_pending_pending_edit",OBJPROP_TEXT);

  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderType()>1 && (OrderMagicNumber()==mn_pend)){

      if(OrderType()==4){
        posisi = (int)pointdec_to_pointnum(OrderOpenPrice() - Bid, Point);
        
        if(posisi >= jarak_trail + nilai_step){
          jmlx++;
          ArrayResize(tiketnya,jmlx);
          ArrayResize(harganya,jmlx);
          ArrayResize(lotnya,jmlx);
          ArrayResize(typenya,jmlx);
          ArrayResize(slnya,jmlx);
          ArrayResize(tpnya,jmlx);

          tiketnya[jmlx-1] = OrderTicket();
          lotnya[jmlx-1] = OrderLots();
          typenya[jmlx-1] = OrderType();

          harganya[jmlx-1] = Bid + pointnum_to_pointdec(jarak_trail, Point);
          // Print(harganya[jmlx-1]);
          
          tpnya[jmlx-1] = 0;
          if(ObjectGetInteger(0, Name+"TP_pending", OBJPROP_STATE)){            
            tpnya[jmlx-1] = (int)ObjectGetString(0, Name+"TP_pending_edit", OBJPROP_TEXT);
            // Print("masuk tp");
          }
          
          slnya[jmlx-1] = 0;
          if(ObjectGetInteger(0, Name+"sl_pending", OBJPROP_STATE)){
            slnya[jmlx-1] = (int)ObjectGetString(0, Name+"sl_pending_edit", OBJPROP_TEXT);
            // Print("masuk tp");
          }
        }

      }else
      if(OrderType()==5){
        posisi = (int)pointdec_to_pointnum(Bid - OrderOpenPrice(), Point);
        if(posisi >= jarak_trail + nilai_step){
          jmlx++;
          ArrayResize(tiketnya,jmlx);
          ArrayResize(harganya,jmlx);
          ArrayResize(lotnya,jmlx);
          ArrayResize(typenya,jmlx);
          ArrayResize(slnya,jmlx);
          ArrayResize(tpnya,jmlx);

          tiketnya[jmlx-1] = OrderTicket();
          lotnya[jmlx-1] = OrderLots();
          typenya[jmlx-1] = OrderType();

          harganya[jmlx-1] = Bid - pointnum_to_pointdec(jarak_trail, Point);
          // Print(harganya[jmlx-1]);
          
          tpnya[jmlx-1] = 0;
          if(ObjectGetInteger(0, Name+"TP_pending", OBJPROP_STATE)){
            tpnya[jmlx-1] = (int)ObjectGetString(0, Name+"tp_pending_edit", OBJPROP_TEXT);
          }
          
          slnya[jmlx-1] = 0;
          if(ObjectGetInteger(0, Name+"sl_pending", OBJPROP_STATE)){
            slnya[jmlx-1] = (int)ObjectGetString(0, Name+"sl_pending_edit", OBJPROP_TEXT);
          }
        }
      }
    }
  }

  for(int i=0;i<jmlx;i++){    
    _tiket_hapus = tiketnya[i];
    if(hapus_execute()){}
    Sleep(200);
  }

  for(int i=0;i<jmlx;i++){
    _trade_trade = typenya[i];
    _price_trade = harganya[i];
    _lot_trade = lotnya[i];    
    _magic_trade = mn_pend;
    
    if(_trade_trade==4){
      if(_tp_trade>0)
        _tp_trade = _price_trade + pointnum_to_pointdec(tpnya[i], Point);

      if(_sl_trade>0)
        _sl_trade = _price_trade - pointnum_to_pointdec(slnya[i], Point);
    }else
    if(_trade_trade==5){
      if(_tp_trade>0)
        _tp_trade = _price_trade - pointnum_to_pointdec(tpnya[i], Point);

      if(_sl_trade>0)
        _sl_trade = _price_trade + pointnum_to_pointdec(slnya[i], Point);
    }

    // Print("price: "+_price_trade);
    // Print("sl: "+_sl_trade);
    // Print("tp: "+_tp_trade);
    // Print("tipe: "+_trade_trade);
    if(trade_execute()){};
  }
}

double get_pending_price_for_trailing_multi(int mode){
  double hasil = 0;

  int cek_tipe=4;

  if(mode==0){
    cek_tipe = 5;
  }else
  if(mode==1){
    cek_tipe = 4;
  }

  int total=OrdersTotal();
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_multi && OrderType()==cek_tipe){
      if(hasil==0){
        hasil = OrderOpenPrice();
      }else
      if(hasil>0){
        if(mode==0){
          if(hasil < OrderOpenPrice()){
            hasil = OrderOpenPrice();
          }
        }else
        if(mode==1){
          if(hasil > OrderOpenPrice()){
            hasil = OrderOpenPrice();
          }
        }
      }
    }
  }

  return hasil;
}

double get_pending_price_for_trailing_ea(int mode){
  double hasil = 0;

  int cek_tipe=4;

  if(mode==0){
    cek_tipe = 5;
  }else
  if(mode==1){
    cek_tipe = 4;
  }

  int total=OrdersTotal();
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_ea && OrderType()==cek_tipe){
      if(hasil==0){
        hasil = OrderOpenPrice();
      }else
      if(hasil>0){
        if(mode==0){
          if(hasil < OrderOpenPrice()){
            hasil = OrderOpenPrice();
          }
        }else
        if(mode==1){
          if(hasil > OrderOpenPrice()){
            hasil = OrderOpenPrice();
          }
        }
      }
    }
  }

  return hasil;
}

void delete_by_tiket(int tx){
  int total=OrdersTotal();

  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderTicket()==tx){
      _tiket_hapus = OrderTicket();
      if(hapus_execute()){}
      Sleep(200);
      break;
    }
  }
}

void trailing_monitor_multi_pending(int mode){//0=buy trade aktif, 1=sell trade aktif
  if(!ObjectGetInteger(0,Name+"trail_multi",OBJPROP_STATE))return;

  int jarak_trail = int(ObjectGetString(0, Name+"trail_multi_edit", OBJPROP_TEXT));
  if(jarak_trail==0)return;

  int drag_tipe = -1;
  int jaraknya=0;
  if(mode==0){//buy trade aktif
    double highest_sell_pending_price = get_pending_price_for_trailing_multi(mode);
    drag_tipe = 5;
    jaraknya = (int)pointdec_to_pointnum(Bid - highest_sell_pending_price, Point);
  }else
  if(mode==1){//sell trade aktif
    double lowest_buy_pending_price = get_pending_price_for_trailing_multi(mode);
    drag_tipe = 4;
    jaraknya = (int)pointdec_to_pointnum(lowest_buy_pending_price - Bid, Point);
  }
  
  int nilai_step = (int)ObjectGetString(0, Name+"trail_step_multi_edit",OBJPROP_TEXT);
  if(jaraknya > jarak_trail + nilai_step){    
    //kumpulin tiket
    int total=OrdersTotal();
    int jml_lokal=0;
    int tiket_lokal[];
    int note_lokal[];
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_multi && OrderType()==drag_tipe){
        jml_lokal++;
        ArrayResize(tiket_lokal, jml_lokal);
        ArrayResize(note_lokal, jml_lokal);

        tiket_lokal[jml_lokal-1] = OrderTicket();
        note_lokal[jml_lokal-1] = int(OrderComment());
      }
    }
    
    if(jml_lokal>0){
      //hapus tikets
      for(int i=0; i<jml_lokal;i++){
        delete_by_tiket(tiket_lokal[i]);
      }

      //bikin list pending baru
      double start_price=0;
      if(mode==0){
        start_price = Bid - pointnum_to_pointdec(jarak_trail, Point);
      }else
      if(mode==1){
        start_price = Bid + pointnum_to_pointdec(jarak_trail, Point);
      }

      double ea_lot = double(ObjectGetString(0, Name+"rc lot", OBJPROP_TEXT));      
      for(int i=0; i<jml_lokal;i++){
        if(mode==0){
          _trade_trade = 5;  
        }else
        if(mode==1){
          _trade_trade = 4;
        }
        
        _price_trade = NormalizeDouble(start_price, Digits);
        _lot_trade = ea_lot;
        _magic_trade = mn_multi;
        _note_trade = string(note_lokal[i]);

        if(_trade_trade == 4){
          _sl_trade = 0;
          if(ObjectGetInteger(0,Name+"sl_multi",OBJPROP_STATE)){
            _sl_trade = _price_trade - pointnum_to_pointdec((int)ObjectGetString(0,Name+"sl_multi_edit",OBJPROP_TEXT), Point);
          }
          
          _tp_trade = 0;
          if(ObjectGetInteger(0,Name+"tp_multi",OBJPROP_STATE)){
            _tp_trade = _price_trade + pointnum_to_pointdec((int)ObjectGetString(0,Name+"tp_multi_edit",OBJPROP_TEXT), Point); 
          }
        }else
        if(_trade_trade == 5){
          _sl_trade = 0;
          if(ObjectGetInteger(0,Name+"sl_multi",OBJPROP_STATE)){
            _sl_trade = _price_trade + pointnum_to_pointdec((int)ObjectGetString(0,Name+"sl_multi_edit",OBJPROP_TEXT), Point);
          }
          
          _tp_trade = 0;
          if(ObjectGetInteger(0,Name+"tp_multi",OBJPROP_STATE)){
            _tp_trade = _price_trade - pointnum_to_pointdec((int)ObjectGetString(0,Name+"tp_multi_edit",OBJPROP_TEXT), Point); 
          }
        }
        
        // Print("buy stop: "+_note_trade);
        if(trade_execute()){
          int jarak_grid = 0;
          
          bool st_auto = ObjectGetInteger(0, Name+"btn_auto_multi",OBJPROP_STATE);
          bool st_manual = ObjectGetInteger(0, Name+"btn_manual_multi",OBJPROP_STATE);
          if(st_auto){
            jarak_grid = hitung_zigzag_auto_multi();
          }else
          if(st_manual){
            jarak_grid = (int)ObjectGetString(0, Name+"manual_multi_edit", OBJPROP_TEXT);
          }          

          if(mode==0){
            start_price -= pointnum_to_pointdec(jarak_grid, Point);
          }else
          if(mode==1){
            start_price += pointnum_to_pointdec(jarak_grid, Point);
          }
        }
        Sleep(200);
      }
    }
  }
}

void trailing_monitor_ea_pending(int mode){//0=buy trade aktif, 1=sell trade aktif
  if(trail_pending_ea==0)return;

  int drag_tipe = -1;
  int jaraknya=0;
  if(mode==0){//buy trade aktif
    double highest_sell_pending_price = get_pending_price_for_trailing_ea(mode);
    drag_tipe = 5;
    jaraknya = (int)pointdec_to_pointnum(Bid - highest_sell_pending_price, Point);
  }else
  if(mode==1){//sell trade aktif
    double lowest_buy_pending_price = get_pending_price_for_trailing_ea(mode);
    drag_tipe = 4;
    jaraknya = (int)pointdec_to_pointnum(lowest_buy_pending_price - Bid, Point);
  }
  
  if(jaraknya > trail_pending_ea + trail_step_pending_ea){
    //kumpulin tiket
    int total=OrdersTotal();
    int jml_lokal=0;
    int tiket_lokal[];
    int note_lokal[];
    for(int pos=0; pos<total; pos++) {
      if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
      if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_ea && OrderType()==drag_tipe){
        jml_lokal++;
        ArrayResize(tiket_lokal, jml_lokal);
        ArrayResize(note_lokal, jml_lokal);

        tiket_lokal[jml_lokal-1] = OrderTicket();
        note_lokal[jml_lokal-1] = int(OrderComment());
      }
    }
    
    if(jml_lokal>0){
      //hapus tikets
      for(int i=0; i<jml_lokal;i++){
        delete_by_tiket(tiket_lokal[i]);
      }

      //bikin list pending baru
      double start_price=0;
      if(mode==0){
        start_price = Bid - pointnum_to_pointdec(trail_pending_ea, Point);
      }else
      if(mode==1){
        start_price = Bid + pointnum_to_pointdec(trail_pending_ea, Point);
      }

      double ea_lot = double(ObjectGetString(0, Name+"rc lot", OBJPROP_TEXT));      
      for(int i=0; i<jml_lokal;i++){
        if(mode==0){
          _trade_trade = 5;  
        }else
        if(mode==1){
          _trade_trade = 4;
        }
        
        _price_trade = NormalizeDouble(start_price, Digits);
        _lot_trade = ea_lot;
        _magic_trade = mn_ea;
        _note_trade = string(note_lokal[i]);

        if(_trade_trade == 4){
          _sl_trade = 0;
          if(sl_ea>0){
            _sl_trade = _price_trade - pointnum_to_pointdec(sl_ea, Point);
          }
          
          _tp_trade = 0;
          if(tp_ea>0){
            _tp_trade = _price_trade + pointnum_to_pointdec(tp_ea, Point); 
          }
        }else
        if(_trade_trade == 5){
          _sl_trade = 0;
          if(sl_ea>0){
            _sl_trade = _price_trade + pointnum_to_pointdec(sl_ea, Point);
          }
          
          _tp_trade = 0;
          if(tp_ea>0){
            _tp_trade = _price_trade - pointnum_to_pointdec(tp_ea, Point); 
          }
        }
        
        // Print("buy stop: "+_note_trade);
        if(trade_execute()){
          int jarak_grid = 0;
          
          if(distance_grid_eaX==0){//auto
            jarak_grid = hitung_zigzag_auto_ea();
          }else
          if(distance_grid_eaX==1){//manual
            jarak_grid = distance_grid_manual_ea;
          }

          if(mode==0){
            start_price -= pointnum_to_pointdec(jarak_grid, Point);
          }else
          if(mode==1){
            start_price += pointnum_to_pointdec(jarak_grid, Point);
          }
        }
        Sleep(200);
      }
    }
  }
}  

int hitung_zigzag_auto_contrarian(){
  int hasil = 0;

  int total=0;
  double nilai;
  double nzz[];
  int jml_a=0;
  for(int i=0;i<barsToScan_contrarian;i++){
    nilai = iCustom(Symbol(), ZigZag_TimeFrame_contrarian, IndicatorFileName, ZigZag_depth_contrarian,
      ZigZag_deviation_contrarian, ZigZag_backstep_contrarian, zigzag_bufferIndex, i);

    if(nilai>0){
      jml_a++;
      ArrayResize(nzz,jml_a);
      nzz[jml_a-1] = nilai;      
    }
  }

  if(jml_a>0){
    int jarak[];
    int jx=0;
    int cek_jarak;
    for(int i=0;i<jml_a-1;i++){
      cek_jarak = (int)pointdec_to_pointnum(fabs(nzz[i]-nzz[i+1]), Point);

      if(cek_jarak <= zzValuesFilterPoints_contrarian){
        jx++;
        ArrayResize(jarak, jx);
        jarak[jx-1] = cek_jarak;
      }
    }

    if(jx>0){
      int jj=0;
      for(int i=0;i<jx;i++){        
        jj += jarak[i];
        // Print("jarak:"+string(jarak[i]));
      }

      // Print("jumalh: "+string(jj)+" bagi:"+string(jx));
      hasil = int(jj/jx);
      // Print("hasil1: "+string(hasil));
      hasil = (int)MathRound(hasil * multiplierAverageZZPoint_contrarian);
      // Print("hasil2: "+string(hasil));
    }
  }

  return hasil;
}

int hitung_zigzag_auto_multi(){
  int hasil = 0;

  int total=0;
  double nilai;
  double nzz[];
  int jml_a=0;
  for(int i=0;i<barsToScan_multi;i++){
    nilai = iCustom(Symbol(), ZigZag_TimeFrame_multi, IndicatorFileName, ZigZag_depth_multi,
      ZigZag_deviation_multi, ZigZag_backstep_multi, zigzag_bufferIndex, i);

    if(nilai>0){
      jml_a++;
      ArrayResize(nzz,jml_a);
      nzz[jml_a-1] = nilai;      
    }
  }

  if(jml_a>0){
    int jarak[];
    int jx=0;
    int cek_jarak;
    for(int i=0;i<jml_a-1;i++){
      cek_jarak = (int)pointdec_to_pointnum(fabs(nzz[i]-nzz[i+1]), Point);

      if(cek_jarak <= zzValuesFilterPoints_multi){
        jx++;
        ArrayResize(jarak, jx);
        jarak[jx-1] = cek_jarak;
      }
    }

    if(jx>0){
      int jj=0;
      for(int i=0;i<jx;i++){        
        jj += jarak[i];
        // Print("jarak:"+string(jarak[i]));
      }

      // Print("jumalh: "+string(jj)+" bagi:"+string(jx));
      hasil = int(jj/jx);
      // Print("hasil1: "+string(hasil));
      hasil = (int)MathRound(hasil * multiplierAverageZZPoint_multi);
      // Print("hasil2: "+string(hasil));
    }
  }

  return hasil;
}

int hitung_zigzag_auto_ea(){
  int hasil = 0;

  int total=0;
  double nilai;
  double nzz[];
  int jml_a=0;
  for(int i=0;i<barsToScan_ea;i++){
    nilai = iCustom(Symbol(), ZigZag_TimeFrame_ea, IndicatorFileName, ZigZag_depth_ea,
      ZigZag_deviation_ea, ZigZag_backstep_ea, zigzag_bufferIndex, i);

    if(nilai>0){
      jml_a++;
      ArrayResize(nzz,jml_a);
      nzz[jml_a-1] = nilai;      
    }
  }

  if(jml_a>0){
    int jarak[];
    int jx=0;
    int cek_jarak;
    for(int i=0;i<jml_a-1;i++){
      cek_jarak = (int)pointdec_to_pointnum(fabs(nzz[i]-nzz[i+1]), Point);

      if(cek_jarak <= zzValuesFilterPoints_ea){
        jx++;
        ArrayResize(jarak, jx);
        jarak[jx-1] = cek_jarak;
      }
    }

    if(jx>0){
      int jj=0;
      for(int i=0;i<jx;i++){        
        jj += jarak[i];
        // Print("jarak:"+string(jarak[i]));
      }

      // Print("jumalh: "+string(jj)+" bagi:"+string(jx));
      hasil = int(jj/jx);
      // Print("hasil1: "+string(hasil));
      hasil = (int)MathRound(hasil * multiplierAverageZZPoint_ea);
      // Print("hasil2: "+string(hasil));
    }
  }

  return hasil;
}

int jml_ea;  

int jml_ea_buy_trade;
int jml_ea_sell_trade;

int jml_ea_buy_pending;
int jml_ea_sell_pending;

double last_price_buy_ea;
double last_price_sell_ea;

void hitung_trx_ea(){
  int total = OrdersTotal();
  
  jml_ea = 0;
  
  jml_ea_buy_trade=0;
  jml_ea_sell_trade=0;
  
  jml_ea_buy_pending=0;
  jml_ea_sell_pending=0;

  last_price_buy_ea = 0;
  last_price_sell_ea = 0;
  
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_ea){
      jml_ea++;

      if(OrderType()==0){//buy
        jml_ea_buy_trade++;

        if(last_price_buy_ea==0){
          last_price_buy_ea = OrderOpenPrice();
        }else
        if(last_price_buy_ea>0){
          if(last_price_buy_ea < OrderOpenPrice()){
            last_price_buy_ea = OrderOpenPrice();
          }
        }
      }else      
      if(OrderType()==1){//sell
        jml_ea_sell_trade++;

        if(last_price_sell_ea==0){
          last_price_sell_ea = OrderOpenPrice();
        }else
        if(last_price_sell_ea>0){
          if(last_price_sell_ea > OrderOpenPrice()){
            last_price_sell_ea = OrderOpenPrice();
          }
        }
      }else

      if(OrderType()==4){//buystop
        jml_ea_buy_pending++;

        if(last_price_buy_ea==0){
          last_price_buy_ea = OrderOpenPrice();
        }else
        if(last_price_buy_ea>0){
          if(last_price_buy_ea < OrderOpenPrice()){
            last_price_buy_ea = OrderOpenPrice();
          }
        }
      }else
      if(OrderType()==5){//sellstop
        jml_ea_sell_pending++;

        if(last_price_sell_ea==0){
          last_price_sell_ea = OrderOpenPrice();
        }else
        if(last_price_sell_ea>0){
          if(last_price_sell_ea > OrderOpenPrice()){
            last_price_sell_ea = OrderOpenPrice();
          }
        }
      }
    }
  }
}

int jml_multi;

void hitung_trx_multi(){
  int total = OrdersTotal();
  
  jml_multi = 0;
  
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_multi){
      jml_multi++;
    }
  }
}

void buka_trx_ea(double price_buystop, double price_sellstop){
  double ea_lot = double(ObjectGetString(0, Name+"rc lot", OBJPROP_TEXT));  

  _trade_trade = 4;
  _price_trade = NormalizeDouble(price_buystop, Digits);
  _lot_trade = ea_lot;
  _magic_trade = mn_ea;
  _note_trade = string(note_inc_trade);
  
  _sl_trade = 0;
  if(sl_ea>0){
    _sl_trade = _price_trade - pointnum_to_pointdec(sl_ea, Point);
  }
  
  _tp_trade = 0;
  if(tp_ea>0){
    _tp_trade = _price_trade + pointnum_to_pointdec(tp_ea, Point); 
  }
  
  // Print("buy stop: "+_note_trade);
  if(trade_execute()){
    last_price_buy_ea = _price_trade;

    Sleep(200);

    _trade_trade = 5;
    _price_trade = NormalizeDouble(price_sellstop, Digits);
    _lot_trade = ea_lot;
    _magic_trade = mn_ea;
    _note_trade = string(note_inc_trade);

    _sl_trade = 0;
    if(sl_ea>0){
      _sl_trade = _price_trade + pointnum_to_pointdec(sl_ea, Point); 
    }

    _tp_trade = 0;
    if(tp_ea>0){
      _tp_trade = _price_trade - pointnum_to_pointdec(tp_ea, Point); 
    }

    // Print("sell stop: "+_note_trade);
    if(trade_execute()){
      last_price_sell_ea = _price_trade;

      note_inc_trade++;
      GlobalVariableSet(Name+_Symbol+"_note_inc_trade", note_inc_trade);
    }
    Sleep(200);
  }  
}

void buka_trx_multi(double price_buystop, double price_sellstop){
  double multi_lot = double(ObjectGetString(0, Name+"rc lot", OBJPROP_TEXT));  

  _trade_trade = 4;
  _price_trade = NormalizeDouble(price_buystop, Digits);
  _lot_trade = multi_lot;
  _magic_trade = mn_multi;
  _note_trade = string(note_inc_trade);
  
  _sl_trade = 0;
  if(ObjectGetInteger(0,Name+"sl_multi",OBJPROP_STATE)){
    _sl_trade = _price_trade - pointnum_to_pointdec((int)ObjectGetString(0,Name+"sl_multi_edit",OBJPROP_TEXT), Point);
  }
  
  _tp_trade = 0;
  if(ObjectGetInteger(0,Name+"tp_multi",OBJPROP_STATE)){
    _tp_trade = _price_trade + pointnum_to_pointdec((int)ObjectGetString(0,Name+"tp_multi_edit",OBJPROP_TEXT), Point); 
  }
  
  if(trade_execute()){
    Sleep(200);

    _trade_trade = 5;
    _price_trade = NormalizeDouble(price_sellstop, Digits);
    _lot_trade = multi_lot;
    _magic_trade = mn_multi;
    _note_trade = string(note_inc_trade);

    _sl_trade = 0;
    if(ObjectGetInteger(0,Name+"sl_multi",OBJPROP_STATE)){
      _sl_trade = _price_trade + pointnum_to_pointdec((int)ObjectGetString(0,Name+"sl_multi_edit",OBJPROP_TEXT), Point); 
    }

    _tp_trade = 0;
    if(ObjectGetInteger(0,Name+"tp_multi",OBJPROP_STATE)){
      _tp_trade = _price_trade - pointnum_to_pointdec((int)ObjectGetString(0,Name+"tp_multi_edit",OBJPROP_TEXT), Point); 
    }

    // Print("sell stop: "+_note_trade);
    if(trade_execute()){
      note_inc_trade++;
      GlobalVariableSet(Name+_Symbol+"_note_inc_trade", note_inc_trade);
    }
    Sleep(200);
  }  
}

void ea_process(bool state){
  // if(!ObjectGetInteger(0, Name+"btn_ea", OBJPROP_STATE))return;
  
  if(state){
    if(max_hedging_ea==0)return;

    hitung_trx_ea();

    if(jml_ea < max_hedging_ea*2){
      double price_buystop, price_sellstop;

      int jx = int((jml_ea/2));
      for(int i=jx; i<max_hedging_ea; i++){
        if(i==0){
          price_buystop = Bid + pointnum_to_pointdec(distance_price_ea, Point);
          price_sellstop = Bid - pointnum_to_pointdec(distance_price_ea, Point);
          buka_trx_ea(price_buystop, price_sellstop);
        }else
        if(i>0){
          price_buystop = last_price_buy_ea + pointnum_to_pointdec(distance_price_ea, Point);
          price_sellstop = last_price_sell_ea - pointnum_to_pointdec(distance_price_ea, Point);
          buka_trx_ea(price_buystop, price_sellstop);
        }
      }
    }
  }else
  if(!state){
    delete_all_by_magic(mn_ea);
  }
}

bool adakah_di_list_ea_note(int data){
  bool hasil = false;

  for(int i=0;i<ArraySize(list_ea_note);i++){
    if(list_ea_note[i]==data){
      hasil = true;
      break;
    }
  }

  return hasil;
}

int get_stat_ea(int kode){
  int hasil = -1;

  int total = OrdersTotal();
  
  int j_trade_buy=0;
  int j_trade_sell=0;
  int j_pending_buy=0;
  int j_pending_sell=0;
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_ea && OrderComment()==string(kode)){
      if(OrderType()==0){
        j_trade_buy++;
      }else
      if(OrderType()==1){
        j_trade_sell++;
      }else
      if(OrderType()==4){
        j_pending_buy++;
      }else
      if(OrderType()==5){
        j_pending_sell++;
      }
    }
  }

  // 0 = both pending,
  // 1 = 1 aktif buy, 1 pending sell
  // 2 = 1 aktif sell, 1 pending buy
  // 3 = 2 aktif
  // 4 = 0 aktif buy, 1 pending sell
  // 5 = 0 aktif sell, 1 pending buy

  if(j_pending_buy>0 && j_pending_sell>0){// 0 = both pending,
    hasil = 0;
  }else
  if(j_trade_buy>0 && j_pending_sell>0){// 1 = 1 aktif buy, 1 pending sell
    hasil = 1;
  }else
  if(j_trade_sell>0 && j_pending_buy>0){// 2 = 1 aktif sell, 1 pending buy
    hasil = 2;
  }else
  if(j_trade_buy>0 && j_trade_sell>0){// 3 = 2 aktif
    hasil = 3;
  }else
  if(j_trade_buy==0 && j_pending_sell>0){// 4 = 0 aktif buy, 1 pending sell
    hasil = 4;
  }else
  if(j_trade_sell==0 && j_pending_buy>0){// 5 = 0 aktif sell, 1 pending buy
    hasil = 5;
  }

  return hasil;
}

int list_ea_note[];
int stat_ea;
void ea_management(){
  if(jml_ea<0)return;

  ArrayFree(list_ea_note);
  
  int jml_ea_note=0;

  int total = OrdersTotal();
  
  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_ea){

      if(jml_ea_note==0){
        jml_ea_note++;
        ArrayResize(list_ea_note, jml_ea_note);
        list_ea_note[jml_ea_note-1] = int(OrderComment());
      }else
      if(jml_ea_note>0){
        if(!adakah_di_list_ea_note(int(OrderComment()))){
          jml_ea_note++;
          ArrayResize(list_ea_note, jml_ea_note);
          list_ea_note[jml_ea_note-1] = int(OrderComment());
        }
      }
      
    }
  }

  //check array
  // for(int i=0; i<ArraySize(list_multi_note); i++){
  //   Print("list multi "+string(i)+": "+string(list_multi_note[i]));
  // }

  // stat_multi
  // 0 = both pending,
  // 1 = 1 aktif buy, 1 pending sell
  // 2 = 1 aktif sell, 1 pending buy
  // 3 = 2 aktif
  // 4 = 0 aktif buy, 1 pending sell
  // 5 = 0 aktif sell, 1 pending buy

  for(int i=0; i<ArraySize(list_ea_note); i++){    
    stat_ea = get_stat_ea(list_ea_note[i]);

    if(stat_ea==0){// both pending
      //nothing happen
    }else
    if(stat_ea==1){// 1 aktif buy, 1 pending sell
      // for trailing pending sell
      trailing_monitor_ea_pending(0);
    }else
    if(stat_ea==2){// 1 aktif sell, 1 pending buy
      // for trailing pending buy
      trailing_monitor_ea_pending(1);
    }else
    if(stat_ea==3){// 2 aktif
      //nothing happen
    }else
    if(stat_ea==4){// 0 aktif buy, 1 pending sell
      // delete pending sell
      delete_by_kode(list_ea_note[i]);
    }else
    if(stat_ea==5){// 0 aktif sell, 1 pending buy
      // delete pending buy
      delete_by_kode(list_ea_note[i]);
    }
  }
}

void delete_by_kode(int kode){
  int total=OrdersTotal();

  for(int pos=0; pos<total; pos++) {
    if(OrderSelect(pos,SELECT_BY_POS)==false)continue;
    if(OrderSymbol()==_Symbol && OrderMagicNumber()==mn_multi && OrderComment()==string(kode)){
      _tiket_hapus = OrderTicket();
      if(hapus_execute()){}
      Sleep(200);
      break;
    }
  }
}

void set_info(){
  ObjectSetString(0, Name+"ltotal_profit",OBJPROP_TEXT,"Total Profit: "+DoubleToString(total_profit,2));
  ObjectSetString(0, Name+"lzz_pending",OBJPROP_TEXT,"Zigzag Pending: "+string(hitung_zigzag_auto_contrarian()));
  ObjectSetString(0, Name+"lzz_multi",OBJPROP_TEXT,"Zigzag Multi: "+string(hitung_zigzag_auto_multi()));
  ObjectSetString(0, Name+"lzz_ea",OBJPROP_TEXT,"Zigzag EA: "+string(hitung_zigzag_auto_ea()));
}

// -----------------------------------------------

int vdev=0;
bool run_cek=true;
void dev_cek(){
  if(vdev==0)return;
  if(!IsTesting())return;

  if(run_cek){    
    run_cek = false;

    // ObjectSetInteger(0, Name+"trail_trade", OBJPROP_STATE, true);

    // _lot_trade = 0.01;

    // _trade_trade = 0;
    // _price_trade = Ask;
    // _magic_trade = mn_buy;
    // _note_trade = "0";

    // _trade_trade = 1;
    // _price_trade = Bid;
    // _magic_trade = mn_sell;
    // _note_trade = "1";
    
    // if(trade_execute()){}

    // ObjectSetInteger(0, Name+"btn_pending", OBJPROP_STATE, true);
    // ObjectSetInteger(0, Name+"trail_pending", OBJPROP_STATE, true);

    // ============ cek ea auto =================
    ObjectSetInteger(0, Name+"btn_multi_pending", OBJPROP_STATE, true);
    ObjectSetInteger(0, Name+"btn_ea", OBJPROP_STATE, true);
    ObjectSetInteger(0, Name+"sl_multi", OBJPROP_STATE, true);
    ObjectSetInteger(0, Name+"tp_multi", OBJPROP_STATE, true);
    ObjectSetInteger(0, Name+"trail_multi", OBJPROP_STATE, true);
  }
}

void eful_ontick(){
  dev_cek();

  time_monitor();

  limited_trade_day_monitor();

  trade_utama_monitor();
  
  piramid_monitor(ObjectGetInteger(0, Name+"btn_piramid", OBJPROP_STATE));
  
  pending_monitor(ObjectGetInteger(0, Name+"btn_pending", OBJPROP_STATE));

  // multi_monitor(ObjectGetInteger(0, Name+"btn_multi_pending", OBJPROP_STATE));
  
  trailing_monitor_market();
  
  trailing_monitor_piramid_market();
  
  trailing_monitor_pending_market();
  trailing_monitor_pending_pending();

  trailing_monitor_multi_market();

  trailing_monitor_ea_market();

  ea_management();
  
  ea_process(ObjectGetInteger(0, Name+"btn_ea", OBJPROP_STATE));

  set_info();

  stay_on_top();
}