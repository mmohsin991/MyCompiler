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
        
        return false
    }
    
    
    
    //Selection Sets
    
    class func SecAssign(className : String) -> Bool{
        
        return ID.SecID(className)
    }
    
    
    
    class func SecID_Const_(className : String) -> Bool{
        
        return Const.SecConst(className) ||  Exp.SecExp(className)
    }
    
    
    
    class func Follow(className : String) -> Bool{
        // 
        return Body.SecMST(className)
    }
}