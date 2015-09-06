//
//  Compiler2.swift
//  MyCompiler
//
//  Created by Mohsin on 06/09/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


extension String {
    var lastChar : Character?{
        get{
            let length = count(self)
            if  length > 0{
                var count = 0
                for char in self{
                    if count == length-1{
                        return char
                    }
                    count++
                }
            }
            return nil
        }
    }
}


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
    
    // return it will break the word or not
    private class func wordBreaker(temp : String ,char : Character) -> Bool {
        
        switch char{
            
        case "0"..."9","a"..."z","A"..."Z":
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
        case "*" :
            return true
            
        case "/" :
            return true
            
        case "%" :
            return true
            
            
        default :
            return false
        }
        
    }
    
    
    
    class func generateTokens(code : String) -> [(String,String)]{
        
        var temp = ""
        // [value and lineNumber]
        var tokensString = [(String,String)]()
        
        var stringFlag = false
        var commentsFlag = false
        var charaterFlag = false
        
        // line number
        var lineNumber = 1
        
        
        for char in code {
            
            
            // string detected
            if char == "\""{
                if !stringFlag {
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                        temp = ""
                    }
                    stringFlag = true
                    
                }else{
                    temp.append(char)
                    if temp != "" {
                        tokensString.append((temp,lineNumber.description))
                        temp = ""
                    }
                    stringFlag = false
                    continue
                }
            }
            // comment detected
            if char == "/"{
                if temp[temp.endIndex.predecessor()] == "/" {
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
                if char == "\n" {
                    commentsFlag = false
                    temp = "$COMMENTS--"+temp
                    tokensString.append((temp,lineNumber.description))
                    temp = ""
                }
                temp.append(char)
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
            
            if stringFlag{
                temp.append(char)
                continue
            }
            
            
            
            // character detected
            if char == "'"{
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
        
        if temp != "" {
            tokensString.append((temp,lineNumber.description))
        }
        
        return tokensString
        
    }
    
    
    //
    //var str = "void Main() a++===5.5+=**/= { \n int a = 10 \n float sAA = 1.3 \n }"
    //var str1 = "abc+=d--e*=5'd'6 \"mohsin--e*=56 ds\"a //haha 'd' mmmm sa\n "
    //var str2 = "abc '\\sagg' sa"
    //println(generateTokes(str1))
   
    
}


