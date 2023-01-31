//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by jiye Yi on 2023/01/27.
//

import XCTest
@testable import Calculator
final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let operand: [Double] = []
        let operators: [Operator] = []
        
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
        
        sut = Formula(operands: operandValue, operators: operatorValue)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result실행시_0을반환한다() {
        let expectation: Double = 0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operand가_비어있으면_0을반환한다() {
        let expectation: Double? = .zero
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operand값이있고_operator가있으면_계산된값이_반환된다() {
        //given
        let operand: [Double] = [10, 20]
        let operators: [Operator] = [.add]
       
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
        
        let expectation: Double = 30
        
        //when
        sut = Formula(operands: operandValue, operators: operatorValue)
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operand가_여러개있고_operator가_여러개있을때_순차적으로_계산된값이_반환된다() {
        //given
        let operand: [Double] = [10, 5, 1.5]
        let operators: [Operator] = [.add, .subtract]
        
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
      
        let expectation: Double = 13.5
        
        //when
        sut = Formula(operands: operandValue, operators: operatorValue)
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_0을나눌때_오류가발생하여_NaN이된다() {
        //given
        let operand: [Double] = [10, 0]
        let operators: [Operator] = [.divide]
        
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
       
        let expectation: Bool = true
        
        //when
        sut = Formula(operands: operandValue, operators: operatorValue)
        let result = sut.result()?.isNaN
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_nextOperand가_없을때_firstOperand를반환한다() {
        //given
        let operand: [Double] = [10]
        let operators: [Operator] = [.add]
        
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
        
        let expectation: Double = 10
        
        //when
        sut = Formula(operands: operandValue, operators: operatorValue)
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operatorType이없을때_nil을반환한다() {
        //given
        let operand: [Double] = [10, 11]
        let operators: [Operator] = []
        
        let operandValue = CalculatorItemQueue<Double>(items: operand)
        let operatorValue = CalculatorItemQueue<Operator>(items: operators)
        
        //when
        sut = Formula(operands: operandValue, operators: operatorValue)
        let result = sut.result()
        
        //then
        XCTAssertNil(result)
    }
    
}
