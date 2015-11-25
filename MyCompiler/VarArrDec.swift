//
//  VarArrDec.swift
//  MyCompiler
//
//  Created by Mohsin on 25/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation




class VarArrDec{
    
    // CFGs
    class func VarArrDec()->Bool{
        
        if globleTokens[globleIndex].classType == "VAR" {
            globleIndex++
            if ID.SecID(globleTokens[globleIndex].classType){
                globleIndex++
                if globleTokens[globleIndex].classType == ":" {
                    globleIndex++
                    if VarArrDec_(){
                        return true
                    }
                }
            }
        }
        
        
        
        return false
    }
    
    
    class func VarArrDec_()->Bool{
        
        if VarDec.VarDec(){
            return true
        }
        else if ArrDec.ArrDec(){
            return true
        }
        
        
        
        
        return false
    }
    
    
    
    //Selection Sets
    
    class func SecVarDec(className : String) -> Bool{
        
        return className == "AssignmentOP"
    }
    
    class func SecVarDec_(className : String) -> Bool{
        
        return VarDec.SecVarDec(className) || ArrDec.SecArrDec(className)
    }
    
    
    
    
    class func Follow(className : String) -> Bool{
        
        return Body.SecMST(className)
    }
    
    
}