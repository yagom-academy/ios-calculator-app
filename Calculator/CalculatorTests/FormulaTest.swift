//  CalculatorItemQueueTests - FormulaTest.swift
//  created by vetto on 2023/01/27

import Foundation

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    // MARK: - result method test
    func test_operandsqueue에_아무것도_넣지_않고_result를_호출하면_값은_0이다() {
        // given
        sut.operands.enqueue(1.3)
        
        // when
        let result = sut.result()
        let expectation: Double = 1.3
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operandsqueue에_1점3을_넣고_result를_호출하면_1점3이다() {
        // given
        sut.operands.enqueue(1.3)
        
        // when
        let result = sut.result()
        let expectation: Double = 1.3
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operandsqueue에_1과2를_넣고_operatorsqueue에_add를_넣고_실행하면_결과값은_3이다() {
        // given
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.add)
        
        // when
        let result = sut.result()
        let expectation: Double = 3
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operandsqueue에_2와3을_넣고_operatorsqueue에_subtract를_넣고_실행하면_결과값은_마이너스1이다() {
        // given
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.subtract)
        
        // when
        let result = sut.result()
        let expectation: Double = -1
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operandsqueue에_3과6을_넣고_operatorsqueue에_divide를_넣고_실행하면_결과값은_0점5이다() {
        // given
        sut.operands.enqueue(3)
        sut.operands.enqueue(6)
        sut.operators.enqueue(.divide)
        
        // when
        let result = sut.result()
        let expectation: Double = 0.5
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operandsqueue에_4와6을_넣고_operatorsqueue에_multiply를_넣고_실행하면_결과값은_24이다() {
        // given
        sut.operands.enqueue(4)
        sut.operands.enqueue(6)
        sut.operators.enqueue(.multiply)
        
        // when
        let result = sut.result()
        let expecation: Double = 24
        
        // then
        XCTAssertEqual(result, expecation)
    }
}
