//
//  Compiler2.swift
//  MyCompiler
//
//  Created by Mohsin on 06/09/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation



class TokenString {
    
    class func isPunctuator(char : Character) -> Bool{
        
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
    // MARK: wordBreaker function
    
    // return it will break the word(string) or not
    private class func wordBreaker(temp : String ,char : Character) -> Bool {
        
        
        switch char{
            
        case "0"..."9":
            if temp.lastChar == "=" {
                return true
            }
            else if temp.lastChar == "+" {
                return true
            }
            else if temp.lastChar == "-" {
                return true
            }
            else if temp.lastChar == "*" {
                return true
            }
            else if temp.lastChar == "/" {
                return true
            }
            else if temp.lastChar == "&" {
                return true
            }
            else if temp.lastChar == "|" {
                return true
            }
            else if temp.lastChar == "<" {
                return true
            }
            else if temp.lastChar == ">" {
                return true
            }
            return false
            
        case "a"..."z","A"..."Z":
            if temp.lastChar == "=" {
                return true
            }
            else if temp.lastChar == "+" {
                return true
            }
            else if temp.lastChar == "-" {
                return true
            }
            else if temp.lastChar == "*" {
                return true
            }
            else if temp.lastChar == "/" {
                return true
            }
            else if temp.lastChar == "&" {
                return true
            }
            else if temp.lastChar == "|" {
                return true
            }
            else if temp.lastChar == "<" {
                return true
            }
            else if temp.lastChar == ">" {
                return true
            }
            else if temp.lastChar == "." {
                return true
            }
            else if temp.lastChar == "!" {
                return true
            }
            return false
            

            
        case "=" :
            if temp == "=" {
                return false
            }
            else if temp == "+" {
                return false
            }
            else if temp == "-" {
                return false
            }
            else if temp == "*" {
                return false
            }
            else if temp == "/" {
                return false
            }
            else if temp == "!" {
                return false
            }
            else if temp == ">" {
                return false
            }
            else if temp == "<" {
                return false
            }
            else {
                return true
            }
            
            
        case "+" :
            if temp == "+" {
                return false
            }
            else {
                return true
            }
            
        case "-" :
            if temp == "-" {
                return false
            }
            else {
                return true
            }
            
        case "&" :
            if temp == "&" {
                return false
            }
            else {
                return true
            }
        case "|" :
            if temp == "|" {
                return false
            }
            else {
                return true
            }
        case "<" :
            if  temp.lastChar == "<" {
                return false
            }
            else {
                return true
            }
        case ">" :
            if  temp.lastChar == ">" {
                return false
            }
            else {
                return true
            }
        case "*" :
            return true
            
        case "/" :
            return true
            
        case "%" :
            return true
            
        case "!" :
            return true
            
        default :
            return false
        }
        
    }
    
    
    class func generateWords(code : String) -> [(String,String)]{
        
        var temp = ""
        // [value and lineNumber]
        var tokensString = [(String,String)]()
        
        var stringFlag = false
        var commentsFlag = false
        var charaterFlag = false
        
        // line number
        var lineNumber = 1
        
        
        for char in code {
            
            // comment detected
            if char == "/"{
                if temp.lastChar == "/" && !commentsFlag && !stringFlag{
                    commentsFlag = true
                    temp.removeAtIndex(temp.endIndex.predecessor())
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                        temp = ""
                    }
                    continue
                }
            }
            if commentsFlag{
                if char == "\n" || char == "\r"{
                    commentsFlag = false
                    temp = "$COMMENTS--"+temp
                    tokensString.append((temp,lineNumber.description))
                    temp = ""
                    lineNumber++
                }
                else{
                    temp.append(char)
                }
                continue
            }
            
            // if new line detected
            if char == "\n" || char == "\r" {
                if temp != "" {
                    tokensString.append((temp,lineNumber.description))
                    temp = ""
                }
                lineNumber++
                continue
            }
            
            // string detected
            if char == "\"" || char == "“" || char == "”" {
                if !stringFlag {
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                        temp = ""
                    }
                    stringFlag = true
                    
                }else if !(temp.lastChar == "\\"){
                    temp.append(char)
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                        temp = ""
                    }
                    stringFlag = false
                    continue
                }
            }
            
            
            // string
            if stringFlag{
                temp.append(char)
                continue
            }
            
            
            // character detected
            if char == "'" || char == "’" || char == "‘"{
                if !charaterFlag {
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                        temp = ""
                    }
                    charaterFlag = true
                }else{
                    temp.append(char)
                    tokensString.append((temp,lineNumber.description))
                    temp = ""
                    charaterFlag = false
                    continue
                    
                }
            }
            
            if charaterFlag{
                temp.append(char)
                continue
            }
            
            // word break
            if isPunctuator(char) {
                // if temp has any value
                if temp != "" {
                    tokensString.append((temp,lineNumber.description))
                }
                tokensString.append((String(char), lineNumber.description))
                temp = ""
            }
                // special case 5.5.t => 5.5 , . , t
            else if (char >= "a" && char <= "z" || char >= "A" && char <= "Z") && temp.lastChar == "." {
                temp.removeAtIndex(temp.endIndex.predecessor())
                // if temp has any value
                if temp != "" {
                    tokensString.append((temp,lineNumber.description))
                }
                tokensString.append((".",lineNumber.description))
                temp = ""
                temp.append(char)
            }
                
                // special case : dfDd.232.3 == dfDd , . , 232.3
            else if char == "." {
                if Parsing.doParsing(temp, pasringType: ParsingTypes.MyIdentifier){
                    tokensString.append((temp,lineNumber.description))
                    tokensString.append((".",lineNumber.description))
                    temp = ""
                    
                }
                else if temp.lastChar >= "0" && temp.lastChar <= "9" {
                    if char != " "{
                        temp.append(char)
                    }
                }
                
                else {
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                    }
                    temp = ""
                    if char != " "{
                        temp.append(char)
                    }
                }
            }

            
            else if wordBreaker(temp, char: char){
                // if temp has any value
                if temp != "" {
                    tokensString.append((temp,lineNumber.description))
                }
                temp = ""
                if char != " "{
                    temp.append(char)
                }
            }
            else{
                if char != " "{
                    temp.append(char)
                }
            }
        }
        
        // end of the file
        if temp != "" {
            if commentsFlag{
                temp = "$COMMENTS--"+temp
                tokensString.append((temp,lineNumber.description))
            }else{
                tokensString.append((temp,lineNumber.description))
            }
        }
        
        return tokensString
        
    }
    
    
    //
    //var str = "void Main() a++===5.5+=**/= { \n int a = 10 \n float sAA = 1.3 \n }"
    //var str1 = "abc+=d--e*=5'd'6 \"mohsin--e*=56 ds\"a //haha 'd' mmmm sa\n "
    //var str2 = "abc '\\sagg' sa"
    //println(generateTokes(str1))
   
    
}


