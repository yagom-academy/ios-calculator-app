//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kokkilE on 2023/01/27.
//

import XCTest
@testable import Calculator

extension ExpressionParser {
    static func exposeComponentsByOperators(from input: String) -> [String]  {
        var components = [String]()
        components.append(input)
        
        for target in Operator.allCases {
            var splitedComponents = [String]()
            
            components.forEach {
                splitedComponents += $0.split(with: target.rawValue)
            }
            
            components = splitedComponents
        }
        
        return components
    }
}

final class ExpressionParserTests: XCTestCase {

    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        //sut = LinkedList<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        //sut = nil
    }

    func test_componentsByOperators_호출시_연산자가_제거된_String_배열을_반환한다() {
        // given
        let input = "1+2-3*4+5+10/6-7"
        let expectation = [ "1", "2", "3", "4", "5", "10", "6", "7"]
        
        // when
        let result = ExpressionParser.exposeComponentsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse_호출시_연산자와숫자가분리된_큐데이터가저장된_Formula를_반환한다() {
        // given
        let input = "1+2-3*4+5+10/6-7"
        let expectationOperands: [Double] = [ 1, 2, 3, 4, 5, 10, 6, 7]
        let expectationOperators = [ "+", "-", "*", "+", "+", "/", "-" ]
        
        // when
        var result = ExpressionParser.parse(from: input)
        
        // then
        expectationOperands.forEach {
            let resultOperands = result.operands.dequeueCalculateItems()!.data
            XCTAssertEqual($0, resultOperands)
        }
        
        expectationOperators.forEach {
            let resultOperator = result.operators.dequeueCalculateItems()!.data
            XCTAssertEqual($0.first, resultOperator.rawValue)
        }
    }
}
