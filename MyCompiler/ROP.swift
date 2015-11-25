//
//  ROP.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class ROP{
    
    // CFGs
    class func ROP()->Bool{
        
        if globleTokens[globleIndex].classType == "RelOP"{
            globleIndex++
            return true
        }
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecROP(className : String) -> Bool{
        
        return className == "RelOP"
    }
    
    
    class func Follow(className : String) -> Bool{
        //Cond
        return ID_Const.SecID_Const(className)
    }
    
    
}