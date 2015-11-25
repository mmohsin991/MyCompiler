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
        
        
        if ID_Const.ID_Const() {
            if ROP.ROP() {
                if ID_Const.ID_Const() {
                    if Cond_() {
                        return true
                    }
                }
            }
        }
        

        return false
    }
    
    
    class func Cond_()->Bool{
        
        
        if Logic(){
            if Cond(){
                return true
            }
        }
        else if Follow(globleTokens[globleIndex].classType){
            return true
        }
        
        return false
    }
    
    
    
    class func Logic()->Bool{
        
        // for && or || logical op
        if globleTokens[globleIndex].classType == "Logical" {
            globleIndex++
            return true
        }
        
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
        // IF, While, Do While
        return className == ")"
    }
    
}