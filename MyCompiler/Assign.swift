//
//  Assign.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class Assign{
    
    // CFGs
    class func Assign()->Bool{
        
        if ID.ID() {
            if globleTokens[globleIndex].classType == "AssignmentOP" {
                globleIndex++
                if ID_Const_(){
                    return true
                }
            }
        }
        
        return false
    }
    
    class func ID_Const_() -> Bool{
        
        if FuncCall.FuncCall(){
            return true
        }
        else if Exp.Exp(){
            return true
        }
        else if Const.Const(){
            return true
        }

        
        return false
    }
    
    
    
    
    
    //Selection Sets
    
    class func SecAssign(className : String) -> Bool{
        
        return ID.SecID(className)
    }
    
    
    
    class func SecID_Const_(className : String) -> Bool{
        
        return Const.SecConst(className) ||  Exp.SecExp(className) || FuncCall.SecFuncCall(className)
    }
    
    
    
    class func Follow(className : String) -> Bool{
        // 
        return Body.SecMST(className)
    }
}