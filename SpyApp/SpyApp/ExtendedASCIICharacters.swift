//
//  ExtendedASCIICharacters.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/12/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import Foundation

import Foundation

struct ExtendedASCIICharacters: Cipher {
    
    
    
    func encode(_ plaintext: String,secret: String) -> String{
        
        var encoded = ""
        
    
        let UpperCaseletters = UnicodeScalar("!").value ... UnicodeScalar(":").value
        
        let string = String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
        
        encoded += string
        /*
        let letter = plaintext.uppercased()
        
        for character in letter{
            let OneisEqual = ( lowerBound <= character.unicodeScalars.first!.value)
            let TwoisEqual = ( character.unicodeScalars.first!.value <= upperBound)
            
            if string.contains(character){
                var unicode = character.unicodeScalars.first!.value
                
                if OneisEqual && TwoisEqual{
                    unicode = unicode + shifted
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(unicode)))
                encoded = encoded + shiftedCharacter
                
                
            }else{
                encoded = flag
                break
            }
        }*/
        print(encoded)
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        /*
         let shitfBy = UInt32(secret)!
         
         var encoded = ""
         
         // 0 to Z
         var endZ = "["
         let valueZ = 48
         
         // a to 9
         var end9 = ":"
         let value9 = 65
         
         let flag = "Character Not Allowed"
         let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
         let digits = UnicodeScalar("0").value ... UnicodeScalar("9").value
         
         let string = String(String.UnicodeScalarView(digits.compactMap(UnicodeScalar.init)))
         +  String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
         
         let letter = plaintext.uppercased()
         
         for character in letter{
         
         let OneisEqual = ( valueZ == character.unicodeScalars.first!.value)
         let TwoisEqual = ( value9 == character.unicodeScalars.first!.value)
         
         if string.contains(character){
         
         var unicode = character.unicodeScalars.first!.value
         
         if OneisEqual{
         unicode = endZ.unicodeScalars.first!.value
         }else if TwoisEqual{
         unicode = end9.unicodeScalars.first!.value
         }
         
         let shiftedUnicode = unicode - shitfBy
         let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
         encoded = encoded + shiftedCharacter
         }else{
         encoded = flag
         break
         }
         }
         
         return encoded*/
        var encoded = ""
        
        //let shitfBy = UInt32(secret)!
        
        let displacement = 32
        let shifted = UInt32(displacement)
        
        let lowerBound = 33
        let upperBound = 58
        let flag = "Character Not Allowed:"
        
        let UpperCaseletters = UnicodeScalar("!").value ... UnicodeScalar(":").value
        
        let string = String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
        
        let letter = plaintext.uppercased()
        
        for character in letter{
            let OneisEqual = ( lowerBound <= character.unicodeScalars.first!.value)
            let TwoisEqual = ( character.unicodeScalars.first!.value <= upperBound)
            
            if string.contains(character){
                var unicode = character.unicodeScalars.first!.value
                
                if OneisEqual && TwoisEqual{
                    unicode = unicode + shifted
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(unicode)))
                encoded = encoded + shiftedCharacter
                
                
            }else{
                encoded = flag
                break
            }
        }
        print(encoded)
        return encoded
    }
    
    
}
