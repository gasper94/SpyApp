//
//  AlphanumericCeaserCipher.swift
//  SpyAppTests
//
//  Created by Ulises Martinez on 9/17/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphanumericCeaserCipher: XCTestCase {
    
    func test_OneCharacterString(){
        let cipher = AlphanumericCeaserCipher()
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
}
