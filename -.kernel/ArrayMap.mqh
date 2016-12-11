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
class ArrayMap 
   : public Array < TT  >
{

public
   :  
   
   Array < T   > * index ;   
   
   ArrayMap( int isSerie = false ) 
      : Array ( )
   {
      index = new Array < T  > ( );
      enableReverse( isSerie );
   };
   
   void enableReverse( int isSerie = false )
   {
      Array < TT >::enableReverse( isSerie );
      index. enableReverse( isSerie );
   };
   
   /**
    * Add / Update item
    */
   ArrayMap < T , TT > *
      update
         ( T name , TT item )
   {
      int i = index.indexOf( name );
      if( i > -1 ) {
         items[ i ] = item;
         //return true;
      } 
      else {
         update( item );
         index.update( name );
      }
      return pointer( );
   };
   
   /**
    * Get item by index
    */
   TT get( T name )
   {
      int i = index.indexOf( name );
      if( i > -1 ) {
         return items[ i ];
      }
      return NULL ;
   };
   
   /**
    * Get item by index
    */
   TT 
      getByPrimaryIndex( int primaryIndex )
   {
      return Array < TT >::getByPrimaryIndex( primaryIndex );
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
         if( items[ i ] == item ) {
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
};