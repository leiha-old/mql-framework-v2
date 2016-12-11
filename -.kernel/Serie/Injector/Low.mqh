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

#include "../Injector.mqh"

// ---
template < typename T >
class SerieInjectorLow
   : public SerieInjector < T >
{

public 
   :
   
   SerieInjectorLow
      ( )
         : SerieInjector(  )           
   {
      
   };
   
   // ---
   
   virtual void
      populate( int start , int toCopy ) 
   {
      CopyLow( configurator.currency( ) , configurator.time( ) , start , toCopy , array.items );
   };
};