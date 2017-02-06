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
template < typename TParent , typename TSerie >
class SerieInjectorLow
   : public SerieInjector < TParent , TSerie >
{

public 
   :
   
   SerieInjectorLow
      ( TParent * parentObject )
         : SerieInjector( parentObject )
   {
      
   };
   
   // ---
   
   virtual void
      populate( int start , int toCopy ) 
   {
      CopyLow( array.config.currency( ), array.config.time( ) , start , toCopy , array.data.items );
   };
};