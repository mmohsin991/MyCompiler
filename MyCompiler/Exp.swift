//
//  Exp.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class Exp{
    
    // CFGs
    class func VarDec()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecExp(className : String) -> Bool{
        
        return ID.SecID(className) || Const.SecConst(className)
    }
    
    
    class func SecExp_(className : String) -> Bool{
        
        return  className == "+" || className == "-" || className == "$"
    }
    
    class func SecMST(className : String) -> Bool{
        
        return className == "="
    }
}