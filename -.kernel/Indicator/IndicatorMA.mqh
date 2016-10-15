//+------------------------------------------------------------------+
//|                                                    Indicator.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./Indicator.mqh"

// ---
class IndicatorMA 
   : public Indicator
{

public
   :
   
   IndicatorMA
      ( )
      : Indicator( )
   {
      
   };
   
   /**
    * Moving average on one serie of this indicator
    */
   Indicator * 
      average
         ( int period = 13 , int serieName = MAIN_LINE )
   {
      string name = StringFormat( "MA.%i.%i", period , serieName );
      
      Indicator * indicator = slaves.get( name );
      if( indicator == NULL ) {
         indicator = new Indicator( );
         indicator.setSymbol( symbol );
         indicator.setFrame ( frame  );
         
         SerieMA * serie = new SerieMA( get( serieName ) );
         serie.addPeriod( period );
         
         indicator.update( serieName , serie );
         
         slaves.update( name , indicator );
      }    
      return indicator;           
   };
};