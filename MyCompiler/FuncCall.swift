//
//  FuncCall.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class FuncCall{
    
    // CFGs
    class func FuncCall()->Bool{
        let tempIndex = globleIndex

        if globleTokens[globleIndex].classType == "Identifier"{
            globleIndex++
            if globleTokens[globleIndex].classType == "("{
                globleIndex++
                if Arg(){
                    if globleTokens[globleIndex].classType == ")"{
                        globleIndex++
                        return true
                    }
                }
            }
        }
        
        globleIndex = tempIndex
        return false
    }
    
    
    
    class func Arg()->Bool{
        
        if ID_Const.ID_Const(){
            if globleTokens[globleIndex].classType == ","{
                globleIndex++
                if Arg(){
                    return true
                }
            }
        }
        else if globleTokens[globleIndex].classType == ")"{
            return true
            
        }
        
        
        return false
    }
    
    
    
    
    //Selection Sets
    
    class func SecFuncCall(className : String) -> Bool{
        
        return ID.SecID(className)
    }
    
    class func SecArg(className : String) -> Bool{
        return ID_Const.SecID_Const(className) || className == ")"
    }
}