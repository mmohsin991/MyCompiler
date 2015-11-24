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
        
        return ID_Const.SecID_Const(className)
    }
    
    
    class func SecE_(className : String) -> Bool{
        
        return  className == "+" || className == "-" || className == "$"
    }
    
    class func SecT(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className)
    }
    
    class func SecT_(className : String) -> Bool{
        
        return  className == "*" || className == "/" || className == "%" || className == "+" || className == "-" ||  className == "$"
    }
    
    class func SecF(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className)
    }
    
    class func SecPM(className : String) -> Bool{
        
        return  className == "+" || className == "-"
    }
    
    class func SecMDM(className : String) -> Bool{
        
        return  className == "*" || className == "/" || className == "%"
    }
}