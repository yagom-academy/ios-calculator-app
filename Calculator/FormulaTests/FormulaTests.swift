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
        
        let operands = CalculatorItemQueue<Double>()
     
        let operators = CalculatorItemQueue<Operator>()
        
        sut = Formula(operands: operands, operators: operators)
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
        sut.operands.enqueue(10)
        sut.operands.enqueue(20)
        sut.operators.enqueue(.add)
        let expectation: Double = 30
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operand가_여러개있고_operator가_여러개있을때_순차적으로_계산된값이_반환된다() {
        //given
        sut.operands.enqueue(10)
        sut.operands.enqueue(5)
        sut.operands.enqueue(1.5)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.subtract)
        let expectation: Double = 13.5
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_0을나눌때_오류가발생하여_NaN이된다() {
        //given
        sut.operands.enqueue(10)
        sut.operands.enqueue(0)
        sut.operators.enqueue(.divide)
        let expectation: Bool = true
        
        //when
        let result = sut.result()?.isNaN
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_nextOperand가_없을때_firstOperand를반환한다() {
        //given
        sut.operands.enqueue(10)
        sut.operators.enqueue(.add)
        let expectation: Double = 10
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
   
}
