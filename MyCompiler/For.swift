//
//  For.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation




class For{
    
    // CFGs
    class func For()->Bool{
        
        if globleTokens[globleIndex].classType == "FOR" {
            globleIndex++
            if globleTokens[globleIndex].classType == "Identifier" {
                globleIndex++
                if globleTokens[globleIndex].classType == "IN" {
                    globleIndex++
                    if ID_Const.ID_Const(){
                        if globleTokens[globleIndex].classType == "TO" {
                            globleIndex++
                            if ID_Const.ID_Const(){
                                if IncDec(){
                                    if globleTokens[globleIndex].classType == "{" {
                                        globleIndex++
                                        if Body.Body(){
                                            if globleTokens[globleIndex].classType == "}" {
                                                globleIndex++
                                                return true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }
        
        
        
        
        return false
    }
    
    
    class func IncDec()->Bool{
        if globleTokens[globleIndex].classType == "INCBY" {
            globleIndex++
            if Const.Const() {
                return true
            }
        }
        else if globleTokens[globleIndex].classType == "DECBY" {
            globleIndex++
            if Const.Const() {
                return true
            }
        }
        else if globleTokens[globleIndex].classType == "{" {
            return true
        }
        
        
        return false
    }
    
    
    
    
    //Selection Sets
    
    class func SecFor(className : String) -> Bool{
        
        return className == "FOR"
    }

    class func SecIncDec(className : String) -> Bool{
        return className == "INCBY" || className == "DECBY" || className == "{" 
    }
}
