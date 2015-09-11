//
//  Miscellaneous.swift
//  MyCompiler
//
//  Created by Mohsin on 07/09/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


enum ParsingTypes{
    case MyIdentifier
    case IntConstatnt
    case StringConstatnt
    case FloatConstatnt
    case CharConstatnt
    case BoolConstatnt
}



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


extension Character
{
    func unicodeScalarCodePoint() -> Int
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return  Int(scalars[scalars.startIndex].value)
    }
}

