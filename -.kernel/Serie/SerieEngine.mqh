//+------------------------------------------------------------------+
//|                                                        Serie.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Plot/Plot.mqh"
#include "../Array/Array.mqh"
#include "../Array/ArrayMap.mqh"

int TOTAL_BUFFERS = 0;

// ---
template < typename T >
class SerieEngine
   : public Array < T >
{

protected
   :

int                     slot;
ENUM_INDEXBUFFER_TYPE   type;
string                  currencyName;
ENUM_TIMEFRAMES         timeName;   

public 
   :
   
   SerieEngine
      ( string currency = NULL , ENUM_TIMEFRAMES time = PERIOD_CURRENT )
         :  Array        ( true ) , 
            currencyName ( currency ) , 
            timeName     ( time ) ,
            slot         ( TOTAL_BUFFERS++ ) , 
            type         ( INDICATOR_CALCULATIONS  )        
   {
      
   };
   
   int getLimit( int prevCalculated , int ratesTotal )
   {
      return prevCalculated > ratesTotal || prevCalculated <= 0
         ? ratesTotal
         : ratesTotal - prevCalculated
         ;
   }
   
   virtual void
      onCalculate
         ( int start , int toCopy ) 
   {
      
   };
};