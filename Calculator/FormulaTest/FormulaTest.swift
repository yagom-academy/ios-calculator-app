//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 서현웅 on 2022/09/28.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {

    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_result_호출시_2항연산_계산결과가나오는지() {
        // given
        sut.operands.enqueue(10.0)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(2.0)
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, 20.0)
    }
    
    func test_result_호출시_3항연산_계산결과가나오는지() {
        // given
        sut.operands.enqueue(1)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(5)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(2)
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_result_호출시_6항연산_중복연산자사용_계산결과가나오는지() {
        // given
        sut.operands.enqueue(10)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(5)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(10)
        sut.operators.enqueue(.add)
        sut.operands.enqueue(60)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.divide)
        sut.operands.enqueue(20)
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, 10.0)
    }

}
