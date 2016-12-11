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

#include "./ParabolicSAR.mqh"
#include "./ParabolicSARSignal.mqh"

// ---

template < typename T >
class ParabolicSARIndicator
   : public ParabolicSAR
{

protected
   :
   
   T  iContainer;
   
   
public
   :
   
   MovingAverage * average;
   
   /**
    */
   ParabolicSARIndicator 
      ( T container , double step = 0.02 , double maximum = 0.2 , int periodMA = 55 , int periodMASmooth = 21 )
         : iContainer( container )
   {
      update( LINE_PRICE , container.average( 1 ).get( LINE_MAIN ) );
      update( LINE_MAIN  , new SerieBuffer( 
         iSAR( container.symbol , container.timeFrame , step , maximum ) ) 
      );  
      
      average = container.average( periodMA );
      if ( periodMASmooth != NULL ) {
            
      }
      update( LINE_AVERAGE , average.get( LINE_MAIN ) );
   };
   
   
   /** 
    * Signal : Bulls Vs Bears Power
    */
   ParabolicSARSignal < T > * 
      signal
         ( )
   {
      string name             = "SAR_SIGNAL";
      ParabolicSARSignal < T > * bb = iContainer.get( name );
      if ( bb == NULL ) {
         bb = new ParabolicSARSignal < T > 
            ( iContainer , GetPointer( this ) )
         ;
         iContainer.update( name , bb );
         
         MovingAverageSignal * maSignal = average.signal();
         update( LINE_TRENDUP   , maSignal.get( MovingAverageSignal::LINE_UP ) );
         update( LINE_TRENDDOWN , maSignal.get( MovingAverageSignal::LINE_DOWN ) );
      }      
      return bb;
   };
   
};

