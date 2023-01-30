//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Harry on 2023/01/27.
//

import XCTest

final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        operands = .init(list: LinkedList())
        operators = .init(list: LinkedList())
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        operands = nil
        operators = nil
        sut = nil
    }
    
    func test_operands와_operators에_값이없을때_result는_0을_반환한다() {
        let expectedResult: Double = 0
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_3_더하기_4_빼기_5는_2이다() {
        sut.operands.enqueue(3)
        sut.operators.enqueue(.add)
        sut.operands.enqueue(4)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(5)
        let expectedResult: Double = 2
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_3_곱하기_음수4_빼기_5는_음수17이다() {
        sut.operands.enqueue(3)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(-4)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(5)
        let expectedResult: Double = -17
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_3_더하기_5_나누기_4는_2이다() {
        sut.operands.enqueue(3)
        sut.operators.enqueue(.add)
        sut.operands.enqueue(5)
        sut.operators.enqueue(.divide)
        sut.operands.enqueue(4)
        let expectedResult: Double = 2
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_3_곱하기_8_빼기_2_나누기_0은_nan이다() {
        sut.operands.enqueue(3)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(8)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.divide)
        sut.operands.enqueue(0)
        
        let result = sut.result().isNaN
        
        XCTAssertTrue(result)
    }
}
