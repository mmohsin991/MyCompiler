//
//  IF.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class IF{
    
    // CFGs
    class func If()->Bool{
        
        if globleTokens[globleIndex].classType == "IF" {
            globleIndex++
            if globleTokens[globleIndex].classType == "(" {
                globleIndex++
                if Cond.Cond(){
                    if globleTokens[globleIndex].classType == ")" {
                        globleIndex++
                        if globleTokens[globleIndex].classType == "{" {
                            globleIndex++
                            if Body.Body(){
                                if globleTokens[globleIndex].classType == "}" {
                                    globleIndex++
                                    if Else() {
                                        return true
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
    
        

    class func Else() -> Bool{
        
        
        if globleTokens[globleIndex].classType == "ELSE" {
            globleIndex++
            if IF_() {
                return true
            }
        }
        else if Follow(globleTokens[globleIndex].classType){
            return true
        }
        
        
        return false
    }
    
    
    class func IF_() -> Bool{
        
        
        if globleTokens[globleIndex].classType == "IF" {
            globleIndex++
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
        else if globleTokens[globleIndex].classType == "{" {
            globleIndex++
            if Body.Body(){
                if globleTokens[globleIndex].classType == "}" {
                    globleIndex++
                    return true
                }
            }
        }
        
        return false
    }
    
    
    
    //Selection Sets
    
    class func SecIf(className : String) -> Bool{
        
        return className == "IF"
    }
    
    class func SecElse(className : String) -> Bool{
        return className == "ELSE" || Follow(className)
    }
    
    class func SecIf_(className : String) -> Bool{
        return className == "IF" || className == "{"
    }


    class func Follow(className : String) -> Bool{
        
        return Body.SecMST(className)
    }

}