//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 비모 on 2023/06/06.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_result_operands가_비어있는_경우_0을_반환한다() {
        // given
        let expectedResult = 0.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result_operands에_3만_있는_경우_3을_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        let expectedResult = 3.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result_operands에_3과2_operators에_더하기가_있는경우_5를_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(2.0)
        let expectedResult = 5.0

        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result_0_더하기_1_빼기_1가_0을_반환한다() {
        // given
        sut.operands.enqueue(0.0)
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(Operator.subtract)
        sut.operands.enqueue(1.0)
        let expectedResult = 0.0

        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_result_2_더하기_8_빼기_5_곱하기_2_나누기_4가_2점5를_반환한다() {
        // given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(8.0)
        sut.operands.enqueue(5.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(4.0)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.divide)
        let expectedResult = 2.5

        // when
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectedResult)
    }
}
