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

#include "../-.kernel/Serie/SerieBuffer.mqh"

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
      :    Serie         ( ) 
         , serieBulls    ( bulls     ) 
         , serieBears    ( bears     )       
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      int i = 0;
      int t = ( toCopy == 1 ? 1 : toCopy - 1 );
      for( ; i < t ; i++ ) 
      {
         items[ i ] = ( serieBulls.items[ i ] + serieBears.items[ i ] ) / 2 ;         
      }      
   };
};

// ---

class BullsVsBearsSerieTrend
   : public Serie
{

Serie * serieMa;
Serie * serieTrendDOWN;

public 
   :
   
   BullsVsBearsSerieTrend
      (    Serie * ma 
         , Serie * trendDOWN         
         )
      :    Serie         ( ) 
         , serieMa       ( ma        )
         , serieTrendDOWN( trendDOWN )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      int i = 0;
      int t = ( toCopy == 1 ? 1 : toCopy - 1 );
      for( ; i < t ; i++ ) 
      {
         if( serieMa.items[ i ] < serieMa.items[ i + 1 ] )
         {
                           items[ i ] = 0;
            serieTrendDOWN.items[ i ] = serieMa.items[ i ];
         }
         else
         {
                          items[ i ] = serieMa.items[ i ];
           serieTrendDOWN.items[ i ] = 0;
         }
      }
   };
};