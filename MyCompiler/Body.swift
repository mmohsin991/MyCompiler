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
    class func Body()->Bool{
        
        if SST(){
            if MST(){
                return true
            }
        }
        
        return false
    }
    
    
    class func MST()->Bool{
        if SST(){
            if MST(){
                return true
            }
        }
            // follwo of body = "$$$" (End of File)
        else if globleTokens[globleIndex].value == "$$$" {
            globleIndex++
            return true
        }
        
        return false
    }
    
    class func SST()->Bool{
        
        if IF.If(){
            return true
        }
        else if Switch.Switch(){
            return true
        }
        else if For.For(){
            return true
        }
        else if ForEach.ForEach(){
            return true
        }
        else if VarDec.VarDec(){
            return true
        }
        else if ArrDec.ArrDec(){
            return true
        }
        else if While.While(){
            return true
        }
        else if DoWhile.DoWhile(){
            return true
        }
        else if IncDec.IncDec(){
            return true
        }
        else if Assign.Assign(){
            return true
        }
        else if Func.Func(){
            return true
        }
        else if FuncCall.FuncCall(){
            return true
        }
        
        
        return false
    }
    
    
    
    //Selection Sets
    
    class func SecBody(className : String) -> Bool{
        
        return  SecSST(className)
    }
    
    class func SecMST(className : String) -> Bool{
        
        return SecSST(className) || className == "}"
    }
    
    class func SecSST(className : String) -> Bool{
        
        return IF.SecIf(className) ||
            Switch.SecSwitch(className) ||
            For.SecFor(className) ||
            ForEach.SecForEach(className) ||
            VarDec.SecVarDec(className) ||
            ArrDec.SecArrDec(className) ||
            While.SecWhile(className) ||
            DoWhile.SecDoWhile(className) ||
            IncDec.SecIncDec(className) ||
            Assign.SecAssign(className) ||
            Func.SecFunc(className) ||
            FuncCall.SecFuncCall(className)
    }
}