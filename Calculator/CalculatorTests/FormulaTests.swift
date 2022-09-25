//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by SummerCat on 2022/09/24.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_result_1더하기1일때_2반환() {
        // given
        // calculator queue에 enqueue하고나서
        // result 함수에서 operands와 operators를 디큐 해서 계산함
        sut.operands.enqueue(item: 1)
        sut.operators.enqueue(item: Operator.add)
        sut.operands.enqueue(item: 1)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_result_1더하기5빼기3곱하기5나누기3_5반환() {
        // given
        sut.operands.enqueue(item: 1)
        sut.operators.enqueue(item: Operator.add)
        sut.operands.enqueue(item: 5)
        sut.operators.enqueue(item: Operator.subtract)
        sut.operands.enqueue(item: 3)
        sut.operators.enqueue(item: Operator.multiply)
        sut.operands.enqueue(item: 5)
        sut.operators.enqueue(item: Operator.divide)
        sut.operands.enqueue(item: 3)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 5)
    }
    
    func test_result_0으로_나눌경우_nan반환() {
        //given
        sut.operands.enqueue(item: 2)
        sut.operators.enqueue(item: Operator.divide)
        sut.operands.enqueue(item: 0)
        
        // when
        let result = sut.result()
               
        // then
        XCTAssertTrue(result.isNaN)
    }
}
