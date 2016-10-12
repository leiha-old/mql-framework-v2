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

#include "./MovingAverage.mqh"


// ---

template < typename T >
class MovingAverageSignalIndicator
   : public MovingAverageSignal
{

protected
   :
   
   T  iContainer;
   
   Serie * trendUP;
   Serie * trendDOWN;
   
   MovingAverage * maIndicator;
   
public
   :
   
   /**
    */
   MovingAverageSignalIndicator 
      ( T container , MovingAverage * ma )
         : iContainer( container ) , maIndicator ( ma )
   {
      trendUP      = new Serie( );
      trendDOWN    = new Serie( );
      update( LINE_UP   , trendUP );
      update( LINE_DOWN , trendDOWN );
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      Serie * serie = maIndicator.get( LINE_MAIN );
   
      for( int i = toCopy - 2 , t = 0 ; i > t ; i-- ) 
      {
         if ( serie.items[ i ]  < serie.items[ i + 1 ] ) 
         {
            trendDOWN.items[ i ] = serie.items[ i ];
         } else {
            trendUP.items[ i ] = serie.items[ i ];
         }           
      }
   };
   
};

