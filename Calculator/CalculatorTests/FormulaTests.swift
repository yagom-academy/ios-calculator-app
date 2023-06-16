//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Minsup on 2023/06/01.
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
        var formul1 = Formula(operands: [1, 2], operators: [.add])
        var formul2 = Formula(operands: [10, 150], operators: [.subtract])
        var formul3 = Formula(operands: [-10, 20], operators: [.divide])
        var formul4 = Formula(operands: [-100, -55], operators: [.multiply])
        
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
        var formul1 = Formula(operands: [1.3, 2.8], operators: [.add])
        var formul2 = Formula(operands: [10.3, -150.39], operators: [.subtract])
        var formul3 = Formula(operands: [-10.48, 20.01], operators: [.divide])
        var formul4 = Formula(operands: [-100.1, -55.2], operators: [.multiply])
        
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
        sut = Formula(
            operands: [1, 2, 5, 2, 2, 20, 5],
            operators: [.add, .add, .divide, .multiply, .add, .subtract]
        )
        
        let expectation = 23.0
        
        // when
        let result = try sut.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_수식_중간에_0으로_나누면_nan이_반환된다() {
        // given
        sut = Formula(
            operands: [1, 2, 5, 0, 2, 20, 5],
            operators: [.add, .add, .divide, .multiply, .add, .subtract]
        )
        
        // then
        XCTAssertTrue(try sut.result().isNaN)
    }
    
    func test_lhs의_옵셔널_바인딩을_실패했을_때_NotFoundOperand_에러가_발생한다() {
        // given
        sut = Formula(operands: [], operators: [.add])
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .emptyOperand)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_operator의_옵셔널_바인딩을_실패했을_때_NotFoundOperator_에러가_발생한다() {
        // given
        sut = Formula(operands: [1.0, 2.0], operators: [])
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            if let error = error as? CalculationError {
                XCTAssertEqual(error, .emptyOperator)
            } else {
                XCTFail("예상하지 않은 에러 출력 \(error)")
            }
        }
    }
    
    func test_마지막_rhs가_옵셔널_바인딩을_실패했을_때_에러가_발생하지_않고_마지막_연산자를_무시한_채_결과를_리턴한다() throws {
        // given
        sut = Formula(
            operands: [1.0, 2.0, 3.0, 4.0],
            operators: [.add, .add, .add, .add]
        )
        let result = try sut.result()
        let expectation = 10.0
        // then
        XCTAssertEqual(result, expectation)
    }
}
