//
//  FormulaTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    var sut: Formula!
    let operandTestCases1: CalculatorItemQueue<Double> = CalculatorItemQueue([-10, -3])
    let operandTestCases2: CalculatorItemQueue<Double> = CalculatorItemQueue([12, 0])
    let operandTestCases3: CalculatorItemQueue<Double> = CalculatorItemQueue([3])
    let operandTestCases4: CalculatorItemQueue<Double> = CalculatorItemQueue([5, 10])


    let operatorTestCases1: CalculatorItemQueue<Operator> = CalculatorItemQueue([.add, .add])
    let operatorTestCases2: CalculatorItemQueue<Operator> = CalculatorItemQueue([.add, .divide])
    let operatorTestCases3: CalculatorItemQueue<Operator> = CalculatorItemQueue([.add, .multiply, .divide])
    let operatorTestCases4: CalculatorItemQueue<Operator> = CalculatorItemQueue([.add, .substract])


    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: operandTestCases1, operators: operatorTestCases1)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_숫자가_하나만_있을때_처음_입력한_값이_리턴이_되는지() {
        sut = Formula(operands: operandTestCases3, operators: operatorTestCases3)
        
        XCTAssertEqual(3.0, try sut.result())
    }
    
    func test_음수10과_음수3을_더하면_음수13이_리턴되는지() {
        sut = Formula(operands: operandTestCases1, operators: operatorTestCases1)
        
        XCTAssertEqual(-13.0, try sut.result())
    }
    
    func test_음수10과_음수3을_빼면_음수7이_리턴되는지() {
        sut = Formula(operands: operandTestCases1, operators: operatorTestCases4)
        
        XCTAssertEqual(-7.0, try sut.result())
    }
    
    func test_음수10과_음수3을_곱하면_30이_리턴되는지() {
        sut = Formula(operands: operandTestCases1, operators: operatorTestCases3)
        
        XCTAssertEqual(30.0, try sut.result())
    }
    
    func test_5와_10을_나누면_영점오가_리턴되는지() {
        sut = Formula(operands: operandTestCases4, operators: operatorTestCases2)
        
        XCTAssertEqual(0.5, try sut.result())
    }
    
    func test_Formula에서_divide연산시_0으로나눌때_false리턴() {
        sut = Formula(operands: operandTestCases2, operators: operatorTestCases2)
        do {
            _ = try sut.result()
        } catch CalculatorError.divideByZero {
            XCTAssertFalse(false)
        } catch {
            XCTAssertFalse(true)
        }
    }
}
