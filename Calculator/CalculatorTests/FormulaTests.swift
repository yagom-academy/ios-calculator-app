//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/14.
//

import XCTest

class FormulaTests: XCTestCase {
    var operands: CalculateItemQueue<Double>!
    var operators: CalculateItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculateItemQueue<Double>()
        operators = CalculateItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
    }

    func test_2더하기3의결과가_5인지() {
        operands.enqueue(element: 2)
        operands.enqueue(element: 3)
        operators.enqueue(element: .add)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 5)
    }
    
    func test_2더하기3_곱하기4의결과가_20인지() {
        operands.enqueue(element: 2)
        operands.enqueue(element: 3)
        operands.enqueue(element: 4)
        operators.enqueue(element: .add)
        operators.enqueue(element: .multiply)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 20)
    }
    
    func test_2더하기3_곱하기4_빼기10의결과가_10인지() {
        operands.enqueue(element: 2)
        operands.enqueue(element: 3)
        operands.enqueue(element: 4)
        operands.enqueue(element: 10)
        operators.enqueue(element: .add)
        operators.enqueue(element: .multiply)
        operators.enqueue(element: .subtract)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 10)
    }
    
    func test_2더하기3_곱하기4_빼기10_나누기5의결과가_2인지() {
        operands.enqueue(element: 2)
        operands.enqueue(element: 3)
        operands.enqueue(element: 4)
        operands.enqueue(element: 10)
        operands.enqueue(element: 5)
        operators.enqueue(element: .add)
        operators.enqueue(element: .multiply)
        operators.enqueue(element: .subtract)
        operators.enqueue(element: .divide)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 2)
    }
    
    func test_0_으로나눴을때_에러가발생하는지() {
        let input = "2/0"
        var formula = ExpressionParser.parse(from: input)
        
        XCTAssertThrowsError(try formula.result())
    }
    
    func test_parse와_result메서드호출시_원하는연산결과를_내는지() {
        let input = "3.5+15.5−21÷8×2"
        var formula = ExpressionParser.parse(from: input)
        
        XCTAssertEqual(-0.5, try formula.result())
    }
    
    func test_음수와_빼기연산자가존재할때_원하는연산결과를_내는지() {
        let input = "12.3+4.2−-1.1÷8×2"
        var formula = ExpressionParser.parse(from: input)
        
        XCTAssertEqual(4.4, try formula.result())
    }
}
