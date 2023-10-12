//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Toy on 10/10/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    func test_parse메서드호출시_연산자와_피연산자가_분리되어enqueue되는지() {
        let input = "3 + 7 - -10"
        var parse = ExpressionParser.parse(from: input)
        var numbers = [Double]()
        var operators = [Operator]()
        let resultNumbers = [3.0, 7.0, -10.0]
        let resultOperators: [Operator] = [.add, .subtract]

        while let number = parse.operands.dequeue() {
            numbers.append(number)
        }
        
        while let `operator` = parse.operators.dequeue() {
            operators.append(`operator`)
        }
        
        XCTAssertEqual(numbers, resultNumbers)
        XCTAssertEqual(operators, resultOperators)
    }
}
