//+------------------------------------------------------------------+
//|                                                         Test.mq5 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

int OnInit()
{
  test.onInit( );
  return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
   test.onDeInit( reason );
}

void OnTick()
{
   test.onTick( );
};