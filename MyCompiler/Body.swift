//
//  Body.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class Body{
    
    // CFGs
    class func Body()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecBody(className : String) -> Bool{
        
        return  SecSST(className)
    }
    
    class func SecMST(className : String) -> Bool{
        
        return SecSST(className) || className == "}"
    }
    
    class func SecSST(className : String) -> Bool{
        
        return IF.SecIf(className) ||
            Switch.SecSwitch(className) ||
            For.SecFor(className) ||
            ForEach.SecForEach(className) ||
            VarDec.SecVarDec(className) ||
            ArrDec.SecArrDec(className) ||
            While.SecWhile(className) ||
            DoWhile.SecDoWhile(className) ||
            IncDec.SecIncDec(className) ||
            Assign.SecAssign(className) ||
            Func.SecFunc(className) ||
            FuncCall.SecFuncCall(className)
    }
}