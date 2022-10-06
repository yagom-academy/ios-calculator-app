//
//  StringExtensionTests.swift
//  Created by Wonbi, Ash
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {
    func test_소숫점이있는숫자에addCommaInteger를적용하였을시_정수부분만numberFormatter가적용되는지() {
        let input: String = "178264.001"
        
        let result: String = input.addCommaInteger()
        
        XCTAssertEqual("178,264.001", result)
    }
    
    func test_소수점이있는숫자가정수형일때_addCommaInteger를적용하였을시_정수부분만numberFormatter가적용되는지() {
        let input: String = "178264.000000"
        
        let result: String = input.addCommaInteger()
        
        XCTAssertEqual("178,264.000000", result)
    }
    
    func test_소숫점만있는정수형에addComma를적용하였을시_numberFormatter가적용되는지() {
        let input: String = "178264."
        
        let result: String = input.addComma()
        
        XCTAssertEqual("178,264", result)
    }
    
    func test_소수점이없는숫자에addComma를적용하였을시_numberFormatter가적용되는지() {
        let input: String = "178264"
        
        let result: String = input.addComma()
        
        XCTAssertEqual("178,264", result)
    }
}
