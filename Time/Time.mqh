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
   
   virtual void 
      end
         ( )
   {
      for 
         ( int i = 0 , end = indicators.total() ; i < end ; i++ )
      {
         indicators.getByPrimaryIndex( i ).end( );
      }
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