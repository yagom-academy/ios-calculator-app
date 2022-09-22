//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 노유빈 on 2022/09/22.
//

import XCTest

@testable import Calculator
@testable import CalculatorItemQueueTests
final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands = CalculatorItemQueue()
    var operators = CalculatorItemQueue()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: operands, operators: operators)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func generateCalculatorItemQueue(_ calculatorItems: [CalculateItem]) -> CalculatorItemQueue {
        var calculatorItemQueue = CalculatorItemQueue()
        
        for calculatorItem in calculatorItems {
            calculatorItemQueue.push(calculatorItem)
        }
        
        return calculatorItemQueue
    }
    
    func test_oprands_operators가_주어졌을때_결과가_6인지_확인() {
        operands = generateCalculatorItemQueue([1.0, 2.0, 3.0])
        operators = generateCalculatorItemQueue([Operator.add, Operator.add])
        
        sut = Formula(operands: operands, operators: operators)
        
        let result = try? sut.result()
        
        
        XCTAssertEqual(result, 6.0)
    }
    
    func test_oprands_operators가_주어졌을때_에러를_던지는지_확인() {
        operands = generateCalculatorItemQueue([1.0, 0.0])
        operators = generateCalculatorItemQueue([Operator.divide])
        
        sut = Formula(operands: operands, operators: operators)
        
        XCTAssertThrowsError(try sut.result())
    }
}
