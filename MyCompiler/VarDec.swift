//
//  VarDec.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright © 2015 Mohsin. All rights reserved.
//

import Foundation



class VarDec{
    
    // CFGs
    class func VarDec()->Bool{
        
        if globleTokens[globleIndex].classType == "VAR" {
            globleIndex++
            if ID.SecID(globleTokens[globleIndex].classType){
                globleIndex++
                if globleTokens[globleIndex].classType == ":" {
                    globleIndex++
                    if DT.DT(){
                        if Init(){
                            return true
                        }
                    }
                }
            }
        }
        
        
        
        return false
    }
    
    
    class func Init()->Bool{
        
        if globleTokens[globleIndex].classType == "AssignmentOP" {
            globleIndex++
            if Init_(){
                return true
            }
           
        }
        else if SecInit(globleTokens[globleIndex].classType)  {
            return true
        }
        
        
        
        return false
    }
    
    class func Init_()->Bool{
        
        if Const.Const() || ID.ID() || Exp.Exp(){
            return true
        }
        
        
        return false
    }
    
    
    //Selection Sets
    
    class func SecVarDec(className : String) -> Bool{
        
        return className == "VAR"
    }
    
    class func SecInit(className : String) -> Bool{
        
        return className == "AssignmentOP" || Body.SecSST(className)
    }
    
    class func SecInit_(className : String) -> Bool{
        
        return Const.SecConst(className) || ID.SecID(className) || Exp.SecExp(className)
    }
}