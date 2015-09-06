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
        
        return false
    }
    
    
    
    class func generateTokens(code : String) -> [String]{
        
        var temp = ""
        var tokensString = [String]()
        var tokensString = [String]()

        
        var stringFlag = false
        var commentsFlag = false
        var charaterFlag = false
        
        var lineNumber = 0
        
        
        for char in code {
            
            // if new line detected
            if char == "\n" {
                if temp != "" {
                    tokensString.append(temp)
                    temp = ""
                }
                lineNumber++
                continue
            }
            
            // string detected
            if char == "\""{
                if !stringFlag {
                    if temp != "" {
                        tokensString.append(temp)
                        temp = ""
                    }
                    stringFlag = true
                    
                }else{
                    temp.append(char)
                    if temp != "" {
                        tokensString.append(temp)
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
                        tokensString.append(temp)
                        temp = ""
                    }
                    continue
                }
            }
            if commentsFlag{
                if char == "\n" {
                    commentsFlag = false
                    temp = "$COMMENTS--"+temp
                    tokensString.append(temp)
                    temp = ""
                }
                temp.append(char)
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
                        tokensString.append(temp)
                        temp = ""
                    }
                    charaterFlag = true
                }else{
                    temp.append(char)
                    tokensString.append(temp)
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
                    tokensString.append(temp)
                }
                tokensString.append(String(char))
                temp = ""
            }
            else if wordBreaker(temp, char: char){
                // if temp has any value
                if temp != "" {
                    tokensString.append(temp)
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
            tokensString.append(temp)
        }
        
        return tokensString
        
    }
    
    
    //
    //var str = "void Main() a++===5.5+=**/= { \n int a = 10 \n float sAA = 1.3 \n }"
    //var str1 = "abc+=d--e*=5'd'6 \"mohsin--e*=56 ds\"a //haha 'd' mmmm sa\n "
    //var str2 = "abc '\\sagg' sa"
    //println(generateTokes(str1))
   
    
}


