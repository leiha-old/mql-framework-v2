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

#include "../Serie/SerieBuffer.mqh"
#include "../Serie/SerieHistory.mqh"
#include "../Indicator/BullsVsBears/BullsVsBears.mqh"

// ---

class TimeIndicators
   : public ArrayMap < string , Indicator * >
{

protected
   :
   
   string           symbol;   
   ENUM_TIMEFRAMES  timeFrame;
   
   /**
    */
   Indicator * 
      single
         ( string name , bool & is )
   {      
      Indicator * indicator = get( name );
      
      is = indicator != NULL;      
      if( is == false ) 
      {
         indicator = new Indicator( );
         indicator.setSymbol( symbol     );
         indicator.setFrame ( timeFrame  );
         update( name , indicator );         
      }
      return indicator;
   };

public
   :
   
   /**
    */
   TimeIndicators 
      ( string & currencySymbol , ENUM_TIMEFRAMES frame = PERIOD_CURRENT )
         : symbol ( currencySymbol ) , timeFrame ( frame ) 
   {
       
   };
      
  /** 
    * Indicator : Low
    */
   Indicator * 
      low
         ( )
   {  
      bool   was;
      string name = "Low";
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieLow( ) );
      }
      return indicator;   
   };
   
   /** 
    * Indicator : Low
    */
   Indicator * 
      high
         ( )
   {
      bool   was;
      string name = "High";
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieHigh( ) );
      }
      return indicator;
   };
   
   /** 
    * Indicator : Close
    */
   Indicator * 
      close
         ( )
   {
      bool   was;
      string name = "Close";
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieClose( ) );
      }
      return indicator;
   };
  
   /** 
    * Indicator : Relative Strength Index
    */
   Indicator * 
      rsi
         ( int period = 13 , ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE )
   {
      bool   was;
      string name = StringFormat( "RSI.%i.%i", period , appliedPrice );
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieBuffer( 
            iRSI( symbol , timeFrame , period , appliedPrice ) 
         ) );
      }
      return indicator;      
   };
   
   /** 
    * Indicator : Bulls Power
    */
   Indicator * 
      bulls
         ( int period = 13 )
   {
      bool   was;
      string name = StringFormat( "BULLS.%i", period );
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieBuffer( 
            iBullsPower( symbol , timeFrame , period ) 
         ) );
      }
      return indicator;      
   };
   
   /** 
    * Indicator : Bears Power
    */
   Indicator * 
      bears
         ( int period = 13 )
   {
      bool   was;
      string name = StringFormat( "BEARS.%i", period );
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieBuffer( 
            iBearsPower( symbol , timeFrame , period ) 
         ) );
      }
      return indicator;      
   };
   
   /** 
    * Indicator : Bulls Vs Bears Power
    */
   BullsVsBears * 
      bullsVsBears
         ( int period = 13 )
   {
      string name              = StringFormat( "BULLSVSBEARS.%i", period );
      BullsVsBears * indicator = get( name );
      if( indicator == NULL ) 
      {
         indicator = new BullsVsBearsIndicator < TimeIndicators * > 
            ( GetPointer( this ) , period ) 
         ;
         indicator.setSymbol( symbol           );
         indicator.setFrame ( timeFrame        );
         update             ( name , indicator );         
      }
      return indicator;      
   };
   
   /** 
    * Indicator : Parabolic SAR
    */
   Indicator * 
      sar
         ( double step = 0.02 , double maximum = 0.2 )
   {
      bool   was;
      string name = StringFormat( "SAR.%e.%e", step , maximum );
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieBuffer( 
            iSAR( symbol , timeFrame , step , maximum ) 
         ) );
      }
      return indicator;   
   };
   
   /**
    * Indicator : Moving Average
    */
   Indicator * 
      average
         ( 
            int                period       = 13          , 
            ENUM_MA_METHOD     method       = MODE_SMA    , 
            ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE , 
            int                shift        = 0 
         )
   {
      bool   was;
      string name = StringFormat( "MA.%e.%e.%e.%e", period , method , appliedPrice , shift );
      Indicator * indicator = single( name , was );
      if( ! was ) 
      {
         indicator.update( Indicator::LINE_MAIN , new SerieBuffer( 
            iMA( symbol , timeFrame , period , shift , method, appliedPrice )
         ) );
      }
      return indicator;        
   };
};