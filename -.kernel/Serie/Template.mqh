//+------------------------------------------------------------------+
//|                                                        Serie.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Array.mqh"
#include "../Array/Injector.mqh"
#include "../Array/Comparator.mqh"
#include "../Array/Average.mqh"

template < typename TParent , typename TSerie , typename TSerieConfigurator >
class SerieTemplate
   : public Array < double >
{

TSerieConfigurator                    * serieConfigurator;
ArrayInjector     < TSerie >          * serieInjector;
ArrayAverage      < TSerie >          * serieAverage;
ArrayComparator   < double , TSerie > * serieComparator;
TParent                               * parent;

public 
   :
       
   SerieTemplate
      ( TParent * serieParent )
      : Array  ( true , 0 ),
        parent ( serieParent )
   {
      
   };
   
   static TSerie * instanceOf
      ( )
   {
      return new TSerie( );
   };
   
   TParent * end () { return parent; };
   
   // ---
   
   ArrayInjector < TSerie > * 
      injector  
         ( ) 
   {
      if ( NULL == serieInjector ) {
         serieInjector = new ArrayInjector < TSerie > ( pointer( ) );
      }
      return serieInjector;
   };
   
   // ---
   
   TSerie *
      injector  
         ( ArrayInjector < TSerie > * injector ) 
   {
      serieInjector = injector;
      serieInjector.attachTo( pointer( ) );
      return pointer( );
   };
   
   ArrayComparator < double , TSerie > * 
      comparator  
         ( ) 
   {
      if ( NULL == serieComparator ) {
         serieComparator = new ArrayComparator  < double , TSerie > ( pointer( ) );
      }
      return serieComparator;
   };
   
   ArrayAverage < TSerie > * 
      average  
         ( ) 
   {
      if ( NULL == serieAverage ) {
         serieAverage = new ArrayAverage < TSerie > ( pointer( ) );
      }
      return serieAverage;
   };
   
   TSerieConfigurator * 
      configurator
         ( ) 
   {
      if ( NULL == serieConfigurator ) {
         serieConfigurator = new TSerieConfigurator ( pointer( ) );
      }
      return serieConfigurator;
   };
};