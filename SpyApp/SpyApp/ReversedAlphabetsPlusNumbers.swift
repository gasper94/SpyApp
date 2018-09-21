//
//  ReversedAlphabetsPlusNumbers.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/18/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

/* CREDIT: UITextFields styles were created by raul riera
 * github link: https://github.com/raulriera/TextFieldEffects
 */

import Foundation

struct ReversedAlphabetsPlusNumbers: Cipher {
    
    
    func encode(_ plaintext: String, secret: String) -> String {
       
        //_ = UInt32(secret)!
        
        var encoded = ""
        let flag = "Character Not Allowed"
        let numberB = secret.isEmpty
        let textB = plaintext.isEmpty
        
        if numberB && textB{
            encoded = "MISSING NUMBER AND TEXT!"
        }else if numberB{
            encoded = "MISSING NUMBER!"
        }else if textB{
            encoded = "MISSING TEXT!"
        }else{                                          // Logic begins with correct input
            let counter = Int(secret)!
            
            let IsEqualZero = ( 0 == counter)
            
            if IsEqualZero{
                encoded = "NUMBER CANT BE ZERO - Number < 1"
            }else{
                
                    // Z to A
                    var endZ = "A"
                    let valueZ = 90
                
                    /*Swap Characters*/
                
                    //Letter A for !
                    let valueA = 65
                    let uniOfA = UInt32(valueA)
                    var endAwith = "#"
                
                    // Letter E for $"
                    let valueE = 69
                    let uniOfE = UInt32(valueE)
                    var endEwith = "$"
                
                    // Letter I for %"
                    let valueI = 73
                    let uniOfI = UInt32(valueI)
                    var endIwith = "%"
                
                    // Letter O for &"
                    let valueO = 79
                    let uniOfO = UInt32(valueO)
                    var endOwith = "&"
                
                    // Letter U for "
                    let valueU = 85
                    let uniOfU = UInt32(valueU)
                    var endUwith = "'"
                
                    let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
                    let SignsForVowels = UnicodeScalar("#").value ... UnicodeScalar("'").value
                
                    let string = String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
                        + String(String.UnicodeScalarView(SignsForVowels.compactMap(UnicodeScalar.init)))
                
                    let letter = plaintext.uppercased()
                
                    for character in letter{
                       if string.contains(character){
                        
                        //print(character)
                        var unicode = character.unicodeScalars.first!.value
                        
                        for _ in 1...(counter){
                            //print(numbers)

                            //print(unicode)
                            unicode += 1
                            
                            if unicode > valueZ{
                                //print("HERE LOOP")
                                unicode = endZ.unicodeScalars.first!.value
                            }
                        }
                        //print(unicode)
                        
                        if unicode == uniOfA{
                            unicode = endAwith.unicodeScalars.first!.value
                        }
                        //print(unicode)
                        //print(uniOfE)
                        
                        if unicode == uniOfE{
                            unicode = endEwith.unicodeScalars.first!.value
                        }
                        
                        if unicode == uniOfI{
                            unicode = endIwith.unicodeScalars.first!.value
                        }
                        if unicode == uniOfO{
                            unicode = endOwith.unicodeScalars.first!.value
                        }
                        if unicode == uniOfU{
                            unicode = endUwith.unicodeScalars.first!.value
                        }
                        
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
            let flag = "Character Not Allowed"
            let numberB = secret.isEmpty
            let textB = plaintext.isEmpty
            
            if numberB && textB{
                encoded = "MISSING NUMBER AND TEXT!"
            }else if numberB{
                encoded = "MISSING NUMBER!"
            }else if textB{
                encoded = "MISSING TEXT!"
            }else{                                                  // Logic begins with correct input
                let counter = Int(secret)!
                
                let IsEqualZero = ( 0 == counter)
                
                if IsEqualZero{
                    encoded = "NUMBER CANT BE ZERO - Number < 1"
                }else{
                    // Z to A
                    var endZ = "Z"
                    let valueA = 65
                    
                    /*Swap characters*/
                    
                    // From ! to A
                    let valueSign = 35
                    let uniOfA = UInt32(valueSign)
                    var endAwith = "A"
                    
                    // From # to E
                    let valueSign2 = 36
                    let uniOfE = UInt32(valueSign2)
                    var endEwith = "E"
                    
                    // From % to I
                    let valueSign3 = 37
                    let uniOfI = UInt32(valueSign3)
                    var endIwith = "I"
                    
                    // From & to O
                    let valueSign4 = 38
                    let uniOfO = UInt32(valueSign4)
                    var endOwith = "O"
                    
                    // From ' to U
                    let valueSign5 = 39
                    let uniOfU = UInt32(valueSign5)
                    var endUwith = "U"
                    
                    let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
                    let SignsForVowels = UnicodeScalar("#").value ... UnicodeScalar("'").value
                    
                    let string = String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
                    + String(String.UnicodeScalarView(SignsForVowels.compactMap(UnicodeScalar.init)))
                    
                    let letter = plaintext.uppercased()
                    
                    for character in letter{
                        if string.contains(character){
                            
                            //print(character)
                            var unicode = character.unicodeScalars.first!.value
                            
                            for _ in 1...(counter){
                                //print(numbers)
                                if unicode == uniOfA{
                                    unicode = endAwith.unicodeScalars.first!.value
                                }
                                if unicode == uniOfE{
                                    unicode = endEwith.unicodeScalars.first!.value
                                }
                                if unicode == uniOfI{
                                    unicode = endIwith.unicodeScalars.first!.value
                                }
                                if unicode == uniOfO{
                                    unicode = endOwith.unicodeScalars.first!.value
                                }
                                if unicode == uniOfU{
                                    unicode = endUwith.unicodeScalars.first!.value
                                }
                                
                                
                                //print(unicode)
                                unicode -= 1
                                
                                if unicode < valueA{
                                    //print("HERE LOOP")
                                    unicode = endZ.unicodeScalars.first!.value
                                }
                            }
                            
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
