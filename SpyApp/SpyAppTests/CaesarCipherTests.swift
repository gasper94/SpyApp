//
//  CaesarCipherTests.swift
//  SpyAppTests
//
//  Created by Ulises Martinez on 9/17/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import XCTest
@testable import SpyApp

/*
 * Alphabet encrypt from a to z
 */

class CaesarCipherTests: XCTestCase {
    
    func test_OneCharacterString(){
        let cipher = CaesarCipher()
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
}
