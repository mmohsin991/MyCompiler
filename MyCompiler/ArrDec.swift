//
//  ArrDec.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation




class ArrDec{
    
    // CFGs
    class func ArrDec()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecArrDec(className : String) -> Bool{
        
        return className == "VAR"
    }
    
    class func SecArrDec_(className : String) -> Bool{
        
        return className == "[" || className == "AssignmentOP"
    }
    
    class func SecInit(className : String) -> Bool{
        
        return className == "AssignmentOP"
    }
    class func SecInit_(className : String) -> Bool{
        
        return className == "(" || ID.SecID(className) || SecInit___(className)
    }
    
    class func SecInit__(className : String) -> Bool{
        
        return className == "[" || Follow(className)
    }
 
    class func SecInit___(className : String) -> Bool{
        
        return className == "["
    }
    
    class func SecVal(className : String) -> Bool{
        
        return className == "[" || SecVal__(className)
    }
    
    class func SecVal_(className : String) -> Bool{
        
        return SecVal(className) || className == "]"
    }
    
    class func SecVal__(className : String) -> Bool{
        
        return Const.SecConst(className) || className == "]"
    }
    
    
    class func Follow(className : String) -> Bool{
        
        return className == "$"
    }
    
    
}