//
//  ForE.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class ForEach{
    
    // CFGs
    class func ForEach()->Bool{
        
        if globleTokens[globleIndex].classType == "FORE" {
            globleIndex++
            if ID_() {
                if globleTokens[globleIndex].classType == "IN" {
                    globleIndex++
                    if ID.ID() {
                        if globleTokens[globleIndex].classType == "{" {
                            globleIndex++
                            if Body.Body() {
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
        
        return false
    }
    
   
    
    class func ID_()->Bool{
        
        if globleTokens[globleIndex].classType == "Identifier" {
            globleIndex++
            if globleTokens[globleIndex].classType == ":" {
                globleIndex++
                if DT.DT(){
                    return true
                }
            }
        }
        
        return false
    }
    
    
    
    
    
    //Selection Sets
    
    class func SecForEach(className : String) -> Bool{
        
        return className == "FORE"
    }
    
    class func SecID_(className : String) -> Bool{
        return ID.SecID(className)
    }
}
