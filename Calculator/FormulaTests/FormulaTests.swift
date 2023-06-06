//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Hemg on 2023/06/07.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        operators = nil
    }
    
    func test_enqueue_값입력후_곱하기하고_formula값과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .multiply)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 10)
    }
    
    func test_enqueue_값입력후_더하기하고_formula값과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .add)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 7)
    }
    
    func test_enqueue_값입력후_빼기하고_formula값과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .subtract)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 3)
    }
    
    func test_enqueue_값입력후_나누고하고_formula값과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .divide)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 2.5)
    }
    
}
