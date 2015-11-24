//
//  Conf.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class Cond{
    
    // CFGs
    class func Cond()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecCond(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className)
    }
    
    
    
    class func SecCond_(className : String) -> Bool{
        // first(logica)
        return className == "Logical" || Follow(className)
    }
    
    class func Follow(className : String) -> Bool{
        
        return className == "$"
    }
    
}