//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Kyo on 2022/09/23.
//

import XCTest

@testable import Calculator
class FormulaTests: XCTestCase {

    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
        sut = nil
    }
    
    func test_result_정상결과값확인() {
        operands.enqueue(10.0)
        operands.enqueue(20.0)
        operands.enqueue(30.0)
        operands.enqueue(40.0)
        operands.enqueue(50.0)
        let operatorComponents = ["+", "*", "-", "/"]
        operatorComponents.compactMap { Operator(rawValue: Character($0)) }.forEach { operators.enqueue($0) }
        XCTAssertEqual(try sut.result(), 17.2)
    }
    
    func test_result_Operands비어있을때_결과값확인() {
        let operatorComponents = ["+", "*", "-", "/"]
        operatorComponents.compactMap { Operator(rawValue: Character($0)) }.forEach { operators.enqueue($0) }
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_result_Operators비어있을때_결과값확인() {
        operands.enqueue(10.0)
        operands.enqueue(20.0)
        operands.enqueue(30.0)
        operands.enqueue(40.0)
        operands.enqueue(50.0)
        XCTAssertEqual(try sut.result(), 10.0)
    }
 
    
    func test_result_Operators가_비정상적으로_적을때_결과값확인() {
        operands.enqueue(10.0)
        operands.enqueue(20.0)
        operands.enqueue(30.0)
        operands.enqueue(40.0)
        operands.enqueue(50.0)
        let operatorComponents = ["+", "*"]
        operatorComponents.compactMap { Operator(rawValue: Character($0)) }.forEach { operators.enqueue($0) }
        XCTAssertEqual(try sut.result(), 900.0)
    }
    
    func test_result_Operands가_비정상적으로_적을때_결과값확인() {
        operands.enqueue(10.0)
        operands.enqueue(20.0)
        operands.enqueue(30.0)
        let operatorComponents = ["+", "*", "-", "/"]
        operatorComponents.compactMap { Operator(rawValue: Character($0)) }.forEach { operators.enqueue($0) }
        XCTAssertThrowsError(try sut.result())
    }
}
