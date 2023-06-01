//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 김민성 on 2023/06/01.
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

    func test_lhs_rhs_operator가_하나이면서_정수일_때_result를_호출하면_값을_정상적으로_계산해서_반환한다() throws {
        // given
        let operands1: [Double] = [1, 2]
        let operands2: [Double] = [10, 150]
        let operands3: [Double] = [-10, 20]
        let operands4: [Double] = [-100, -55]
        
        let operators1: [Operator] = [.add]
        let operators2: [Operator] = [.subtract]
        let operators3: [Operator] = [.divide]
        let operators4: [Operator] = [.multiply]
        
        var formul1 = Formula(operands: CalculatorItemQueue<Double>(operands1), operators: CalculatorItemQueue<Operator>(operators1))
        var formul2 = Formula(operands: CalculatorItemQueue<Double>(operands2), operators: CalculatorItemQueue<Operator>(operators2))
        var formul3 = Formula(operands: CalculatorItemQueue<Double>(operands3), operators: CalculatorItemQueue<Operator>(operators3))
        var formul4 = Formula(operands: CalculatorItemQueue<Double>(operands4), operators: CalculatorItemQueue<Operator>(operators4))
        
        let expectation1 = 3.0
        let expectation2 = -140.0
        let expectation3 = -0.5
        let expectation4 = 5500.0
        
        // when
        let result1 = try formul1.result()
        let result2 = try formul2.result()
        let result3 = try formul3.result()
        let result4 = try formul4.result()
        
        // then
        XCTAssertEqual(result1, expectation1)
        XCTAssertEqual(result2, expectation2)
        XCTAssertEqual(result3, expectation3)
        XCTAssertEqual(result4, expectation4)
    }
    
    func test_lhs_rhs_operator가_하나이면서_소수일_때_result를_호출하면_값을_정상적으로_계산해서_반환한다() throws {
        // given
        let operands1: [Double] = [1.3, 2.8]
        let operands2: [Double] = [10.3, -150.39]
        let operands3: [Double] = [-10.48, 20.01]
        let operands4: [Double] = [-100.1, -55.2]
        
        let operator1: [Operator] = [.add]
        let operator2: [Operator] = [.subtract]
        let operator3: [Operator] = [.divide]
        let operator4: [Operator] = [.multiply]
        
        var formul1 = Formula(operands: CalculatorItemQueue<Double>(operands1), operators: CalculatorItemQueue<Operator>(operator1))
        var formul2 = Formula(operands: CalculatorItemQueue<Double>(operands2), operators: CalculatorItemQueue<Operator>(operator2))
        var formul3 = Formula(operands: CalculatorItemQueue<Double>(operands3), operators: CalculatorItemQueue<Operator>(operator3))
        var formul4 = Formula(operands: CalculatorItemQueue<Double>(operands4), operators: CalculatorItemQueue<Operator>(operator4))
        
        let expectation1 = 4.1
        let expectation2 = 160.69
        let expectation3 = -0.5237381309345327
        let expectation4 = 5525.5199999999995
        
        // when
        let result1 = try formul1.result()
        let result2 = try formul2.result()
        let result3 = try formul3.result()
        let result4 = try formul4.result()
        
        // then
        XCTAssertEqual(result1, expectation1)
        XCTAssertEqual(result2, expectation2)
        XCTAssertEqual(result3, expectation3)
        XCTAssertEqual(result4, expectation4)
    }
    
    func test_lhs_rhs_operator가_여러_개이면_앞에서부터_순서대로_연산한_후_연산_결과를_반환한다() throws {
        // given
        let operands = CalculatorItemQueue<Double>([1, 2, 5, 2, 2, 20, 5])
        let operators = CalculatorItemQueue<Operator>([.add, .add, .divide, .multiply, .add, .subtract])
        sut = Formula(operands: operands, operators: operators)
        
        let expectation = 23.0
        
        // when
        let result = try sut.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_lhs_rhs_operator가_하나이면서_0으로_나누면_DivisionByZero_에러가_발생한다() {
        // given
        let random: Double = Double.random(in: -100...100)
        let operands = CalculatorItemQueue<Double>([random, 0])
        let operators = CalculatorItemQueue<Operator>([.divide])
        sut = Formula(operands: operands, operators: operators)
        
        // then
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_lhs_rhs_operator가_여러_개이면서_중간에_0으로_나누면_DivisionByZero_에러가_발생한다() {
        // given
        let operands = CalculatorItemQueue<Double>([1, 2, 5, 0, 2, 20, 5])
        let operators = CalculatorItemQueue<Operator>([.add, .add, .divide, .multiply, .add, .subtract])
        sut = Formula(operands: operands, operators: operators)
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .divisionByZero)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_lhs의_옵셔널_바인딩을_실패했을_때_NotFoundOperand_에러가_발생한다() {
        // given
        let operands = CalculatorItemQueue<Double>([])
        let operators = CalculatorItemQueue<Operator>([.add])
        sut = Formula(operands: operands, operators: operators)
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .notFoundOperand)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_rhs의_옵셔널_바인딩을_실패했을_때_NotFoundOperand_에러가_발생한다() {
        // given
        let operands = CalculatorItemQueue<Double>([1.0])
        let operators = CalculatorItemQueue<Operator>([.add])
        sut = Formula(operands: operands, operators: operators)
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .notFoundOperand)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_operator의_옵셔널_바인딩을_실패했을_때_NotFoundOperator_에러가_발생한다() {
        // given
        let operands = CalculatorItemQueue<Double>([1.0, 2.0])
        let operators = CalculatorItemQueue<Operator>([])
        sut = Formula(operands: operands, operators: operators)
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .notFoundOperator)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_여러_개의_operands가_존재하고_마지막_rhs가_옵셔널_바인딩을_실패했을_때_NotFoundOperator_에러가_발생한다() {
        // given
        let operands = CalculatorItemQueue<Double>([1.0, 2.0, 3.0, 4.0])
        let operators = CalculatorItemQueue<Operator>([.add, .add, .add, .add])
        sut = Formula(operands: operands, operators: operators)
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .notFoundOperand)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
}
