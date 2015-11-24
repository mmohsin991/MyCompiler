//
//  IncDec.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class IncDec{
    
    // CFGs
    class func IncDec()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecIncDec(className : String) -> Bool{
        
        return ID.SecID(className)
    }
    
    class func SecIncDec_(className : String) -> Bool{
        
        return className == "+" || className == "-"
    }
    
    class func SecArr(className : String) -> Bool{
        
        return className == "[" || SecIncDec_(className)
    }
    
}