//
//  SymbolicCipherTest.swift
//  SpyAppTests
//
//  Created by Ulises Martinez on 9/17/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import XCTest
@testable import SpyApp

/*
 * This Cipher maps letters from a to z
 * (uppercase too) into symbols from ascii table
 * from values 33 to 58 (! to :)
 */

class SymbolicCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = SymbolicCipher()
    }
    
    /*****Test for mapping a to z with offset 32 in accii table************/
    
    // A maps into !
    func test_AToSymbol(){
        let plaintext = "a"
        let resultword = "!"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // z maps to :
    func test_AToSymbol1(){
        let plaintext = "z"
        let resultword = ":"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    /** Each letter maps into different symbol
     ** no point to have more test
     */
}
