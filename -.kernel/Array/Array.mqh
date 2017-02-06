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

#include "../Object/Object.mqh"

// ----

interface ArrayFacade
   : public ObjectFacade
{

};

// ----

template < 
   typename TType               ,
   typename TObject             ,
   typename TObjectInterface    ,
   typename TObjectParent        
>
class ArrayTemplate
   : public Object < 
      TObject             , 
      TObjectInterface    ,
      TObjectParent       
   >
{

public
   :   
   ArrayTemplate
      (  )
      : Object( )
   {
      
   };
   
   // -
   
   TType items [ ];
   
   // -----
   
   void 
      reverse( bool flagAsSerie = false )
   {
      ArraySetAsSeries( items , flagAsSerie );
   };
   
   /**
    */
   bool 
      inject( TType & arraySrc [] , int start = 0 , int count = NULL ) 
   {
      return ( ArrayCopy( items , arraySrc , start , start , count ) <= 0 );
   };
         
   /**
    * Add Or Update( by index ) item 
    */
   bool 
      update( TType value , int candle = -1 )
   {
      int t = total( );
      if ( candle > t )
         return false;
   
      items [ candle > -1 && candle < t ? candle : resize( ) - 1 ] = value;
      return true;
   };
   
   /**
    * Get item by index
    */
   TType 
      get( int candle )
   {
      return getByCandle( candle );
   };
   
   /**
    * Get item by index
    */
   TType 
      getByCandle( int candle )
   {
      int t = total( );
      if( candle > t )
         return NULL;   
   
      return items[ candle < 0 ? t + candle : candle ];
   };
         
   /**
    */
   int 
      total( )
   {
      return ArraySize ( items );
   };   
   
   /**
    */
   int 
      resize( int growOf = 1 )
   {
      return ArrayResize ( items , total( ) + growOf );
   };
   
   /**
    * Get index by value
    * Only The first item found is returned
    */
   int 
      getIndex( TType value )
   {
      for 
         ( int i = 0 , t = total( ) ; i < t ; i++ )
      {
         if( items[ i ] == value )
            return i;         
      }
      return -1;
   };

protected
   :

   
};

// ----

template < 
   typename TType
>
class Array
   : public ArrayTemplate < TType , Array , ArrayFacade , Null >
{

public
   :
   Array
      (  )
      : ArrayTemplate( )
   {
      
   };
};