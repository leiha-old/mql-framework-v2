//+------------------------------------------------------------------+
//|                                                    WorkSpace.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// ---

#include "../Indicator/Series.mqh"

template < 
   typename TCurrency     , 
   typename TTimeFrame    , 
   typename TIndicators   , 
   typename TIndicator    ,
   typename TConfigurator ,
   typename TSerie        ,
   typename TSerieConfigurator ,
   typename TInjector       
>
class WorkSpaceTemplate
   : public Object
{

WorkSpaceCurrencies < TCurrency > * wkCurrencies;

public
   :
   
   IndicatorSeries < TIndicator , TSerie > * series;
   TConfigurator                           * configurator;
   
   WorkSpaceTemplate
      ( )
      : Object ( )
   {
      wkCurrencies = new WorkSpaceCurrencies < TCurrency >       ( );
      series       = new IndicatorSeries < TIndicator , TSerie > ( pointer( ) );
      configurator = new TConfigurator                           ( pointer( ) );    
   };
   
   /** 
    */
   virtual void onInit () 
   {      
     
   };
   
   TIndicator * serie
      ( int serieName , TInjector * injector )
   {
      TSerie * s = new TSerie( );
               s.engine.injector( injector );
               
      series.update( serieName , s );         
      return pointer( );   
   };
   
   TSerieConfigurator * serie
      ( int serieNumber )
   {
      TSerie * s = series.get( serieNumber );   
      if( NULL != s ) {
         return s.config;
      }      
      return NULL;
   };
      
   TIndicators * indicators
      ( string currency , ENUM_TIMEFRAMES timeframe )
   {
      TCurrency * c = wkCurrencies.get( currency );
      if( NULL != c ) 
      {
         TTimeFrame * tf = c.timeframes.get( timeframe );
         if( NULL != tf ) 
         {
            return tf.indicators;
         }            
      }
      return NULL;
   };

   /** 
    */
   virtual void
      onCalculate 
         ( int ratesTotal, int prevCalculated ) 
   {
      if( IsStopped( ) ) {
         return;
      }
      
      int start  = 0;
      int toCopy = ratesTotal;
      if( prevCalculated < ratesTotal || prevCalculated >= 0 ) {
         toCopy = ratesTotal - prevCalculated;
         if( prevCalculated > 0 ) { 
            toCopy++;            
         }
      }
      
      for 
         ( int i = 0 , end = wkCurrencies.total() ; i < end ; i++ )
      {
         for 
            ( int i2 = 0 , end2 = wkCurrencies.items[ i ].timeframes.total() ; i2 < end2 ; i2++ )
         {
            for 
               ( int i3 = 0 , end3 = wkCurrencies.items[ i ].timeframes.items[ i2 ].indicators.total() ; i3 < end3 ; i3++ )
            {
               for 
                  ( int i4 = 0 , end4 = wkCurrencies.items[ i ].timeframes.items[ i2 ].indicators.items[ i3 ].series.total() ; i4 < end4 ; i4++ )
               {
                  // Currency > TimeFrame > Indicator > Serie > Injector       
                  wkCurrencies.items  [ i  ]
                     .timeframes.items[ i2 ]
                     .indicators.items[ i3 ]
                     .series    .items[ i4 ].engine.injector ( )                     
                     .onCalculate
                        ( start , toCopy )
                  ;
               }
            }
         }
      }        
   };
};