//+------------------------------------------------------------------+
//|                                                     Currency.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Array/ArrayMap.mqh"
#include "../Time/Time.mqh"

// ---
class Currency 
   //: public
{

public
   :
   
   ArrayMap < int , Time * > * times;
   
   string                      symbol;

   Currency ( string currencySymbol )
      : symbol ( currencySymbol )
   {
      times = new ArrayMap < int , Time * > (  );   
   };
   
   /** 
    */
   Time * time ( ENUM_TIMEFRAMES timeFrame ) 
   {
      Time * t = times.get( timeFrame );
      if( t == NULL ) {
         t = new Time( symbol , timeFrame );
         times.update( timeFrame , t );
      }      
      return t;
   };
   
   /** 
    */
   virtual void 
      end
         ( )
   {
      for 
         ( int i = 0 , end = times.total() ; i < end ; i++ )
      {
         times.getByPrimaryIndex( i ).end(  );
      } 
   };
   
   /** 
    */
   virtual void
      onCalculate 
         ( int start , int toCopy ) 
   {
      for 
         ( int i = 0 , end = times.total() ; i < end ; i++ )
      {
         times.getByPrimaryIndex( i ).onCalculate( start , toCopy );
      }        
   };
   
};