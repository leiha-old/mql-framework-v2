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

template < typename T , typename TT >
class ArrayMap {

public
   :  
   
   Array < T   > * index ;
   Array < TT  > * items ;   
   
   ArrayMap( ) 
   {
      index = new Array < T  > ( );
      items = new Array < TT > ( );
   };
   
   void enableReverse( int isSerie = false )
   {
      items.enableReverse( isSerie );
      index.enableReverse( isSerie );
   };
   
   /**
    * Add / Update item
    */
   bool update
      ( T name , TT item )
   {
      int i = index.indexOf( name );
      if( i > -1 ) {
         items.items[ i ] = item;
         return true;
      } 
      else {
         items.update( item );
         index.update( name );
      }
      return false;
   };
   
   /**
    * Get item by index
    */
   TT get( T name )
   {
      int i = index.indexOf( name );
      if( i > -1 ) {
         return items.items[ i ];
      }
      return NULL ;
   };
   
   /**
    * Get item by index
    */
   TT 
      getByPrimaryIndex( int primaryIndex )
   {
      return items.getByPrimaryIndex( primaryIndex );
   };
   
   /**
    * Get index by value
    * Only The first item found is returned
    */
   T 
      indexOf( TT item )
   {
      for 
         ( int i = 0 , t = index.total( ) ; i < t ; i++ )
      {
         if( items.items[ i ] == item ) {
            return index.items[ i ];
         }            
      }
      return NULL;
   };
   
   /**
    */
   int total( )
   {
      return index.total();
   };
   
   /**
    */
   bool 
      copy ( T & arrayIndex [] , TT & arrayItems [] ) 
   {
      return ( index.copy( arrayIndex ) && items.copy( arrayItems ) );
   };
   
   /**
    */
   bool 
      copy ( Array < T > * arrayIndex ,  Array < TT > * arrayItems ) 
   {
      return copy( arrayIndex.items , arrayItems.items );
   };
   
};