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

#include "../Array/ArrayMap.mqh"

// -----

interface SerieFacade
   : public ObjectFacade
{

};

// -----

template < 
   typename TSerie , 
   typename TSerieFacade ,
   typename TObjectParent ,
>
class SerieTemplate
   : public Object < TSerie , TSerieFacade , TObjectParent >
{

ArrayMap < Array < double > * , int > * _dataSets;

public 
   :       
   SerieTemplate ( )
      : Object ( )        
   {
      _dataSets = new ArrayMap < Array < double > * , int > ( );
      
      data 
         ( MAIN_LINE , new Array < double > ( ) )
         ;
   };
   
   // -----
   
   /**
    * Get dataSet
    */   
   Array < double > *
      data ( int index )
   {
      return _dataSets.get( index );
   }; 
   
   /**
    * Attach dataSet 
    */
   TSerie *
      data ( int name , Array < double > * dataSet )
   {  
      _dataSets.update( name , dataSet );
      return pointer( );
   };

};

// -----

template < 
   typename TIndicatorParent
>
class Serie
   : public SerieTemplate < Serie , SerieFacade , TIndicatorParent >
{

public 
   :       
   Serie ( )
      : SerieTemplate ( )        
   {
      
   };   

};