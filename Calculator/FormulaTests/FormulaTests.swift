//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 나이든별, 민쏜
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: CalculatorItemQueue(array: [100, 200]), operators: CalculatorItemQueue(array: [Operator.add]))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_result메서드에서_100과200을_더하면_300을반환() {
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, 300)
    }
    
    func test_result메서드에서_100에서200을_빼면_마이너스100을반환() {
        // given
        sut = Formula(operands: CalculatorItemQueue(array: [100, 200]), operators: CalculatorItemQueue(array: [Operator.subtract]))
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, -100)
    }
    
    func test_result메서드에서_100에200을_곱하면_20000반환() {
        // given
        sut = Formula(operands: CalculatorItemQueue(array: [100, 200]), operators: CalculatorItemQueue(array: [Operator.multiply]))
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, 20000)
    }
    
    func test_result메서드에서_100을200으로나누면_영점오반환() {
        // given
        sut = Formula(operands: CalculatorItemQueue(array: [100, 200]), operators: CalculatorItemQueue(array: [Operator.divide]))
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, 0.5)
    }
    
    func test_Formula가_5_더하기4_빼기3_곱하기2_나누기1을하면_12를반환() {
        // given
        sut = Formula(operands: CalculatorItemQueue(array: [5, 4, 3, 2, 1]),
                      operators: CalculatorItemQueue(array: [Operator.add, Operator.subtract, Operator.multiply, Operator.divide]))
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, 12)
    }
    
    func test_result메서드가_가진값이없으면_noRemainingValue오류_반환() {
        // given
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue(array: [Operator.add]))
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.noRemainingValue)
        }
    }
    
    func test_result메서드를_실행했을때_0으로나누는_계산을했다면_dividedByZero오류반환() {
        // given
        sut = Formula(operands: CalculatorItemQueue(array: [100, 0]), operators: CalculatorItemQueue(array: [Operator.divide]))
        
        // then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.dividedByZero)
        }
    }
}
