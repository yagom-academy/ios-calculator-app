//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Jaehun Lee on 2/12/24.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var someFormula: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        var operandsList: CalculatorItemQueue<Double> = .init()
        var operatorsList: CalculatorItemQueue<Operator> = .init()
        
        let operandsArr = [120.0, 3.0, -20.0, 10.0, 4.0, 2.0]
        let operatorsArr: [Operator] = [.divide, .add, .subtract, .multiply, .divide]
        
        operandsArr.forEach { operandsList.enqueue(element: $0) }
        operatorsArr.forEach { operatorsList.enqueue(element: $0) }
        
        someFormula = Formula(operands: operandsList, operators: operatorsList)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        someFormula = nil
    }
    
    func test_Parse() {
        // Given
        let expression = "120.0/3.+-20−10.0*4.0/2.0"
        
        // When
        let resultFormula = ExpressionParser.parse(from: expression)
        
        // Then
        XCTAssertEqual(someFormula, resultFormula)
    }
}
