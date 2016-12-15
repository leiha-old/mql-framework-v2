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

#include "../Array/Injector.mqh"

// ---
template < typename TParent , typename TSerie , typename TInjector >
class SerieInjectorTemplate
   : public ArrayInjector < TSerie >
{

protected
   :
   
   SerieConfigurator < TParent , TSerie > * configurator;

public 
   :
   
   SerieInjectorTemplate
      ( )
         : ArrayInjector ( )
   {
      
   };
   
   TInjector * attachTo
      ( T * arrayDest )
   {
      array = arrayDest;
      return pointer( );
   };
   
   // ---
   
   virtual void
      onCalculate
         ( int start , int toCopy ) 
   {
      populate       ( start , toCopy );
      normalizeDouble( start , toCopy );
   };
   
   virtual void
      populate( int start , int toCopy )
   {
   
   };
   
};