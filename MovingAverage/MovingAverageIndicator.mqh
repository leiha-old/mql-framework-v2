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
#include "./MovingAverageSignalIndicator.mqh"

// ---

template < typename T >
class MovingAverageIndicator
   : public MovingAverage
{

protected
   :
   
   T  iContainer;
   
public
   :
   
   /**
    */
   MovingAverageIndicator 
      (  T container , 
         int                period       = 13          , 
         ENUM_MA_METHOD     method       = MODE_SMA    , 
         ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE , 
         int                shift        = 0 
      )
         : iContainer( container )
   {
      update( LINE_MAIN  , new SerieBuffer( 
         iMA( container.symbol , container.timeFrame , period , shift , method, appliedPrice )
      ) );
   };
   
   
   /** 
    * Signal : Bulls Vs Bears Power
    */
   MovingAverageSignal * 
      signal
         ( )
   {
      string name             = "MA_SIGNAL";
      MovingAverageSignal * bb = iContainer.get( name );
      if ( bb == NULL ) {
         bb = new MovingAverageSignalIndicator < TimeIndicators * > 
            ( iContainer , GetPointer( this ) )
         ;         
         iContainer.update( name , bb );
      }      
      return bb;
   };
   
};

