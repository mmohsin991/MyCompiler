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
        
        if ID_Arr() {
            if IncDec_(){
                return true
            }
        }
        
        
        
        return false
    }
    
    
    class func ID_Arr() -> Bool{
        if globleTokens[globleIndex].classType == "Identifier" {
            globleIndex++
            if Arr(){
                return true
            }
        }
        
        return false
    }
    
    
    class func IncDec_() -> Bool{
        // for ++ , --
        if globleTokens[globleIndex].classType == "INC/DEC" {
            globleIndex++
            return true
        }
        
        return false
    }
    
    
    class func Arr() -> Bool{
        if globleTokens[globleIndex].classType == "[" {
            globleIndex++
            if ID_Const.ID_Const(){
                if globleTokens[globleIndex].classType == "]" {
                    globleIndex++
                    if Arr(){
                        return true
                    }
                }
            }
        }
        else if SecIncDec_(globleTokens[globleIndex].classType)  {
            return true
        }
        
        return false
    }

    
    
    
    
    //Selection Sets
    
    class func SecIncDec(className : String) -> Bool{
        
        return ID.SecID(className)
    }
    
    class func SecIncDec_(className : String) -> Bool{
        
        return className == "INC/DEC" 
    }
    
    class func SecArr(className : String) -> Bool{
        
        return className == "[" || SecIncDec_(className)
    }
    
}