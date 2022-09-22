//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by hy on 2022/09/22.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result메서드호출시_연산결과가잘나오는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5,3,1]), operators: CalculatorItemQueue(enqueueStack: [Operator.multiply,Operator.add]))
        //when
        let result: Double = sut.result()
        //then
        XCTAssertEqual(result, 20)
    }
    
    func test_숫자와연산기호가_각각1개씩만있을때_reult메서드호출시_반환값이0인지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5]), operators: CalculatorItemQueue(enqueueStack: [Operator.multiply]))
        //when
        let result: Double = sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_연산기호가_숫자보다많을경우_숫자만큼만연산결과가나오는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5,3]), operators: CalculatorItemQueue(enqueueStack: [Operator.multiply, Operator.add, Operator.multiply]))
        //when
        let result:Double = sut.result()
        //then
        XCTAssertEqual(result, 15)
    }
}

