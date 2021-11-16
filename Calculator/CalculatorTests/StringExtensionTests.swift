//
//  StringExtensionTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/14.
//

import XCTest

class StringExtensionTests: XCTestCase {
    func test_String을_String배열로_잘_쪼개는지() {
        let sut = "1+2+3"
        
        XCTAssertEqual(sut.split(with: "+"), ["1", "2", "3"])
    }
    
    func test_String을_띄어쓰기만_한_String으로_String배열로_잘_쪼개는지() {
        let sut = "1 + 2 + 3"
        
        XCTAssertEqual(sut.split(with: " "), ["1", "+", "2", "+", "3"])
    }
}
