//
//  AlphanumericCaesarCipher.swift
//  SpyAppTests
//
//  Created by Ulises Martinez on 9/17/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import XCTest
@testable import SpyApp
/*
 * This Cipher goes cyclical order from A to Z and 0 to 9
 * takes input a to z, A to Z, and 0 to 9
 */


class AlphanumericCaesarCipher: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        
        cipher = AlphanumericCeaserCipher()
    }
    
    /*****First 4 test are cyclical test************/
    
    // 9 to A (encode)
    func test_NineToA(){
        let plaintext = "9"
        let resultword = "A"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    
    // Z to 0 (encode)
    func test_ZToZero(){
        let plaintext = "Z"
        let resultword = "0"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // A to 9 (decrypt)
    func test_AToNine(){
        let plaintext = "A"
        let resultword = "9"
        
        let result = cipher.decrypt(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // 0 to Z (decrypt)
    func test_ZeroToZ(){
        let plaintext = "0"
        let resultword = "Z"
        
        let result = cipher.decrypt(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    /**Test for lower case input to uppper case output**/
    
    // a to A
    func test_LowerCaseToUpperCase(){
        let plaintext = "a"
        let resultword = "B"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    /* Lower case letters map into cyclical cipher*/
    
    // z to 0
    func test_ZLowerCaseToZero(){
        let plaintext = "z"
        let resultword = "0"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    // a to 9
    func test_ALowerCaseToNine(){
        let plaintext = "a"
        let resultword = "9"
        
        let result = cipher.decrypt(plaintext, secret: "1")
        
        XCTAssertEqual(resultword, result)
    }
    
    
        
}
