//
//  FormulaTest.swift
//  CalculatorTests
//
//  Created by 박병호 on 2021/11/09.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    
    func test_큐에_1_더하기_2_순서로_enqueue하면_result는_3이다() throws {
        var operators = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()
        
        operands.enQueue(1)
        operators.enQueue(.add)
        operands.enQueue(2)
        
        var formula = Formula(operands: operands, operators: operators)
        
        try XCTAssertEqual(formula.result(), 3)
    }
    
    func test_큐에_1_더하기_2_나누기_3의_순서로_enqueue하면_result는_1이다() throws {
        var operators = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()
        
        operands.enQueue(1)
        operators.enQueue(.add)
        operands.enQueue(2)
        operators.enQueue(.divide)
        operands.enQueue(3)
        
        var formula = Formula(operands: operands, operators: operators)
        
        try XCTAssertEqual(formula.result(), 1)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
