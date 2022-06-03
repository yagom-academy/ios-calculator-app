//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Minseong Kang on 2022/05/27.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: Formula!
    
    // MARK: - Actions
    
    override func setUpWithError() throws {
        var operandsQueue = CalculatorItemQueue<Double>()
        let operands: [Double] = [2.0, 3.0, 1.0, 4.0, 4.0]
        operands.forEach( { operandsQueue.enqueue($0) } )
        
        var operatorsQueue = CalculatorItemQueue<Operator>()
        let operators: [Operator] = [.add, .subtract, .multiply, .divide]
        operators.forEach( { operatorsQueue.enqueue($0) } )
        
        sut = Formula(operands: operandsQueue, operators: operatorsQueue)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - result()

    func test_result메서드_2더하기3빼기1곱하기4나누기4는_4가나온다() throws {
        // given
        var operandsQueue = CalculatorItemQueue<Double>()
        let operands: [Double] = [2.0, 3.0, 1.0, 4.0, 4.0]
        operands.forEach( { operandsQueue.enqueue($0) } )
        
        var operatorsQueue = CalculatorItemQueue<Operator>()
        let operators: [Operator] = [.add, .subtract, .multiply, .divide]
        operators.forEach( { operatorsQueue.enqueue($0) } )
        
        sut = Formula(operands: operandsQueue, operators: operatorsQueue)
        
        // when
        let result = try sut.result()
        
        // then
        XCTAssertEqual(result, 2+3-1*4/4)
    }
    
    func test_result메서드_0으로_나누면_에러처리하고_NaN을_리턴한다() throws -> String {
        // given
        var operandsQueue = CalculatorItemQueue<Double>()
        let operands: [Double] = [1.0, 2.0, 3.0, 4.0, 0.0]
        operands.forEach( { operandsQueue.enqueue($0) } )
        
        var operatorsQueue = CalculatorItemQueue<Operator>()
        let operators: [Operator] = [.add, .subtract, .multiply, .divide]
        operators.forEach( { operatorsQueue.enqueue($0) } )
        
        sut = Formula(operands: operandsQueue, operators: operatorsQueue)

        // then
        do {
            let result = try sut.result()
            XCTAssertThrowsError(result)
            XCTAssertEqual(String(result), "NaN")
            return String(result)
        } catch CalculatorError.dividedByZero {
            return CalculatorError.dividedByZero.description
        }
    }
}
