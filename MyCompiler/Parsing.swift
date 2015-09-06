//
//  Compiler1.swift
//  MyCompiler
//
//  Created by Mohsin on 06/09/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



// mohsin
// for Identifier (start with small char then follow small, capital char or digit , eg : aBC, c2BC, cA4dC)

enum ParsingTypes{
    case MyIdentifier
    case IntConstatnt
    case StringConstatnt
    case FloatConstatnt
    case CharConstatnt
}


class Parsing{
    
    private class func myIdentifier(state : Int, char : Character) -> Int{
        
        var transitionTable = [[1,2,2],[1,1,1],[2,2,2]]
        
        if char >= "a" && char <= "z" {
            return transitionTable[state][0]
        }
        else if char >= "A" && char <= "Z" {
            return transitionTable[state][1]
        }
        if char >= "0" && char <= "9" {
            return transitionTable[state][2]
        }
        
        return 2
    }
    //
    private class func intConstatnt(state : Int, char : Character) -> Int{
        
        var transitionTable = [[1,1,2],[3,3,2],[3,3,2],[3,3,3]]
        
        if char == "+"{
            return transitionTable[state][0]
        }
        else if char == "-" {
            return transitionTable[state][1]
        }
        if char >= "0" && char <= "9" {
            return transitionTable[state][2]
        }
        
        return 3
    }
    
    
    private class func stringConstatnt(state : Int, char : Character) -> Int{
        
        var transitionTable = [[1,3],[2,1],[3,3],[3,3]]
        
        if char == "\""{
            return transitionTable[state][0]
        }
        else if char != "\"" {
            return transitionTable[state][1]
        }
        
        
        return 3
    }
    
    
    private class func floatConstatnt(state : Int, char : Character) -> Int{
        
        var transitionTable = [[1,1,1,6,5,5],[5,5,1,2,5,5],[5,5,2,5,3,5],[4,4,4,5,5,5],[5,5,4,5,5,5],[5,5,5,5,5,5],[5,5,2,5,5,5]]
        
        if char == "-" {
            return transitionTable[state][0]
        }
        else if char == "+" {
            return transitionTable[state][1]
        }
        else if char >= "0" && char <= "9"{
            return transitionTable[state][2]
        }
        else if char == "." {
            return transitionTable[state][3]
        }
        else if char == "e" {
            return transitionTable[state][4]
        }
            // all reamaining char
        else if char != "e" {
            return transitionTable[state][5]
        }
        
        return 3
    }
    
    //
    private class func charConstatnt(state : Int, char : Character) -> Int{
        
        var transitionTable = [[1,2,4,2],[4,3,4,4],[4,4,4,4],[4,4,4,4],[4,4,4,4]]
        
        if char == "\\"{
            return transitionTable[state][0]
        }
        else if char == "'"||char == "+"||char == "a"||char == "n"||char == "r"||char == "o"{
            return transitionTable[state][1]
        }
        else if char == "\""{
            return transitionTable[state][2]
        }
        else if char != "\""{
            return transitionTable[state][3]
        }
        
        
        return 3
    }
    
    
    
    
    
    
    private class func DFAParsing(inputStr : String, trasitionFunction: (Int,Character) -> Int, finalStates: [Int]) -> Bool{
        
        var state = 0 // assiging start state
        
        for str in inputStr{
            state = trasitionFunction(state,str)
        }
        for finalState in finalStates{
            if state == finalState{
                println("final state")
                return true
            }
        }
        
        println("No final state")
        return false
    }

    
    class func doParsing(value: String , pasringType : ParsingTypes) -> Bool{

        switch pasringType{
        case .CharConstatnt:
            return DFAParsing(value, trasitionFunction: charConstatnt, finalStates: [2,3])
        case .IntConstatnt:
            return DFAParsing(value, trasitionFunction: intConstatnt, finalStates: [2])
        case .FloatConstatnt:
            return DFAParsing(value, trasitionFunction: floatConstatnt, finalStates: [2,4])
        case .StringConstatnt:
            return DFAParsing(value, trasitionFunction: stringConstatnt, finalStates: [2])
        case .MyIdentifier:
            return DFAParsing(value, trasitionFunction: myIdentifier, finalStates: [1])
        }
        
        return false
    }
    
}




//
//// testing
//DFAParsing(input , transition function, [final states])

//DFAParsing("sNss1", myIdentifier, [1])
//DFAParsing("-112", intConstatnt, [2])
//DFAParsing("\"-112\"", stringConstatnt, [2])
//DFAParsing("a", charConstatnt, [2,3])
//DFAParsing("1.1e-1", floatConstatnt, [2,4])

