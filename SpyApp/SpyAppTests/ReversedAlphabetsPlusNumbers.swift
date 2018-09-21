//
//  ReversedAlphabetsPlusNumbers.swift
//  SpyAppTests
//
//  Created by Ulises Martinez on 9/20/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import XCTest
@testable import SpyApp

class ReversedAlphabetsPlusNumbers: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = ReversedAlphabetsPlusNumbers() as! Cipher
    }
    
    // Test whether A maps into #
    func test_AToSymbol(){
        var cipher = ReversedAlphabetsPlusNumbers()
        let plaintext = "z"
        let resultword = "#"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
}
