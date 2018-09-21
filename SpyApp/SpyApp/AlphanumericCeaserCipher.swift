//
//  AlphanumericCeaserCipher.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/4/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

/* CREDIT: UITextFields styles were created by raul riera
 * github link: https://github.com/raulriera/TextFieldEffects
 */

import Foundation

struct AlphanumericCeaserCipher: Cipher {
    
    func encode(_ plaintext: String,secret: String) -> String{
        
        //_ = UInt32(secret)!
        
        var encoded = ""
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{                                                      // Logic begins with correct input
                let counter = Int(secret)!
            
                let IsEqualZero = ( 0 == counter)
            
                if IsEqualZero{
                    encoded = "NUMBER CANT BE ZERO - Number < 1"
                }else{
                    //more values Y to 2
                    var endYDouble = "0"
                    let valueYDouble = 90
                    
                    //more values
                    var endNineDouble = "A"
                    let valueNineDouble = 57
                    let value = UInt32(valueNineDouble)
                    
                    // Z to 0
                    //var endZ = "/"
                    //let valueZ = 90
                    
                    // 9 to a
                    //var end9 = "@"
                    //let value9 = 57
                    
                    let flag = "Character Not Allowed"
                    let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
                    let digits = UnicodeScalar("0").value ... UnicodeScalar("9").value
                    
                    let string = String(String.UnicodeScalarView(digits.compactMap(UnicodeScalar.init)))
                        +  String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
                    
                    let letter = plaintext.uppercased()
                    
                    for character in letter{
                        /*
                        let OneisEqual = ( valueZ == character.unicodeScalars.first!.value)
                        let TwoisEqual = ( value9 == character.unicodeScalars.first!.value)
                        */
                        if string.contains(character){
                            
                            var unicode = character.unicodeScalars.first!.value
                            
                            for _ in 1...(counter){
                                //print(unicode)
                                
                                if unicode == value{
                                    unicode = endNineDouble.unicodeScalars.first!.value
                                    unicode -= 1
                                }
                                
                                unicode += 1
                                
                                if unicode > valueYDouble{
                                    //print("HERE LOOP")
                                    unicode = endYDouble.unicodeScalars.first!.value
                                }
                            }
                            print(unicode)
                            
                            //let shiftedUnicode = unicode + shitfBy
                            let shiftedCharacter = String(UnicodeScalar(UInt8(unicode)))
                            encoded = encoded + shiftedCharacter
                    }else{
                        encoded = flag
                        break
                    }
                }
            }
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        //_ = UInt32(secret)!
        
        var encoded = ""
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{
            let counter = Int(secret)!
            
            let IsEqualZero = ( 0 == counter)
            
            if IsEqualZero{
                encoded = "NUMBER CANT BE ZERO - Number < 1"
            }else{                                                  // Logic begins with correct input
                
                // 0 to Z
                var endZ = "Z"
                let valueZeroToZ = 48
                 let value = UInt32(valueZeroToZ)
                
                // a to 9
                var end9 = "9"
                let valueAToNine = 65
                let values = UInt32(valueAToNine)
                
                let flag = "Character Not Allowed"
                let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
                let digits = UnicodeScalar("0").value ... UnicodeScalar("9").value
                
                let string = String(String.UnicodeScalarView(digits.compactMap(UnicodeScalar.init)))
                    +  String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
                
                let letter = plaintext.uppercased()
                
                for character in letter{
                    
                    if string.contains(character){
                        
                        var unicode = character.unicodeScalars.first!.value
                        
                        //var check = true
                        
                        for _ in 1...(counter){
                            
                            if unicode == value{
                                unicode = endZ.unicodeScalars.first!.value
                                unicode += 1
                            }
                            
                            if unicode == values{
                                //print("HERE LOOP")
                                unicode = end9.unicodeScalars.first!.value
                                unicode += 1
                            }
                            unicode -= 1
                            
                            
                        }
                        print(unicode)
                        
                        
                        //let shiftedUnicode = unicode - shitfBy
                        let shiftedCharacter = String(UnicodeScalar(UInt8(unicode)))
                        encoded = encoded + shiftedCharacter
                    }else{
                        encoded = flag
                        break
                    }
                }
            }
        }
        return encoded
    }
}



