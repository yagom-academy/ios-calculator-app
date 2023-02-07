//
//  FormulaTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/31.
//

import XCTest

@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var sut: Formula!
    
    override func setUpWithError() throws {
        
        let operators = CalculatorItemQueue<Operator>()
        let operands = CalculatorItemQueue<Double>()
        
        sut = Formula(operators: operators, operands: operands)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_currentStackCount가_0일_즉_큐가비어있을때_result는_0을_반환한다() {
        
        let expectedResult = 0.0
        let result = sut.result()
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_operandEnqueueStack과_operatorEnqueueStack이_하나씩밖에_없을경우_result는_해당스택값을_반환한다() {
        
        sut.operands.enqueueItem(41.0)
        sut.operators.enqueueItem(Operator.add)
        
        let expectedResult = 41.0
        let result = sut.result()
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_2더하기43빼기25곱하기6나누기12의_result는_10을_반환한다() {
        sut.operands.enqueueItem(2)
        sut.operands.enqueueItem(43)
        sut.operands.enqueueItem(25)
        sut.operands.enqueueItem(6)
        sut.operands.enqueueItem(12)
        
        sut.operators.enqueueItem(Operator.add)
        sut.operators.enqueueItem(Operator.subtract)
        sut.operators.enqueueItem(Operator.multiply)
        sut.operators.enqueueItem(Operator.divide)
        
        let expectedResult = 10.0
        let result = sut.result()
        
        XCTAssertEqual(expectedResult, result)
    }

}
