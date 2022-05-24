//
//  ExpressionPaserTest.swift
//  ExpressionPaserTest
//
//  Created by unchain123 on 2022/05/22.
//

import XCTest

@testable import Calculator

class ExpressionPaserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse에_정상적인_식이_들어왔을_때_계산을_해주는지() {
        //given
        let inputExpresion = "1 + 2 × -3"
        let expected = -9.0
        
        // when
        let result = try! ExpressionPaser.parse(from: inputExpresion).result()
        
        // then
        XCTAssertEqual(result, expected)
    }

    func test_연산자가_먼저_입력된_식도_올바르게_계산하는지() {
        //given
        let inputExpresion = "+3 + 5 - 1"
        let expected = 7.0
        
        // when
        let result = try! ExpressionPaser.parse(from: inputExpresion).result()
        
        // then
        XCTAssertEqual(result, expected)
    }
}
