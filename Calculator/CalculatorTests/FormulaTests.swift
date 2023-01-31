//  CalculatorItemQueueTests - FormulaTests.swift
//  created by vetto on 2023/01/27

import Foundation

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    // MARK: - result method test
    func test_operandsqueue에_아무것도_넣지_않고_result를_호출하면_값은_0이다() {
        // given
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        let expecatation: Double = 0
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_operandsqueue에_1점3을_넣고_result를_호출하면_1점3이다() {
        // given
        let operands = CalculatorItemQueue<Double>(with: [1.3])
        let operators = CalculatorItemQueue<Operator>()
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        let expecatation: Double = 1.3
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_operatorsqueue에_add를_넣고_result를_호출하면_0이_나온다() {
        // given
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>(with: [.add])
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        let expecatation: Double = 0
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_operandsqueue에_1과2를_넣고_operatorsqueue에_add를_넣고_실행하면_결과값은_3이다() {
        // given
        let operands = CalculatorItemQueue<Double>(with: [1, 2])
        let operators = CalculatorItemQueue<Operator>(with: [.add])
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        let expecatation: Double = 3
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_operandsqueue에_2와3을_넣고_operatorsqueue에_subtract를_넣고_실행하면_결과값은_마이너스1이다() {
        // given
        let operands = CalculatorItemQueue<Double>(with: [2, 3])
        let operators = CalculatorItemQueue<Operator>(with: [.subtract])
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        let expecatation: Double = -1
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_operandsqueue에_3과6을_넣고_operatorsqueue에_divide를_넣고_실행하면_결과값은_0점5이다() {
        // given
        let operands = CalculatorItemQueue<Double>(with: [3, 6])
        let operators = CalculatorItemQueue<Operator>(with: [.divide])
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        let expecatation: Double = 0.5
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_operandsqueue에_4와0을_넣고_operatorsqueue에_divide를_넣고_실행하면_결과값은_nan이다() {
        // given
        let operands = CalculatorItemQueue<Double>(with: [4, 0])
        let operators = CalculatorItemQueue<Operator>(with: [.divide])
        
        sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
}
