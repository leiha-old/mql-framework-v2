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

#include  "./TimeFacade.mqh"
#include "../Indicator/Indicators.mqh"

// ---
class Time
   : public TimeFacade
{

protected
   :
   
   /**
    */
   Indicator * 
      createIndicatorBuffer
         ( string name , int handle , int bufferName = MAIN_LINE )
   {
      Indicator * indicator = new Indicator( GetPointer( this ) );
      indicator.series.update( bufferName , new SerieBuffer( handle ) );
      indicators.update( name , indicator );
      return indicator;
   };

public
   :
   
   Indicators * indicators;
      
   /**
    */
   Time ( CurrencyFacade * currencyFacade )
      : TimeFacade ( currencyFacade )
   {
       indicators = new Indicators ( GetPointer( this ) );
   };
   
   /**
    */
   Indicator * 
      rsi
         ( int period = 13 , ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE )
   {
      string name = StringFormat( "RSI.%i.%i", period , appliedPrice );
      
      Indicator * indicator = indicators.get( name );
      if( indicator == NULL ) {
         indicator = createIndicatorBuffer( name , iRSI( currency.symbol , timeFrame , period , appliedPrice ) );      
      }
      return indicator;         
   };
   
   /**
    */
   Indicator * 
      sar
         ( double step = 0.02 , double maximum = 0.2 )
   {
      string name = StringFormat( "SAR.%e.%e", step , maximum );
      
      Indicator * indicator = indicators.get( name );
      if( indicator == NULL ) {
         indicator = createIndicatorBuffer( name , iSAR( currency.symbol , timeFrame , step , maximum ) );      
      }
      return indicator;         
   };
   
   /** 
    */
   virtual void
      onCalculate 
         ( int start , int toCopy ) 
   {
      for 
         ( int i = 0 , end = indicators.total() ; i < end ; i++ )
      {
         Indicator * indicator = indicators.getByPrimaryIndex( i );
         indicator.onCalculate( start , toCopy );
      }
   };

};