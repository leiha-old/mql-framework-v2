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
#include "../Array/ArrayMap.mqh"
#include "../Currency/Currency.mqh"

// ---
class WorkSpace
{

public
   :
   
   ArrayMap < string , Currency * > * currencies;
   
   WorkSpace ( )
      //:
   {
      currencies = new ArrayMap < string , Currency * > ( );
   };
   
   /** 
    * Get Currency by symbol
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
    * Get TimeFrame
    */
   Time * 
      time 
         ( string symbol , ENUM_TIMEFRAMES timeFrame = PERIOD_CURRENT ) 
   {
      return currency( symbol ).time( timeFrame );
   };
   
   /** 
    */
   virtual void 
      onInit 
         ( )
   {
      
   };
   
   /** 
    */
   virtual void 
      end
         ( )
   {
      for 
         ( int i = 0 , end = currencies.total() ; i < end ; i++ )
      {
         currencies.getByPrimaryIndex( i ).end( );         
      }
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
         ( int i = 0 , end = currencies.total() ; i < end ; i++ )
      {
         currencies.getByPrimaryIndex( i ).onCalculate( start , toCopy );         
      }        
   };
   
};