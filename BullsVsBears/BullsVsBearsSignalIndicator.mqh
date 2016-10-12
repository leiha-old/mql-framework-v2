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

#include "./BullsVsBears.mqh"

// ---

template < typename T >
class BullsVsBearsSignalIndicator
   : public BullsVsBearsSignal
{

protected
   :
   
   Serie * trendUP;
   Serie * trendDOWN;
   Serie * bullsVsBears;
   T       iContainer;
   
public
   :
   
   /**
    */
   BullsVsBearsSignalIndicator 
      ( T container , BullsVsBears * indicator , int ma1 = 34 , int ma2 = 55 )
         : iContainer( container )
   {
      update( LINE_UP    , trendUP   = new Serie( ) );
      update( LINE_DOWN  , trendDOWN = new Serie( ) );
      bullsVsBears = indicator
         .average( ma1 )
         .average( ma2 )
         .get( LINE_MAIN )         
      ;
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      for( int i = toCopy - 2, t = 0 ; i > t ; i-- ) 
      {
         if ( bullsVsBears.items[ i ] < bullsVsBears.items[ i + 1 ] ) 
         {
            trendDOWN.items[ i ] = bullsVsBears.items[ i ];
         } 
         else {
            trendUP.items[ i ] = bullsVsBears.items[ i ];
         }         
      }
   };   
}; 


