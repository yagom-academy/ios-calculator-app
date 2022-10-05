//
//  StringExtensionTests.swift
//  CalculatorTests
//
//  Created by Wonbi on 2022/10/05.
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {
    func test_소숫점이있는숫자에numberFormatter를적용하였을시_정수부분만numberFormatter가적용되는지() {
        let input: String = "178264.001"
        
        let result: String = input.addCommaInteger()
        
        XCTAssertEqual("178,264.001", result)
    }
}
