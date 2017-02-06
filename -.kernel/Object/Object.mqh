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

#include "./Null.mqh"

// -----

interface ObjectFacade
{

};

// -----

template < 
   typename TObject       ,
   typename TObjectFacade ,
   typename TObjectParent       
>
class Object
   : public TObjectFacade
{

TObjectParent * objectParent;

public
   :   
   
   virtual 
   TObjectParent * 
      end 
      ( )
   {
      return parent( );
   };

protected
   :
   
virtual 
   TObjectFacade *
      facade
      ( )
   {
      return pointer( );
   };
   
virtual 
   TObjectParent *
      parent 
      ( )
   {
      return objectParent;
   };

virtual 
   TObject * 
      parent 
      ( TObjectParent * parent )
   {
      objectParent = parent;
      return pointer( );
   };

   TObject *
      pointer
         ( )
   {
      return GetPointer( this );
   };
   
};