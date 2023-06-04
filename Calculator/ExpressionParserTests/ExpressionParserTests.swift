//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by EtialMoon on 2023/06/04.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: StubExpressionParser!
    let testFormula1 = "1+2-3*4/5"
    let testFormula2 = "1+2"

    override func setUpWithError() throws {
        sut = StubExpressionParser()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_componentsByOperators에_testFormula1을넣으면_숫자만남은배열이반환된다() {
        let expectation = ["1", "2", "3", "4", "5"]
        
        let result = sut.componentsByOperators(from: testFormula1)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_componentsByOperators에_testFormula2을넣으면_숫자만남은배열이반환된다() {
        let expectation = ["1", "2"]
        
        let result = sut.componentsByOperators(from: testFormula2)
        
        XCTAssertEqual(result, expectation)
    }
}
