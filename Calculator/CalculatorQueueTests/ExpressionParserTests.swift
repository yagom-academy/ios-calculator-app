//
//  ExpressionParserTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/16.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    var exampleData: String = " "
        
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        exampleData = " "
    }

    func test_연산자와_피연산자를_각각_다른_큐에_담는지() throws {
        exampleData = "12 * -3"
        
        var testFormula = ExpressionParser.parse(from: exampleData)
        let exampleOperator: Operator = .multiply
        
        guard let testData = testFormula.operators.dequeue() else {
            throw OperatorQueueError.NoElement
        }
        
        XCTAssertEqual(exampleOperator, testData)
    }
    
    func test_12_곱하기_마이너스3_더하기_5_빼기_4_나누기_5_는_마이너스7_인지() throws {
        exampleData = "12 * -3 + 5 ₋ 4 / 5"
        
        var testFormula = ExpressionParser.parse(from: exampleData)
        
        XCTAssertEqual(-7, try testFormula.result())
    }
}
