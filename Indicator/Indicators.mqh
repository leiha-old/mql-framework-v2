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

#include  "./Indicator.mqh"
#include "../Array/ArrayMap.mqh"

// ---
class Indicators
   : public ArrayMap < string , Indicator * >
{

protected
   :
   
   /**
    */
   Indicator * 
      createIndicatorBuffer
         ( string name , int handle , int bufferName = MAIN_LINE )
   {
      Indicator * indicator = new Indicator( timeFrame );
      indicator.series.update( bufferName , new SerieBuffer( handle ) );
      update( name , indicator );
      return indicator;
   };

public
   :
   
   TimeFacade * timeFrame;
   
   Indicators
      ( TimeFacade * timeFacade )
      : ArrayMap ( ) , timeFrame( timeFacade )
   {
      
   };
   
   /**
    */
   Indicator * 
      rsi
         ( int period = 13 , ENUM_APPLIED_PRICE appliedPrice = PRICE_CLOSE )
   {
      string name = StringFormat( "RSI.%i.%i", period , appliedPrice );
      
      Indicator * indicator = get( name );
      if( indicator == NULL ) {
         indicator = createIndicatorBuffer( 
            name , 
            iRSI( 
               timeFrame.currency.symbol , 
               timeFrame.timeFrame       , 
               period                    , 
               appliedPrice 
            ) 
         );      
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
      
      Indicator * indicator = get( name );
      if( indicator == NULL ) {
         indicator = createIndicatorBuffer( 
            name , 
            iSAR( 
               timeFrame.currency.symbol , 
               timeFrame.timeFrame       , 
               step                      , 
               maximum 
            ) 
         );      
      }
      return indicator;         
   };
   
};