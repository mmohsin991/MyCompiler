
//
//  ID.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation

class ID{
    
    // CFGs
    class func ID()->Bool{
        
        if SecID( globleTokens[globleIndex].classType){
            globleIndex++
            if ID_(){
                return true
            }
        }
        
        return false
    }
    
    
    class func ID_()->Bool{
        
        if globleTokens[globleIndex].classType == "["{
            globleIndex++
            if ID_Const.ID_Const(){
                if globleTokens[globleIndex].classType == "]"{
                    globleIndex++
                    if ID_(){
                        return true
                    }
                }
            }
        }
        else if Follow(globleTokens[globleIndex].classType){
            return true
        }
        
        return false
    }
    
    
    
    
    //Selection Sets
    
    class func SecID(className : String) -> Bool{
        
        return className == "Identifier"
    }
    
    
    class func Follow(className : String) -> Bool{
        // Assign, IncDec, ID_Const, VarDec, ID_Const, ForEach
        return className == "AssignmentOP" || className == "]" || VarDec.Follow(className) || ArrDec.Follow(className) || ID_Const.Follow(className) || className == "{"
    }
    
}