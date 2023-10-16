//
//  ExpressionPaserTests.swift
//  ExpressionPaserTests
//
//  Created by Charles on 2023/10/11.
//

import XCTest
@testable import Calculator

final class ExpressionPaserTests: XCTestCase {
    
    func test_input과_각expactation이_주어지고_parse가호출시_각컨테이너에_들어간결과는_각expactation값과_같다() {
        // given
        let input = "3×2−1"
        let operandsExpactation = [3.0, 2.0, 1.0]
        let operatorsExpactation = [Operator(rawValue: "×")!, Operator(rawValue: "−")!]
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.enqueueContainer, operandsExpactation)
        XCTAssertEqual(result.operators.enqueueContainer, operatorsExpactation)
    }
    
    func test_input과_각expactation이_주어지고_parse가호출시_각컨테이너에_들어간결과는_각expactation값과_같다_() {
        // given
        let input = "5×2÷-1"
        let operandsExpactation = [5.0, 2.0, -1.0]
        let operatorsExpactation = [Operator(rawValue: "×")!, Operator(rawValue: "÷")!]
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.enqueueContainer, operandsExpactation)
        XCTAssertEqual(result.operators.enqueueContainer, operatorsExpactation)
    }
}
