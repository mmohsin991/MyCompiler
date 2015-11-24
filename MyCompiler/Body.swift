//
//  Body.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class Body{
    
    // CFGs
    class func VarDec()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecSST(className : String) -> Bool{
        
        return className == "Var"
    }
    
    class func SecMST(className : String) -> Bool{
        
        return className == "="
    }
}