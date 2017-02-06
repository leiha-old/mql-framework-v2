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

//#include "./PositionOpenWhen.mqh"


// -----
/**
 * CLASS  : ExpertPositionOpen
 * --------------------
 */
template < 
   typename TObject,
   typename TPositionParent
>
class ExpertPositionOpenTemplate
   : public Object < TObject , NullI , TPositionParent >
{

//Array < ExpertPositionOpenWhen < TPositionParent , TObject > * > _whens;

public 
   :       
   ExpertPositionOpenTemplate ( )
      : Object ( )        
   {
      
   };
   
   // -
   
   /*
   ExpertPositionOpenWhen < TPositionParent , TObject > *
      when ( bool state , Signal * signal ) 
   {
      ExpertPositionOpenWhen < TPositionParent , TObject > * when = new ExpertPositionOpenWhen < TPositionParent , TObject > ( );
      _whens.update( when );
      return when;
   };*/
   
   TObject * 
      close  ( ) 
   {
      return pointer( );
   };  
   
   TObject * 
      modify  ( double volume ) 
   {
      return pointer( );
   };
   
   TObject * 
      iterate ()
   {
      /*for( int i = 0 , t = _whens.total( ) ; i < t ; i++ )
      {
         _whens.items[ i ].iterate( );
      };*/
      
      return pointer( );
   };

};

// -----
/**
 * CLASS  : ExpertPositionOpen
 * --------------------
 */
template < 
   typename TPositionParent
>
class ExpertPositionOpen
   : public ExpertPositionOpenTemplate < ExpertPositionOpen < TPositionParent > , TPositionParent >
{

public 
   :       
   ExpertPositionOpen ( )
      : ExpertPositionOpenTemplate ( )        
   {
      
   };
};