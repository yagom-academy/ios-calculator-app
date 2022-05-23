//
//  FormulaTests.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/19.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        let operandsQueue = CalculatorItemQueue()
        let operatorQueue = CalculatorItemQueue()
        sut = Formula(operands: operandsQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

// MARK: - Formula.result()
    func test_아무값도없을때_결과는_0() {
        //given
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 0.0)
    }
    
    func test_15한개만있을때_결과는_15() {
        //given
        sut.operands.enQueue(15.0)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 15.0)
    }
    
    func test_15와_연산자만있을때_결과는_15() {
        //given
        sut.operands.enQueue(15.0)
        sut.operators.enQueue(Operator.add)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 15.0)
    }
    
    func test_피연산자2개_연산자1개_결과() {
        //given
        sut.operands.enQueue(15.0)
        sut.operators.enQueue(Operator.add)
        sut.operands.enQueue(9.0)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 24.0)
    }
    
    func test_피연산자3개_연산자1개_결과() {
        //given
        sut.operands.enQueue(15.0)
        sut.operators.enQueue(Operator.add)
        sut.operands.enQueue(9.0)
        sut.operands.enQueue(3.0)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 24.0)
    }
    
    func test_피연산자3개_연산자2개_결과() {
        //given
        sut.operands.enQueue(15.0)
        sut.operators.enQueue(Operator.add)
        sut.operands.enQueue(9.0)
        sut.operators.enQueue(Operator.divide)
        sut.operands.enQueue(3.0)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 8.0)
    }
}
