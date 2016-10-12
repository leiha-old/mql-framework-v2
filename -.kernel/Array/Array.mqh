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

template < typename T >
class Array {

public
   :
   
   T items [ ];
   
   Array
      ( bool reverseMode = false )      
   {
      enableReverse( reverseMode ) ;
   };
   
   virtual void 
      enableReverse( int isSerie = false )
   {
      ArraySetAsSeries( items , isSerie );
   };
         
   /**
    * Add Or Update( by index ) item 
    */
   bool 
      update( T value , int index = -1 )
   {
      if ( index < total( ) ) {
         if ( index == -1 ) {
            items [ resize( ) - 1 ] = value;
         }
         else {
            items[ index ] = value ;
         }   
         return true;
      }
      return false;
   };
   
   /**
    * Get item by index
    */
   T 
      get( int index )
   {
      return getByPrimaryIndex( index );
   };
   
   /**
    * Get item by index
    */
   T 
      getByPrimaryIndex( int index )
   {
      int t = total( );
      
      if ( index < 0 ) 
      {
         index = t + index;
         if ( index >= 0 ) {
            return items[ index ] ;
         }
      }else if ( t > index ) {
         return items[ index ] ;
      }      
      
      return NULL ;
   };
         
   /**
    * Get index by value
    * Only The first item found is returned
    */
   int 
      indexOf( T value )
   {
      for 
         ( int i = 0 , t = total( ) ; i < t ; i++ )
      {
         if( items[ i ] == value ) {
            return i;
         }            
      }
      return -1;
   };
   
   /**
    */
   int 
      total( )
   {
      int t = ArraySize ( items ) ;
      return t;
   };   
   
   /**
    */
   int 
      resize( int growOf = 1 )
   {
      int t = ArrayResize ( items , total( ) + growOf );
      return t;
   };
   
   /**
    */
   bool 
      hydrate ( T & arraySrc [] , int start = 0 , int count = NULL , int startSrc = NULL ) 
   {
      return ( ArrayCopy( 
         items , arraySrc , start , startSrc == NULL ? start : startSrc , count ) <= 0 
      );
   };
   
    
      
};