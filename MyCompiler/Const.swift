
//
//  Const.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation

class Const{
    
    // CFGs
    class func VarDec()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecConst(className : String) -> Bool{
        
        return className == "FloatConstant" || className == "CharConstant" || className == "BoolConstant" || className == "StringConstant" || className == "IntConstant"
    }

}