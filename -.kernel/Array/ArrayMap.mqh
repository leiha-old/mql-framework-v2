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

#include "./Array.mqh"

// ----

interface ArrayMapFacade
   : public ArrayFacade
{

};

// ----

template < 
   typename TType               ,
   typename TTypeOfIndex        ,
   typename TObject             ,
   typename TObjectInterface    ,
   typename TObjectParent        
>
class ArrayMapTemplate
   : public Object < 
      TObject             , 
      TObjectInterface    ,
      TObjectParent       
   >
{

Array < TType        > * data  ;
Array < TTypeOfIndex > * index ;

public
   :   
   ArrayMapTemplate
      (  )
      : Object( )
   {
      data  = new Array < TType        > ( );
      index = new Array < TTypeOfIndex > ( );
   };
   
   // -----
   
   void 
      reverse( int isSerie = false )
   {
      data .reverse( isSerie );         
      index.reverse( isSerie );
   };
   
   /**
    * Add / Update item
    */
   TObject *
      update ( TTypeOfIndex name , TType item )
   {
      if ( index.update( name ) )
         data.update( item );      
   
      return pointer( );
   };
   
   /**
    * Get item by index
    */
   TType 
      get( TTypeOfIndex key )
   {
      int i = index.getIndex( key );      
      return i > -1 ? data.items[ i ] : NULL;      
   };
   
   /**
    * Get index by value
    * Only The first item found is returned
    */
   TTypeOfIndex 
      getIndex ( TType item )
   {
      for 
         ( int i = 0 , t = index.total( ) ; i < t ; i++ )
      {
         if( data.items[ i ] == item ) {
            return index.items[ i ];
         }            
      }
      return NULL;
   };
   
   /**
    */
   int 
      total ( )
   {
      return index.total( );
   };  

};

// ----

template < 
   typename TType ,
   typename TTypeOfIndex
>
class ArrayMap
   : public ArrayMapTemplate < TType , TTypeOfIndex , ArrayMap , ArrayMapFacade , Null >
{

};