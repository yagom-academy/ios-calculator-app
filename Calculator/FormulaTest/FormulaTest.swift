//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by DuDu on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula?
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_연산이_연산자우선순위와_관계없이_입력순서대로_진행되야한다() {
        //given
        let operands: [Double] = [3,2,1,5]
        let operators: [Operator] = [.add, .subtract, .multiply]
        
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        operands.forEach{ operandQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0)}
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
    
        //when
        let result = try? sut?.result()
        
        //then
        XCTAssertEqual(result, 20)
    }
    
    func test_피연산자의개수가_연산자의개수보다_하나작은게_아니라면_CalculateError_invalidFormula가_발생해야한다() {
        //given
        let operands: [Double] = [1,2,3,4]
        let operators: [Operator] = [.add]
        
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        operands.forEach{ operandQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0)}
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        //when, then
        XCTAssertThrowsError(try sut?.result(), "invalidFormula") { error in
            XCTAssertEqual(error as? CalculateError, .invalidFormula)
        }
    }
    
    func test_연산도중에_0으로_나누는연산이_있다면_CalculatorError_divideByZero가_발생해야한다() {
        //given
        let operands: [Double] = [1,1,0]
        let operators: [Operator] = [.subtract, .divide]
        
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        operands.forEach{ operandQueue.enqueue($0) }
        operators.forEach{ operatorQueue.enqueue($0)}
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        //when, then
        XCTAssertThrowsError(try sut?.result(), "divideByZero") { error in
            XCTAssertEqual(error as? CalculateError, .divideByZero)
        }
    }
}
