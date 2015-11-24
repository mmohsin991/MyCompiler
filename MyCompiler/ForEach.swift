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
