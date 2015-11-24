//
//  VarDec.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright © 2015 Mohsin. All rights reserved.
//

import Foundation



class VarDec{
    
    // CFGs
    class func VarDec()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecVarDec(className : String) -> Bool{
        
        return className == "Var"
    }
    
    class func SecInit(className : String) -> Bool{
        
        return className == "=" || Body.SecSST(className)
    }
    
    class func SecInit_(className : String) -> Bool{
        
        return Const.SecConst(className) || ID.SecID(className) || Exp.SecExp(className)
    }
}