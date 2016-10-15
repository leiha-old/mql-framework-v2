//+------------------------------------------------------------------+
//|                                                         Time.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../-.kernel/Serie/Serie.mqh"

// ---

class BullsVsBearsSerie
   : public Serie
{

Serie * serieBulls;
Serie * serieBears;

public 
   :
   
   BullsVsBearsSerie
      ( Serie * bulls , Serie * bears )
      : Serie ( ) , serieBulls ( bulls ) , serieBears ( bears  )
   {
      
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      int r = 1;
      for( int i = 0 , t = ( toCopy == 1 ? 1 : toCopy - 1 ) ; i < t ; i++ ) 
      {
         items[ i ] = ( serieBulls.items[ i ] + serieBears.items[ i ] ) / 2 ;
      }
   };
};