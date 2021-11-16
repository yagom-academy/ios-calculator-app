//
//  StringTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/12.
//

import XCTest

class StringTest: XCTestCase {
    func test_공백을_기준으로_피연샨자와_연산자가_잘_나뉘는지() {
        let testString = "1.0 + 32.4 − -3.2 ÷ 4.0 × 7.2"
        XCTAssertEqual(["1.0","+","32.4","−","-3.2","÷","4.0","×","7.2"], testString.split(with: " "))
    }
    
    func test_쉼표를_기준으로_피연샨자와_연산자가_잘_나뉘는지() {
        let testString = "1.0,+,32.4,−,-3.2,÷,4.0,×,7.2"
        XCTAssertEqual(["1.0","+","32.4","−","-3.2","÷","4.0","×","7.2"], testString.split(with: ","))
    }
}
