//
//  CaesarCipher.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/4/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

/* CREDIT: UITextFields styles were created by raul riera
 * github link: https://github.com/raulriera/TextFieldEffects
 */

import Foundation

protocol Cipher{
    func encode(_ plaintext: String, secret: String) -> String
    func decrypt(_ plaintext: String, secret: String) -> String
}

struct CaesarCipher: Cipher {
    
    func encode(_ plaintext: String,secret: String) -> String{
        
        var encoded  = ""
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{                                              // Logic begins with correct input
        
            let shitfBy = UInt32(secret)!
            
            for character in plaintext{
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode + shitfBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        
        var encoded  = ""
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        print(numberB)
        print(textB)
        
        //
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{                                          // Logic begins with correct input
            let shitfBy = UInt32(secret)!
            
            for character in plaintext{
                let unicode = character.unicodeScalars.first!.value
                let shiftedUnicode = unicode - shitfBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
        }
        return encoded
    }
}
