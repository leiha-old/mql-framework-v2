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
class SerieInjectorClose
   : public SerieInjector < T >
{

protected
   :

public 
   :
   
   SerieInjectorClose
      ( )
         : SerieInjector( )
   {
      
   };
   
   // ---
   
   virtual void
      populate( int start , int toCopy ) 
   {
      CopyClose( configurator.currency( ), configurator.time( ) , start , toCopy , array.items );
   };
};