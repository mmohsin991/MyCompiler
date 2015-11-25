//
//  DoWhile.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class DoWhile{
    
    // CFGs
    class func DoWhile()->Bool{
        
        if globleTokens[globleIndex].classType == "DO" {
            globleIndex++
            if globleTokens[globleIndex].classType == "{" {
                globleIndex++
                if Body.Body(){
                    if globleTokens[globleIndex].classType == "}" {
                        globleIndex++
                        if globleTokens[globleIndex].classType == "WHILE" {
                            globleIndex++
                            if globleTokens[globleIndex].classType == "(" {
                                globleIndex++
                                if Cond.Cond(){
                                    if globleTokens[globleIndex].classType == ")" {
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
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecDoWhile(className : String) -> Bool{
        
        return className == "DO"
    }
    
}