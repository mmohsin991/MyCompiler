//
//  Func.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class Func{
    
    // CFGs
    class func Func()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecFunc(className : String) -> Bool{
        
        return className == "FUNC"
    }
    
    class func SecArgs(className : String) -> Bool{
        return ID.SecID(className) || className == ")"
    }
}