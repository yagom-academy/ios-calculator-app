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
    
    func test_enqueue_5_2입력후_곱하기하고_formula값이_10과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .multiply)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 10)
    }
    
    func test_enqueue_5_2입력후_더하기하고_formula값이_7과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .add)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 7)
    }
    
    func test_enqueue_5_2입력후_빼기하고_formula값이_3과같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .subtract)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 3)
    }
    
    func test_enqueue_5_2입력후_나누고하고_formula값이_2쩜5와같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .divide)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 2.5)
    }
    
    func test_enqueue_3개의값인_5_2_3_입력후_더하고하고_빼기하고_formula값이4와_같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        sut.enqueue(item: 3.0)
        
        //when
        operators.enqueue(item: .add)
        operators.enqueue(item: .subtract)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 4)
    }
    
    func test_enqueue_3개의값인_5_2_3_입력후_더하고하고_더하기하고_formula값이10와_같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        sut.enqueue(item: 3.0)
        
        //when
        operators.enqueue(item: .add)
        operators.enqueue(item: .add)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 10)
    }
    
    func test_enqueue_3개의값인_5_2_3_입력후_더하고하고_곱하기하고_formula값이21와_같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        sut.enqueue(item: 3.0)
        
        //when
        operators.enqueue(item: .add)
        operators.enqueue(item: .multiply)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 21)
    }
    
    func test_enqueue_3개의값인_5_2_2_입력후_나누기하고_곱하기하고_formula값이21와_같은지확인() {
        //given
        sut.enqueue(item: 5.0)
        sut.enqueue(item: 2.0)
        sut.enqueue(item: 2.0)
        
        //when
        operators.enqueue(item: .multiply)
        operators.enqueue(item: .divide)
        
        let formula = Formula(operands: sut, operators: operators)
        
        //then
        XCTAssertEqual(formula.result(), 5)
    }
}
