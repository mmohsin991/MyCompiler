//
//  FuncCall.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class FuncCall{
    
    // CFGs
    class func FuncCall()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecFuncCall(className : String) -> Bool{
        
        return ID.SecID(className)
    }
    
    class func SecArg(className : String) -> Bool{
        return ID_Const.SecID_Const(className) || className == ")"
    }
}