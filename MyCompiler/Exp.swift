//
//  Exp.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class Exp{
    
    // CFGs
    class func Exp()->Bool{
        
        let tempIndex = globleIndex

        if T(){
            if E_(){
                return true
            }
        }
        
        globleIndex = tempIndex
        return false
    }
    
    
    class func T()->Bool{
        
        if F(){
            if T_(){
                return true
            }
        }
        
        return false
    }
    
    class func T_()->Bool{
        
        if MDM() {
            if F() {
                if T_(){
                    return true
                }
            }
        }
        else if globleTokens[globleIndex].classType == "+" ||  globleTokens[globleIndex].classType == "-" || Follow(globleTokens[globleIndex].classType){
            return true
        }
        
        
        return false
    }
    
    class func E_()->Bool{
        
        if PM(){
            if T(){
                if E_(){
                    return true
                }
            }
        }
        else if Follow(globleTokens[globleIndex].classType){
            return true
        }
        
        
        return false
    }
    
    class func F()->Bool{
        
        if ID_Const.ID_Const() {
            return true
        }
        
        return false
    }
    
    
    class func PM()->Bool{
        
        if globleTokens[globleIndex].classType == "+" || globleTokens[globleIndex].classType == "-"{
            globleIndex++
            return true
        
        }
        
        return false
    }
    
    class func MDM()->Bool{
        
        if globleTokens[globleIndex].classType == "*" || globleTokens[globleIndex].classType == "/" || globleTokens[globleIndex].classType == "%"{
            globleIndex++
            return true
            
        }
        
        return false
    }
    
    //Selection Sets
    
    class func SecExp(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className)
    }
    
    
    class func SecE_(className : String) -> Bool{
        
        return  className == "+" || className == "-" || Follow(className)
    }
    
    class func SecT(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className)
    }
    
    class func SecT_(className : String) -> Bool{
        
        return  className == "*" || className == "/" || className == "%" || className == "+" || className == "-" ||  Follow(className)
    }
    
    class func SecF(className : String) -> Bool{
        
        return ID_Const.SecID_Const(className)
    }
    
    class func SecPM(className : String) -> Bool{
        
        return  className == "+" || className == "-"
    }
    
    class func SecMDM(className : String) -> Bool{
        
        return  className == "*" || className == "/" || className == "%"
    }
    
    
    class func Follow(className : String) -> Bool{
        // Assign, switch
        return  Assign.Follow(className) || className == ")"
    }
    
    
}