//
//  Compiler3.swift
//  MyCompiler
//
//  Created by Mohsin on 06/09/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class MyToken {
    var value : String
    var classType : String
    var lineNumber : String
    
    init(value: String, classType: String, lineNumber: String){
        self.value = value
        self.classType = classType
        self.lineNumber = lineNumber
    }
    
    func decs(){
        println("value: \(self.value)")
        println("classType: \(self.classType)")
        println("lineNumber: \(self.lineNumber)")
    }
    
}



func isPunctuator(char : Character) -> Bool{
    
    switch char {
        // punctutators
    case " " :
        return true
    case "\n" :
        return true
    case "{" :
        return true
    case "}" :
        return true
    case "[" :
        return true
    case "]" :
        return true
    case "(" :
        return true
    case ")" :
        return true
    case ";" :
        return true
    case ":" :
        return true
    case "," :
        return true
        
        
    default:
        return false
    }
    
}


func stringToMyToken(str : String, lineNumber : String) -> MyToken{
    
    // for Float contant
    if DFAParsing(str, floatConstatnt, [2,4]){
        return MyToken(value: str, classType: "FloatConstant", lineNumber: lineNumber)
    }
        // for Character contant
    else if str[str.startIndex] == "'" && str[str.endIndex.predecessor()] == "'"{
        var str1 = str
        str1.removeAtIndex(str1.startIndex)
        str1.removeAtIndex(str1.endIndex.predecessor())
        if DFAParsing(str1, charConstatnt, [2,3]){
            return MyToken(value: str1, classType: "CharConstant", lineNumber: lineNumber)
        }
        else{
            return MyToken(value: str1, classType: "SYNTAX ERROR", lineNumber: lineNumber)
        }
    }
        // for String contant
    else if DFAParsing(str, stringConstatnt, [2]) {
        var str1 = str
        str1.removeAtIndex(str1.startIndex)
        str1.removeAtIndex(str1.endIndex.predecessor())
        return MyToken(value: str1, classType: "String Constant", lineNumber: lineNumber)
    }
        // for Int contant
    else if DFAParsing(str, intConstatnt, [2]) {
        return MyToken(value: str, classType: "Int Constant", lineNumber: lineNumber)
        
    }
        
        
        // if its a punctuattor then it should be a count 1
    else if isPunctuator(str[str.startIndex]){
        if count(str) == 1{
            return MyToken(value: str, classType: str, lineNumber: lineNumber)
        }
        else{
            return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
        }
    }
        // for Assignment and Rel Operators(only <=, >=, !=, ==)
    else if str[str.endIndex.predecessor()] == "="{
        if count(str) == 1 {
            return MyToken(value: str, classType: "AssignmentOP", lineNumber: lineNumber)
        }
        else if count(str) == 2 {
            // Assignment Operator
            if str[str.startIndex] == "+" || str[str.startIndex] == "-" || str[str.startIndex] == "*" || str[str.startIndex] == "/"{
                return MyToken(value: str, classType: "AssignmentOP", lineNumber: lineNumber)
            }
                // Relational Operator
            else if str[str.startIndex] == "!" || str[str.startIndex] == "=" || str[str.startIndex] == "<" || str[str.startIndex] == ">"{
                return MyToken(value: str, classType: "RelOP", lineNumber: lineNumber)
            }
            else{
                return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
            }
        }
        else{
            return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
        }
    }
        // Relational Operator ( < , >)
    else if str[str.startIndex] == "<"||str[str.startIndex] == ">"{
        if count(str) == 1 {
            return MyToken(value: str, classType: "RelOP", lineNumber: lineNumber)
        }
        else{
            return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
        }
    }
        
        // for INC/DEC and Arthmatic Operators
    else if str[str.startIndex] == "+"||str[str.startIndex] == "-"{
        if count(str) == 1 {
            return MyToken(value: str, classType: "ArthOP", lineNumber: lineNumber)
        }
        else if count(str) == 2 && str[str.startIndex] == "+" && str[str.endIndex.predecessor()] == "+"{
            return MyToken(value: str, classType: "INC/DEC", lineNumber: lineNumber)
        }
        else if count(str) == 2 && str[str.startIndex] == "-" && str[str.endIndex.predecessor()] == "-"{
            return MyToken(value: str, classType: "INC/DEC", lineNumber: lineNumber)
        }
        else{
            return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
        }
    }
        
        // Arthmitaic Operators
    else if str[str.startIndex] == "*"||str[str.startIndex] == "/"||str[str.startIndex] == "%"{
        if count(str) == 1 {
            return MyToken(value: str, classType: "ArthOp", lineNumber: lineNumber)
        }
        else{
            return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
        }
    }
        // Logical Operators
    else if str == "&&" || str == "||" || str == "!"{
        return MyToken(value: str, classType: "Logical", lineNumber: lineNumber)
    }
        // Identifier constant
    else if DFAParsing(str, myIdentifier, [1]) {
        return MyToken(value: str, classType: "Identifire", lineNumber: lineNumber)
    }
    
    return MyToken(value: str, classType: "SYNTAX ERROR", lineNumber: lineNumber)
}


//let myToken = stringToMyToken("nM2", "1")
//println(myToken.classType)
//println(myToken.value)
//println(myToken.lineNumber)
