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
// ---
#include "../Serie/Series.mqh"
#include "../Indicator/Indicators.mqh"
#include "../Time/Times.mqh"
#include "../Currency/Currencies.mqh"

// ---
class WorkSpace
{

public
   :
   
   Currencies * currencies;
   
   WorkSpace ( )
      //:
   {
      currencies = new Currencies ( );
   };
   
   /** 
    */
   Currency * 
      currency 
         ( string symbol ) 
   {
      Currency * c = currencies.get( symbol );
      if( c == NULL ) {
         c = new Currency( symbol );
         currencies.update( symbol , c );
      }      
      return c;
   };
   
   /** 
    */
   Time * 
      time 
         ( string currency , ENUM_TIMEFRAMES timeFrame = PERIOD_CURRENT ) 
   {
      return currency( currency ).time( timeFrame );
   };
   
   /** 
    */
   virtual void 
      onInit 
         ( )
   {};
   
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
         ( int i = 0 , end = currencies.total() ; i < end ; i++ )
      {
         currencies.getByPrimaryIndex( i ).onCalculate( start , toCopy );         
      }        
   };
   
};