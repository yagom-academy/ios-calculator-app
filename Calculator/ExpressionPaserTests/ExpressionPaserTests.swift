//
//  ExpressionPaserTests.swift
//  ExpressionPaserTests
//
//  Created by Charles on 2023/10/11.
//

import XCTest
@testable import Calculator

final class ExpressionPaserTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_띄워쓰기없이_요소들이_주어졌을때_결과값은_5이다() {
        // given
        sut = ExpressionParser.parse(from: "3x2-1")
        let expactation: Double = 5
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expactation)
    }
    
    func test_양쪽끝에공백이있는_요소들이_주어졌을때_결과값은_5이다() {
        // given
        sut = ExpressionParser.parse(from: " 3x2-1 ")
        let expactation: Double = 5
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expactation)
    }
    
    func test_사이사이공백이존재하는_요소들이_주어졌을때_결과값은_5이다() {
        // given
        sut = ExpressionParser.parse(from: " 3  x 2 -1 ")
        let expactation: Double = 5
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expactation)
    }

}
