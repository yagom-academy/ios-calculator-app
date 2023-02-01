//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 무리 on 2023/02/01.
//

import XCTest
@testable import Calculator
final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - result Unit Test
    func test_result호출시_각Queue를이용하여_예상한연산을_반환한다() {
        // given
        for number in 1...4 {
            sut.operands.enqueue(Double(number))
        }
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        sut.operators.enqueue(.substract)
        let expectation: Double = 5
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result호출시_음수값이있어도_예상한연산을_반환한다() {
        // given
        for number in -2...2 {
            sut.operands.enqueue(Double(number))
        }
        sut.operators.enqueue(.substract)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.add)
        let expectation: Double = 2
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - divde 0 Unit Test
    func test_0으로나누면_nan을반환한다() {
        // given
        sut.operands.enqueue(10)
        sut.operands.enqueue(0)
        sut.operators.enqueue(.divide)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_연산중간에_나누기0이있을경우_nan을반환한다() {
        // given
        sut.operands.enqueue(10)
        sut.operands.enqueue(1)
        sut.operands.enqueue(0)
        sut.operands.enqueue(5)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.add)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
}
