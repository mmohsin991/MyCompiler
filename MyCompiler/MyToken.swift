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
        println("value: \(self.value) --- classType: \(self.classType) --- lineNumber: \(self.lineNumber)")
//        println("classType: \(self.classType)")
//        println("lineNumber: \(self.lineNumber)")
    }
    
    
    
    class func stringToMyToken(str : String, lineNumber : String) -> MyToken{
        
        println(str)
        println(str[str.startIndex].unicodeScalarCodePoint())
        
        // for comments
        if str.hasPrefix("$COMMENTS--") {
            var str1 = str
            let range = str.startIndex...advance(str.startIndex, 10)
            str1.removeRange(range)
            return MyToken(value: str1, classType: "Comments", lineNumber: lineNumber)
            
        }
        // for . contant
        else if str == "." {
            return MyToken(value: str, classType: ".", lineNumber: lineNumber)
        }
        // for Float contant
        else if Parsing.doParsing(str, pasringType: ParsingTypes.FloatConstatnt) {
            return MyToken(value: str, classType: "FloatConstant", lineNumber: lineNumber)
        }
            
        // for Char contant
        if str[str.startIndex] == "’" || str[str.startIndex] == "‘" || str[str.startIndex] == "'" && str[str.endIndex.predecessor()] == "’" || str[str.endIndex.predecessor()] == "‘" || str[str.endIndex.predecessor()] == "'"{
            
            var str1 = str
            
            str1.removeAtIndex(str1.startIndex)
            str1.removeAtIndex(str1.endIndex.predecessor())
            if Parsing.doParsing(str1, pasringType: ParsingTypes.CharConstatnt){
                return MyToken(value: str1, classType: "CharConstant", lineNumber: lineNumber)
            }
            else{
                return MyToken(value: str1, classType: "LEXICAL ERROR", lineNumber: lineNumber)
            }
        }
            
            
            // for String contant
        else if Parsing.doParsing(str, pasringType: ParsingTypes.StringConstatnt) {
            var str1 = str
            str1.removeAtIndex(str1.startIndex)
            str1.removeAtIndex(str1.endIndex.predecessor())
            return MyToken(value: str1, classType: "StringConstant", lineNumber: lineNumber)
        }
            // for Int contant
        else if Parsing.doParsing(str, pasringType: ParsingTypes.IntConstatnt) {
            return MyToken(value: str, classType: "IntConstant", lineNumber: lineNumber)
            
        }
            // for Bool contant
        else if Parsing.doParsing(str, pasringType: ParsingTypes.BoolConstatnt) {
            return MyToken(value: str, classType: "BoolConstant", lineNumber: lineNumber)
            
        }
            
            
            // if its a punctuattor then it should be a count 1
        else if  TokenString.isPunctuator(str[str.startIndex]){
            if count(str) == 1{
                return MyToken(value: str, classType: str, lineNumber: lineNumber)
            }
            else{
                return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
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
                    return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
                }
            }
            else{
                return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
            }
        }
            // Relational Operator ( < , >)
        else if str[str.startIndex] == "<"||str[str.startIndex] == ">"{
            if count(str) == 1 {
                return MyToken(value: str, classType: "RelOP", lineNumber: lineNumber)
            }
            else{
                return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
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
                return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
            }
        }
            
            // Arthmitaic Operators
        else if str[str.startIndex] == "*"||str[str.startIndex] == "/"||str[str.startIndex] == "%"{
            if count(str) == 1 {
                return MyToken(value: str, classType: "ArthOp", lineNumber: lineNumber)
            }
            else{
                return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
            }
        }
            // Logical Operators
        else if str == "&&" || str == "||" || str == "!"{
            return MyToken(value: str, classType: "Logical", lineNumber: lineNumber)
        }
        else if isDataType(str){
            return MyToken(value: str, classType: "DataType", lineNumber: lineNumber)
        }
        else if str == "VOID" {
            return MyToken(value: str, classType: "VOID", lineNumber: lineNumber)
        }
        else if str == "ARRAY"{
            return MyToken(value: str, classType: "ARRAY", lineNumber: lineNumber)
        }
            
            
            // key words
        else if isKeyWord(str){
            return MyToken(value: str, classType: str, lineNumber: lineNumber)
        }
         
            
            // Identifier constant
        else if Parsing.doParsing(str, pasringType: ParsingTypes.MyIdentifier) {
            return MyToken(value: str, classType: "Identifier", lineNumber: lineNumber)
        }
        
        return MyToken(value: str, classType: "LEXICAL ERROR", lineNumber: lineNumber)
    }
    
    
    
    class func isDataType(value : String) -> Bool{
        
        switch value {
            
        case "STRING" :
            return true
        case "CHAR" :
            return true
        case "INT" :
            return true
        case "FLOAT" :
            return true
        case "BOOL" :
            return true
        case "AnyObject" :
            return true
            
            
            
        default:
            return false
        }
    
    
    }
    
    
    

    
    class func isKeyWord(value : String) -> Bool{
        
        switch value {
            
        case "VOID" :
            return true
        case "MAIN" :
            return true
        case "IF" :
            return true
        case "ELSE" :
            return true
        case "FOR" :
            return true
        case "FORE" :
            return true
        case "WHILE" :
            return true
        case "VAR" :
            return true
        case "BREAK" :
            return true
        case "CONTINUE" :
            return true
        case "CLASS" :
            return true
        case "STRUCT" :
            return true
        case "IN" :
            return true
        case "NIL" :
            return true
        case "RETURN" :
            return true
        case "INCBY" :
            return true
        case "DECBY" :
            return true
        case "DO" :
            return true
            
            
            
        default:
            return false

        }
    }
    
}




//let myToken = stringToMyToken("nM2", "1")
//println(myToken.classType)
//println(myToken.value)
//println(myToken.lineNumber)
