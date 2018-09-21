//
//  SymbolicCipher.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/11/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

/* CREDIT: UITextFields styles were created by raul riera
 * github link: https://github.com/raulriera/TextFieldEffects
 */

import Foundation

struct SymbolicCipher: Cipher {

    func encode(_ plaintext: String,secret: String) -> String{
        
        var encoded = ""
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        //Check for a Missing number and string
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{  //Symbolic Cipher logic starts
            let displacement = 32
            let shifted = UInt32(displacement)
            
            //let lowerBound = 65
            //let upperBound = 90
            let flag = "Character Not Allowed"
            
            let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
            
            let string = String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
            
            let letter = plaintext.uppercased()
            
            for character in letter{
                print(character)
                /*
                let OneisEqual = ( lowerBound <= character.unicodeScalars.first!.value)
                let TwoisEqual = ( character.unicodeScalars.first!.value <= upperBound)
                */
                
                if string.contains(character){
                    var unicode = character.unicodeScalars.first!.value
                    /*
                    if OneisEqual && TwoisEqual{
                        unicode = unicode - shifted
                    }*/
                    unicode = unicode - shifted
                    
                    let shiftedCharacter = String(UnicodeScalar(UInt8(unicode)))
                    encoded = encoded + shiftedCharacter
                }else{
                    encoded = flag
                    break
                }
            }
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        
        var encoded = ""
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        //var shitfBy = UInt32(secret)!
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{
            
            let displacement = 32
            let shifted = UInt32(displacement)
            
            //let lowerBound = 33
            //let upperBound = 58
            let flag = "Character Not Allowed:"
            
            let UpperCaseletters = UnicodeScalar("!").value ... UnicodeScalar(":").value
            
            let string = String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
            
            let letter = plaintext.uppercased()
            
            for character in letter{
                /*
                let OneisEqual = ( lowerBound <= character.unicodeScalars.first!.value)
                let TwoisEqual = ( character.unicodeScalars.first!.value <= upperBound)
                */
                
                if string.contains(character){
                    var unicode = character.unicodeScalars.first!.value
                    
                    /*
                    if OneisEqual && TwoisEqual{
                        unicode = unicode + shifted
                    }*/
                    unicode = unicode + shifted
                    
                    let shiftedCharacter = String(UnicodeScalar(UInt8(unicode)))
                    encoded = encoded + shiftedCharacter
                    
                    
                }else{
                    encoded = flag
                    break
                }
            }
        }
        return encoded
    }
    
    
}
