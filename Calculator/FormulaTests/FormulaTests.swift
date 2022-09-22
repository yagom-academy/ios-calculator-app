//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 노유빈 on 2022/09/22.
//

import XCTest

@testable import Calculator
final class FormulaTests: XCTestCase {
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
        sut = nil
    }
    
    func generateCalculatorItemQueue<Type: CalculateItem> (_ calculatorItems: [Type]) -> CalculatorItemQueue<Type> {
        var calculatorItemQueue = CalculatorItemQueue<Type>()
        
        for calculatorItem in calculatorItems {
            calculatorItemQueue.push(calculatorItem)
        }
        
        return calculatorItemQueue
    }
    
    func test_oprands_operators가_주어졌을때_결과가_14인지_확인() {
        operands = generateCalculatorItemQueue([2, 3, 3, 1])
        operators = generateCalculatorItemQueue([Operator.add, Operator.multiply, Operator.subtract])
        
        sut = Formula(operands: operands, operators: operators)
        
        let result = try? sut.result()
        
        
        XCTAssertEqual(result, 14.0)
    }
    
    func test_oprands_operators가_주어졌을때_결과가_2인지_확인() {
        operands = generateCalculatorItemQueue([3, 3, 2, 1])
        operators = generateCalculatorItemQueue([Operator.divide, Operator.add, Operator.subtract])
        
        sut = Formula(operands: operands, operators: operators)
        
        let result = try? sut.result()
        
        
        XCTAssertEqual(result, 2)
    }
    
    func test_oprands_operators가_주어졌을때_결과가_minus_0_5_인지_확인() {
        operands = generateCalculatorItemQueue([1, 2, 3, 2, 3, 6])
        operators = generateCalculatorItemQueue([Operator.add, Operator.subtract, Operator.multiply, Operator.subtract, Operator.divide])
        
        sut = Formula(operands: operands, operators: operators)
        
        let result = try? sut.result()
        
        
        XCTAssertEqual(result, -0.5)
    }
    
    func test_oprands_operators가_주어졌을때_에러를_던지는지_확인() {
        operands = generateCalculatorItemQueue([1, 0])
        operators = generateCalculatorItemQueue([Operator.divide])
        
        sut = Formula(operands: operands, operators: operators)
        
        XCTAssertThrowsError(try sut.result())
    }
}
