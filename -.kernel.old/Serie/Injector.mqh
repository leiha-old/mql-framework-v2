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
template < typename TParent , typename TSerie >
class SerieInjector
   : public ArrayInjector < TSerie >
{

protected
   :
   
TParent * parent;

public 
   :
   
   SerieInjector
      ( TParent * parentObject )
         : ArrayInjector ( ) ,
           parent ( parentObject )
         
   {
      
   };
   
   SerieInjector * attachTo
      ( TSerie * arrayDest )
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