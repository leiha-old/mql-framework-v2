//+------------------------------------------------------------------+
//|                                                        Array.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./Serie.mqh"

// ---
class SerieMA
   : public Serie
{

int period;

public 
   :
   
   SerieMA
      ( int periodMa , ENUM_INDEXBUFFER_TYPE type = INDICATOR_DATA )
      : Serie( type ) , period ( periodMa )
   {
      
   };
   
   /**
    *
    */
   virtual void
      onCalculate( Serie * serieSrc , int start , int toCopy ) 
   {
      for( int i = start ; i < toCopy - period ; i++ ) 
      {
         double result = 0.0;
         for( int ii = period ; ii < start ; ii-- ) {
            result += serieSrc.get( i + ii );
         }
         items[ i ] = ( result / period );
      }
   };
   
};