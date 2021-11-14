//
//  StringSplitTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/14.
//

import XCTest

class StringSplitTests: XCTestCase {
    
    func test_더하기연산자가_1개있는문자열에서_split을호출했을때_기대하는결과값인지() {
        let splited = "2+3".split(with: "+")
        let expectedResult = ["2", "3"]
        
        XCTAssertEqual(splited, expectedResult)
    }
    
    func test_더하기연산자가_2개있는문자열에서_split을호출했을때_기대하는결과값인지() {
        let splited = "2+3+4".split(with: "+")
        let expectedResult = ["2", "3", "4"]
        
        XCTAssertEqual(splited, expectedResult)
    }
    
    func test_연산자가섞여있을때_split을호출하면_기대하는결과값인지() {
        let splited = "2+3-8".split(with: "+")
        let expectedResult = ["2", "3-8"]
        
        XCTAssertEqual(splited, expectedResult)
    }
}
