//  ExpressionParserTests.swift
//  ExpressionParserTests
//  Created by LJ on 2022/09/23.

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testExample() throws {}
    func testPerformanceExample() throws { measure {} }

    func test_피연산자_정상추출되는지(){
        let resultArray = ExpressionParser.parse(from: "10+20*3/2+3+11-2*9")
        XCTAssertEqual(resultArray, [10.0,20.0,3.0,2.0,3.0,11.0,2.0,9.0])
    }
}
