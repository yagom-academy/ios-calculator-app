//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/14.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_2더하기3의결과가_5인지() {
        sut.operands.enqueue(element: 2)
        sut.operands.enqueue(element: 3)
        sut.operators.enqueue(element: .add)
        
        XCTAssertEqual(try sut.result(), 5)
    }
    
    func test_2더하기3_곱하기4의결과가_20인지() {
        sut.operands.enqueue(element: 2)
        sut.operands.enqueue(element: 3)
        sut.operands.enqueue(element: 4)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .multiply)
        
        XCTAssertEqual(try sut.result(), 20)
    }
    
    func test_2더하기3_곱하기4_빼기10의결과가_10인지() {
        sut.operands.enqueue(element: 2)
        sut.operands.enqueue(element: 3)
        sut.operands.enqueue(element: 4)
        sut.operands.enqueue(element: 10)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .multiply)
        sut.operators.enqueue(element: .subtract)
        
        XCTAssertEqual(try sut.result(), 10)
    }
    
    func test_2더하기3_곱하기4_빼기10_나누기5의결과가_2인지() {
        sut.operands.enqueue(element: 2)
        sut.operands.enqueue(element: 3)
        sut.operands.enqueue(element: 4)
        sut.operands.enqueue(element: 10)
        sut.operands.enqueue(element: 5)
        sut.operators.enqueue(element: .add)
        sut.operators.enqueue(element: .multiply)
        sut.operators.enqueue(element: .subtract)
        sut.operators.enqueue(element: .divide)
        
        XCTAssertEqual(try sut.result(), 2)
    }
    
    func test_0_으로나눴을때_에러가발생하는지() {
        let input = "2/0"
        var formula = ExpressionParser.parse(from: input)
        
        XCTAssertThrowsError(try formula.result())
    }
    
    func test_parse와_result메서드호출시_원하는연산결과를_내는지() {
        let input = "3.5+15.5_21/8*2"
        var formula =  ExpressionParser.parse(from: input)
        
        XCTAssertEqual(-0.5, try formula.result())
    }
    
    func test_음수와_빼기연산자가존재할때_원하는연산결과를_내는지() {
        let input = "12.3+4.2_-1.1/8*2"
        var formula =  ExpressionParser.parse(from: input)
        
        XCTAssertEqual(4.4, try formula.result())
    }
}
