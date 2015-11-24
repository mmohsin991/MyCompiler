//
//  ID_Const.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class ID_Const{
    
    // CFGs
    class func ID_Const()->Bool{
        
        if ID.ID() {
            return true
        }
        else if Const.Const() {
            return true
        }
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecID_Const(className : String) -> Bool{
    
        return ID.SecID(className) || Const.SecConst(className)
    }

}