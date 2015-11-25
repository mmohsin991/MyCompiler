//
//  IF.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class IF{
    
    // CFGs
    class func If()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecIf(className : String) -> Bool{
        
        return className == "IF"
    }
    
    class func SecElse(className : String) -> Bool{
        return className == "ELSE" || Follow(className)
    }
    
    class func SecIf_(className : String) -> Bool{
        return className == "IF" || className == "{"
    }


    class func Follow(className : String) -> Bool{
        
        return Body.SecMST(className)
    }

}