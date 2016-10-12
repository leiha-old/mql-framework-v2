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

template < typename T >
class Currency 
   //: public
{

public
   :
   
   ArrayMap < int , Time < T > * >      * times;
   
   string                      symbol;

   Currency ( string currencySymbol )
      : symbol ( currencySymbol )
   {
      times = new ArrayMap < int ,  Time < T > * > (  );   
   };
   
   /** 
    */
   Time < T > * time ( ENUM_TIMEFRAMES timeFrame ) 
   {
      Time < T > * t = times.get( timeFrame );
      if( t == NULL ) {
         t = new Time < T > ( symbol , timeFrame );
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