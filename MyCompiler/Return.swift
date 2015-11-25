//
//  Return.swift
//  MyCompiler
//
//  Created by Mohsin on 26/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class Return{
    
    // CFGs
    class func Return()->Bool{
        
        if globleTokens[globleIndex].classType == "RETURN" {
            globleIndex++
            if Return_(){
                return true
            }
        }
        
        return false
    }
    
    class func Return_() -> Bool{
        
        if ID_Const.ID_Const(){
            return true
        }
        else if Exp.Exp(){
            return true
        }
        
        return false
    }
    
    
    
    
    
    //Selection Sets
    
    class func SecReturn(className : String) -> Bool{
        
        return className == "RETURN"
    }
    
    
    
    class func SecReturn_(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className) ||  Exp.SecExp(className)
    }
    
    
    
    class func Follow(className : String) -> Bool{
        //
        return Body.SecMST(className)
    }
}