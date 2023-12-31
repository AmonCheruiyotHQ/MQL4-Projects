#property copyright "Coded by Tecciztecatl 2021"
#property link      "https://www.mql5.com/en/users/tecciztecatl"
#property strict
#property script_show_inputs


input int      news_minute_before=5;                           //Time before News (for manage grid, minute)
input int      news_minute_after=10;                           //Time after News (for manage grid, minute)
input  bool    mng_by_high=true;                               //High Impact
input  bool    mng_by_medium=true;                             //Medium Impact
input  bool    mng_by_low=true;                                //Low Impact
input  bool    mng_only_current=false;                         //Take news only for the current pair (otherwise All news) 
input  bool    mng_usd=false;                                  //Take USD news (if only for the current pair)
input  bool    mng_eur=false;                                  //Take EUR news (if only for the current pair)
input string   inp_resource_name = "\\Experts\\News\\News_Dashboard.ex4";   //Path and Name of the News Dashboard
//input string   inp_resource_name = "\\Experts\\Market\\News Dashboard MT4.ex4";   //Path and Name of the News Dashboard



union UintChar{uint arr_uint[2500]; uchar arr_char[10000];};UintChar csv;
struct NewsStruct
   {
   string   title;         //news title
   string   country;       //news country or "All"
   datetime time_event;    //local time seconds
   int      time_remain;   
   int      impact;        //impact 0-3
   string   all_day;       //NULL or "All Day" or "Tentative" or "Day 1" or "Day 2" etc
   string   forecast;      //string value
   string   previous;      //string value
   string   actual;        //string value
   };
NewsStruct NEWS[];

string   curr_base;
string   curr_profit;

bool     flagNews=false;
string   txt_news=NULL;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
//take news 
GetNews();

//if we have news
if(flagNews)
   Comment(txt_news);

}


//+------------------------------------------------------------------+
void GetNews()
{
string   resource_name = inp_resource_name + "::csv";
curr_base=SymbolInfoString(_Symbol,SYMBOL_CURRENCY_BASE);
curr_profit=SymbolInfoString(_Symbol,SYMBOL_CURRENCY_PROFIT);
uint wr;uint hr;

flagNews=false;
txt_news=NULL;

//take the resource 
if(ResourceReadImage(resource_name,csv.arr_uint,wr,hr))
   {
   string txt=CharArrayToString(csv.arr_char);
   string result_lines[];
   int    lines=StringSplit(txt,0x0a,result_lines);
   
   //convert resource to the news
   if(lines>0)   
      {
      ArrayResize(NEWS,lines);
      for(int i=0;i<lines;i++)
         LineToStruct(result_lines[i], NEWS[i]);   //convert news to struct
      }
   }
else
   {
   Comment("News_Dashboard not found!\nCheck the path\n"+inp_resource_name);
   return;
   }

int num_news=ArrayRange(NEWS,0);
for(int i=0;i<num_news;i++)
   {
   if(NEWS[i].time_event>0 && 
      //time is checked here remove the "//" below
      //TimeLocal()<=NEWS[i].time_event+(news_minute_after*60) && TimeLocal()>=NEWS[i].time_event-(news_minute_before*60) &&
      CheckImpact(NEWS[i].impact) &&
      (!mng_only_current || NEWS[i].country==curr_base || NEWS[i].country==curr_profit || NEWS[i].country=="All" || 
         (mng_usd && NEWS[i].country=="USD") ||
         (mng_eur && NEWS[i].country=="EUR") ) )
      
      {
      //add news text
      txt_news+=TimeToString(NEWS[i].time_event,TIME_DATE|TIME_MINUTES)+" "+NEWS[i].country+" "+NEWS[i].title+
                " ("+IntegerToString(int(NEWS[i].time_event-TimeLocal()))+")\n";
      flagNews=true;
      }
   }

}

//+------------------------------------------------------------------+
void LineToStruct(string txt, NewsStruct &news)
{
string result[];
int n=StringSplit(txt,',',result);
if(n==9)
   {
   news.title=result[0];
   news.country=result[1];
   news.time_event=StringToTime(result[2]);
   news.all_day=result[3];
   news.time_remain=(int)StringToInteger(result[4]);
   news.impact=(int)StringToInteger(result[5]);
   news.forecast=result[6];
   news.previous=result[7];
   news.actual=result[8];
   }
}

//+------------------------------------------------------------------+
bool CheckImpact(int impact)
{
switch(impact)
  {
   case  1 :   if(mng_by_low)    return(true); break;
   case  2 :   if(mng_by_medium) return(true); break;
   case  3 :   if(mng_by_high)   return(true); break;
  }
return(false);
}