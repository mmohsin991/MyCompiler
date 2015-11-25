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
        
        
        if globleTokens[globleIndex].classType == "SWITCH"{
            globleIndex++
            if globleTokens[globleIndex].classType == "("{
                globleIndex++
                if Exp.Exp() {
                    if globleTokens[globleIndex].classType == ")"{
                        globleIndex++
                        if globleTokens[globleIndex].classType == "{"{
                            globleIndex++
                            if SwBody(){
                                if globleTokens[globleIndex].classType == "}"{
                                    globleIndex++
                                    return true
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
        
        return false
    }
    
    class func SwBody() -> Bool{
        
        if Case(){
            if globleTokens[globleIndex].classType == "DEFAULT"{
                globleIndex++
                if globleTokens[globleIndex].classType == ":"{
                    globleIndex++
                    if Body.Body(){
                        return true
                    }
                }
            }
        }
        
        
        return false
    }
    
    class func Case() -> Bool{
        
        if globleTokens[globleIndex].classType == "CASE"{
            globleIndex++
            if Const.Const(){
                if globleTokens[globleIndex].classType == ":"{
                    globleIndex++
                    if Body.Body(){
                        if GoTo(){
                            if Case(){
                                return true
                            }
                        }
                    }
                }
            }
        }
        else if globleTokens[globleIndex].classType == "DEFAULT"{
            return true
        }
        
        
        return false
    }
    
    class func GoTo() -> Bool{
        
        if globleTokens[globleIndex].classType == "GOTHROUGH"{
            globleIndex++
            return true
        }
        else if SecCase(globleTokens[globleIndex].classType){
            return true
        }
        
        
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

