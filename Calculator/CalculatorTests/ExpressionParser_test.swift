//
//  ExpressionParser_test.swift
//  CalculatorTests
//
//  Created by SeoDongyeon on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParser_test: XCTestCase {
    private var sut: ExpressionParser!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_분할확인() {
        let array = "-1 + 2 * 3 / -1"
        let answer = ["-1", "+", "2", "*", "3", "/", "-1"]
        
        let result = ExpressionParser.componentsByOperators(from: array)
        
        XCTAssertEqual(result, answer)
    }
}
