//
//  DT.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class DT{
    
    // CFGs
    class func DT()->Bool{
        if globleTokens[globleIndex].classType == "ARRAY" {
            globleIndex++
            if globleTokens[globleIndex].value == "<" {
                globleIndex++
                if DT_(){
                    if globleTokens[globleIndex].value == ">" {
                        globleIndex++
                        return true
                    }
                }
            }
        }
        else if globleTokens[globleIndex].classType == "VOID"{
            globleIndex++
            return true
        }
        else if DT_(){
            return true
        }
        
        return false
    }

    
    class func DT_()->Bool{
        if globleTokens[globleIndex].classType == "DataType" {
            globleIndex++
            return true
        }
        
        return false
    }
    
    
    
    
    //Selection Sets
    
    class func SecDT(className : String) -> Bool{
        
        return className == "VOID" || className == "ARRAY" || SecDT_(className)
    }
    
    
    
    class func SecDT_(className : String) -> Bool{
        
        return className == "DataType"
    }
    
}