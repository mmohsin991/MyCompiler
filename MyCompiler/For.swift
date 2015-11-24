//
//  For.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation




class For{
    
    // CFGs
    class func For()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecFor(className : String) -> Bool{
        
        return className == "FOR"
    }

    class func SecIncDec(className : String) -> Bool{
        return className == "INCBY" || className == "DECBY" || className == "{" 
    }
}
