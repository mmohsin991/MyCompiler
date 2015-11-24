//
//  Switch.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation





class Switch{
    
    // CFGs
    class func Switch()->Bool{
        
        
        return false
    }
    
    
    
    
    
    
    //Selection Sets
    
    class func SecSwitch(className : String) -> Bool{
        
        return className == "SWITCH"
    }
    
    class func SecSwBody(className : String) -> Bool{
        return className == "CASE" || className == "DEFAULT"
    }
    
    class func SecCase(className : String) -> Bool{
        return className == "CASE" || className == "DEFAULT"
    }
    
    class func SecGoTo(className : String) -> Bool{
        return className == "GOTHROUGH" || SecCase(className)
    }
}

