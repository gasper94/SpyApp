//
//  CustomAlphabet.swift
//  SpyAppTests
//
//  Created by Ulises Martinez on 9/20/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import XCTest
@testable import SpyApp

/*
 * This Cipher maps letters from a to z
 * (uppercase too) into uppercase letters,
 * where vowels letters are replaced by
 * selected symbols from ASCII table.
 */

class CustomAlphabet: XCTestCase {
    
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = ReversedAlphabetsPlusNumbers()
    }
    
    // Test whether A maps into #
    func test_AToSymbol(){
        let plaintext = "Z"
        let resultword = "#"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // Test whether E maps into
    func test_EToSymbol(){
        //var cipher = ReversedAlphabetsPlusNumbers()
        let plaintext = "D"
        let resultword = "$"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // Test whether I maps into
    func test_IToSymbol(){
        //var cipher = ReversedAlphabetsPlusNumbers()
        let plaintext = "H"
        let resultword = "%"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // Test whether O maps into
    func test_OToSymbol(){
        //var cipher = ReversedAlphabetsPlusNumbers()
        let plaintext = "N"
        let resultword = "&"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // Test whether U maps into
    func test_UToSymbol(){
        //var cipher = ReversedAlphabetsPlusNumbers()
        let plaintext = "T"
        let resultword = "'"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // Test whether E maps into
    func test_LowerCaseLettersToSymbol(){
        //var cipher = ReversedAlphabetsPlusNumbers()
        let plaintext = "d"
        let resultword = "$"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
}
