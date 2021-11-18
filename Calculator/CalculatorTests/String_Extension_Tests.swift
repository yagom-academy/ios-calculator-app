//
//  String_Extension_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class String_Extension_Tests: XCTestCase {

    func test_split호출시_target으로_나눈_String배열을_반환한다() {
        let input = "1.0➕9.0"
        let splitedInput = input.split(with: "➕")
        
        XCTAssertEqual(splitedInput, ["1.0","9.0"])
    }
    
    func test_split호출시_Operator_case의_rawValue로_나눈_String배열을_반환한다() {
        let input = "1.0➕9.0"
        let splitedInput = input.split(with: Operator.add.rawValue)
        
        XCTAssertEqual(splitedInput, ["1.0","9.0"])
    }
}
