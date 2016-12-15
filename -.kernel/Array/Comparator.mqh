// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

template < typename T , typename TT >
class ArrayComparator
   : public Object
{

TT * arraySrc;

public
   :
   
   ArrayComparator 
      ( TT * array )
         : arraySrc ( array )
   {
   
   };
   
   bool 
      isInferior
         ( T value , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] < value );
   };
   
   bool 
      isInferior
         ( TT * array , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] < array.data.items[ candle ] );
   };
   
   // ---
   
   bool 
      isInferiorOrEqual  
         ( T value , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] <= value );
   };
   
   bool 
      isInferiorOrEqual  
         ( TT * array , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] <= array.data.items[ candle ] );
   };
   
   // ---
   
   bool 
      isEqual            
         ( T value , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] == value );
   };
   
   bool 
      isEqual            
         ( TT * array , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] == array.data.items[ candle ] );
   };
   
   // ---
   
   bool 
      isSuperiorOrEqual  
         ( T value , int candle = 0 )
   {
      return ( arraySrc.data.items[ candle ] >= value );
   };
   
   bool 
      isSuperiorOrEqual  
         ( TT * array , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] >= array.data.items[ candle ] );
   };
   
   // ---
   
   bool
      isSuperior
         ( T value , int candle = 0 )
   {
      return ( arraySrc.data.items[ candle ] > value );
   };
   
   bool
      isSuperior
         ( TT * array , int candle = 0 ) 
   {
      return ( arraySrc.data.items[ candle ] > array.data.items[ candle ] );
   };
};