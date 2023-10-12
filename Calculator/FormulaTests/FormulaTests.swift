//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Toy on 10/11/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result메서드호출시_값이없을때_error를리턴하는지() {
        do {
            try sut.result()
        } catch let error {
            XCTAssertEqual(error as! CalculatorError, CalculatorError.noValue)
        }
    }
    
    func test_result메서드호출시_3더하기2가_5를리턴하는지() throws {
        let input = "2 + 3"
        var parse = ExpressionParser.parse(from: input)
        
        let result = try parse.result()
        
        XCTAssertEqual(result, 5.0)
    }
    
    func test_result메서드호출시_마이너스5빼기마이너스5가_0을리턴하는지() throws {
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(-5)
        sut.operands.enqueue(-5)
        
        let result = try sut.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_result메서드호출시_5나누기2곱하기3이_7점5를리턴하는지() throws {
        sut.operands.enqueue(5)
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.divide)
        sut.operators.enqueue(.multiply)
        let result = try sut.result()
        
        XCTAssertEqual(result, 7.5)
    }
    
    func test_result메서드호출시_5나누기0이_에러를던지는지() throws {
        sut.operands.enqueue(5)
        sut.operands.enqueue(0)
        sut.operators.enqueue(.divide)
        
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.notANumber)
        }
    }
    
    func test_result메서드호출시_1빼기3이_마이너스2를리턴하는지() throws {
        sut.operands.enqueue(1)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.subtract)
        let result = try sut.result()
        
        XCTAssertEqual(result, -2)
    }
}
