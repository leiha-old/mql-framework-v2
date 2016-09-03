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

#include "./CurrencyFacade.mqh"
#include "../Time/Times.mqh"

// ---
class Currency 
   : public CurrencyFacade
{

public
   :

   Times * times;
   
   Currency ( string currencySymbol )
      : CurrencyFacade ( currencySymbol )
   {
      times = new Times ( );   
   };
   
   /** 
    */
   Time * time ( ENUM_TIMEFRAMES timeFrame ) 
   {
      Time * t = times.get( timeFrame );
      if( t == NULL ) {
         t = new Time( GetPointer( this ) );
         times.update( timeFrame , t );
      }      
      return t;
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