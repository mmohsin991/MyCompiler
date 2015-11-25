//
//  ArrDec.swift
//  MyCompiler
//
//  Created by Mohsin on 24/11/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation




class ArrDec{
    
    // CFGs
    class func ArrDec()->Bool{

        if globleTokens[globleIndex].classType == "[" {
            globleIndex++
            if DT.DT(){
                if globleTokens[globleIndex].classType == "]" {
                    globleIndex++
                    if ArrDec_(){
                        if Init() {
                            return true
                        }
                    }
                }
            }
        }
        
        
        return false
    }
    
    
    class func ArrDec_()->Bool{
        
        if globleTokens[globleIndex].classType == "[" {
            globleIndex++
            if globleTokens[globleIndex].classType == "]" {
                globleIndex++
                if ArrDec_(){
                    return true
                }
            }
        }
        else if globleTokens[globleIndex].classType == "AssignmentOP" {
            return true
        }
        
        
        return false
    }
    
    
    
    
    class func Init()->Bool{
        
        if globleTokens[globleIndex].classType == "AssignmentOP" {
            globleIndex++
            if Init_() {
                return true
            }
        }
        
        
        
        return false
    }
    
    
    class func Init_()->Bool{
        
        if globleTokens[globleIndex].classType == "(" {
            globleIndex++
            if globleTokens[globleIndex].classType == ")" {
                globleIndex++
                if Init__(){
                    return true
                }
            }
        }
        else if ID.ID(){
            return true
        }
        else if Init___(){
            return true
        }
        
        
        return false
    }
    
    
    class func Init__()->Bool{
        
        if globleTokens[globleIndex].classType == "[" {
            globleIndex++
            if ID_Const.ID_Const(){
                if globleTokens[globleIndex].classType == "]" {
                    globleIndex++
                    if Init__(){
                        return true
                    }
                }
            }
        }
        else if Follow(globleTokens[globleIndex].classType){
            return true
        }
        
        return false
    }
    
    
    
    class func Init___()->Bool{
        
        if globleTokens[globleIndex].classType == "[" {
            globleIndex++
            if Val(){
                if globleTokens[globleIndex].classType == "]" {
                    globleIndex++
                    return true
                }
            }
        }
        
        
        
        return false
    }
    
    
    class func Val()->Bool{
        
        if globleTokens[globleIndex].classType == "[" {
            globleIndex++
            if Val() {
                if globleTokens[globleIndex].classType == "]" {
                    globleIndex++
                    if Val_() {
                        return true
                    }
                    
                }
            }
        }
        else if Val__(){
            return true
        }
        return false
    }
    
    class func Val_()->Bool{
        
        if Val() {
            return true
        }
        else if globleTokens[globleIndex].classType == "]"{
            return true
        }
        
        
        
        return false
    }
    
    class func Val__()->Bool{
        
        if Const.Const(){
            if globleTokens[globleIndex].classType == "," {
                globleIndex++
                if Val__() {
                    return true
                }
            }
        }
        else if globleTokens[globleIndex].classType == "]"{
            return true
        }
        
        return false
    }
    
    
    //Selection Sets
    
    class func SecArrDec(className : String) -> Bool{
        
        return className == "["
    }
    
    class func SecArrDec_(className : String) -> Bool{
        
        return className == "[" || className == "AssignmentOP"
    }
    
    class func SecInit(className : String) -> Bool{
        
        return className == "AssignmentOP"
    }
    class func SecInit_(className : String) -> Bool{
        
        return className == "(" || ID.SecID(className) || SecInit___(className)
    }
    
    class func SecInit__(className : String) -> Bool{
        
        return className == "[" || Follow(className)
    }
 
    class func SecInit___(className : String) -> Bool{
        
        return className == "["
    }
    
    class func SecVal(className : String) -> Bool{
        
        return className == "[" || SecVal__(className)
    }
    
    class func SecVal_(className : String) -> Bool{
        
        return SecVal(className) || className == "]"
    }
    
    class func SecVal__(className : String) -> Bool{
        
        return Const.SecConst(className) || className == "]"
    }
    
    
    
    class func Follow(className : String) -> Bool{
        
        return Body.SecMST(className)
    }
    
    
}