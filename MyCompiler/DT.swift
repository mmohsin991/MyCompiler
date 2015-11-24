//
//  DT.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class DT{
    
    // CFGs
    class func DT()->Bool{
        
        return false
    }

    
    
    //Selection Sets
    
    class func SecDT(className : String) -> Bool{
        
        return className == "VOID" || className == "ARRAY" || SecDT_(className)
    }
    
    
    
    class func SecDT_(className : String) -> Bool{
        
        return className == "DataType"
    }
    
}