//
//  CipherFactory.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/1/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

/* CREDIT: UITextFields styles were created by raul riera
 * github link: https://github.com/raulriera/TextFieldEffects
 */

import Foundation
struct CipherFactory{
    
    private var ciphers: [String: Cipher] = [
        "CustomAlphabet": ReversedAlphabetsPlusNumbers(),
        "Symbolic": SymbolicCipher(),
        "Alphanumeric": AlphanumericCeaserCipher(),
        "Caesar": CaesarCipher()
    ]
    
    func cipher(for key: String) -> Cipher{
        return ciphers[key]!
        
    }
}
