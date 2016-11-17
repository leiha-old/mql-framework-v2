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

#include "./-.kernel/Time/Indicators.mqh"
#include "./BullsVsBears/BullsVsBearsIndicator.mqh"
#include "./ParabolicSAR/ParabolicSARIndicator.mqh"
#include "./MovingAverage/MovingAverageIndicator.mqh"

// ---

class Indicators
   : public TimeIndicators
{

protected
   :
   

public
   :
   
   /**
    */
   Indicators 
      ( string & currencySymbol , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
         : TimeIndicators ( currencySymbol , frame ) 
   {
       
   };
      
  /** 
    * Indicator : Bulls Vs Bears Power
    */
   BullsVsBears * 
      bullsVsBears
         ( int period = 13 , int ma1 = 34 , int ma2 = 55 )
   {
      string name              = StringFormat( "BULLSVSBEARS.%i", period );
      BullsVsBears * indicator = get( name );
      if( indicator == NULL ) 
      {
         indicator = new BullsVsBearsIndicator < Indicators * > 
            ( GetPointer( this ) , period , ma1 , ma2 ) 
         ;
         indicator.setName  ( name             );
         indicator.setSymbol( symbol           );
         indicator.setFrame ( timeFrame        );
         update             ( name , indicator );         
      }
      return indicator;
   };
   
   /** 
    * Indicator : Parabolic SAR
    */
   ParabolicSAR * 
      parabolicSAR
         ( double step = 0.02 , double maximum = 0.2 , int periodMA = 55 , int periodMASmooth = 13 )
   {
      string name              = StringFormat( "PARABOLICSAR.%i.%i.%i.%i", step , maximum , periodMA , periodMASmooth );
      ParabolicSAR * indicator = get( name );
      if( indicator == NULL ) 
      {
         indicator = new ParabolicSARIndicator < Indicators * > 
            ( GetPointer( this ) , step , maximum , periodMA , periodMASmooth ) 
         ;
         indicator.setName  ( name             );
         indicator.setSymbol( symbol           );
         indicator.setFrame ( timeFrame        );
         update             ( name , indicator );         
      }
      return indicator;
   };
   
   
   /**
    * Indicator : Moving Average
    */
   MovingAverage * 
      average
         ( 
            int                period       = 13          , 
            ENUM_MA_METHOD     method       = MODE_SMA    , 
            ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE , 
            int                shift        = 0 
         )
   {
      string name = StringFormat( "MA.%e.%e.%e.%e", period , method , appliedPrice , shift );
      MovingAverage * indicator = get( name );
      if( indicator == NULL ) 
      {
         indicator = new MovingAverageIndicator < Indicators * > 
            ( GetPointer( this ) , period , method , appliedPrice , shift ) 
         ;
         indicator.setName  ( name             );
         indicator.setSymbol( symbol           );
         indicator.setFrame ( timeFrame        );
         update             ( name , indicator );         
      }
      return indicator;     
   };
   
   /**
    * Indicator : Moving Average
    */
   MovingAverage * 
      average
         ( int period , Indicator * indicator , int serieName = MAIN_LINE )
   {
      string name = StringFormat( "%s.%i", indicator.name( ) , period );
      MovingAverage * ma = get( name );
      if( indicator == NULL ) 
      {
         ma = new MovingAverageIndicator < Indicators * > 
            ( GetPointer( this ) , period , indicator , serieName ) 
         ;
         ma.setName  ( name             );
         ma.setSymbol( symbol           );
         ma.setFrame ( timeFrame        );
         update      ( name , indicator );         
      }
      return indicator;     
   };
   
};