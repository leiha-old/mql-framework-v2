
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------

#include "./WorkSpace.mqh"

template < typename T >
class Expert 
   : public WorkSpace < T >
{

public 
   :
   
   virtual void 
      onInit( ) 
   {  
      
   };
   
   virtual void 
      onDeInit( const int reason )
   {  
      
   };
   
   virtual void 
      onTick ( ) 
   {  
      
   };
};