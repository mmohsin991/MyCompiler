//
//  Func.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class Func{
    
    // CFGs
    class func Func()->Bool{
        
        if globleTokens[globleIndex].classType == "FUNC"{
            globleIndex++
            if globleTokens[globleIndex].classType == "Identifier"{
                globleIndex++
                if globleTokens[globleIndex].classType == "("{
                    globleIndex++
                    if Args(){
                        if globleTokens[globleIndex].classType == ")"{
                            globleIndex++
                            if DT.DT(){
                                if globleTokens[globleIndex].classType == "{"{
                                    globleIndex++
                                    if Body.Body(){
                                        if globleTokens[globleIndex].classType == "}"{
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
        
        return false
    }
    
    
    class func Args()->Bool{
        
        if globleTokens[globleIndex].classType == "Identifier"{
            globleIndex++
            if globleTokens[globleIndex].classType == ":"{
                globleIndex++
                if DT.DT(){
                    if globleTokens[globleIndex].classType == ","{
                        globleIndex++
                        if Args() {
                            return true
                        }
                    }
                }
            }
        }
        else if globleTokens[globleIndex].classType == ")"{
            return true
            
        }
        
        
        return false
    }
    
    
    
    
    //Selection Sets
    
    class func SecFunc(className : String) -> Bool{
        
        return className == "FUNC"
    }
    
    class func SecArgs(className : String) -> Bool{
        return ID.SecID(className) || className == ")"
    }
}