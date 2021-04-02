//
//  BinaryCalculatorTest.swift
//  BinaryCalculatorTest
//
//  Created by ysp on 2021/04/02.
//

import XCTest
@testable import Calculator
class BinaryCalculatorTest: XCTestCase {

    var binaryCalculator = BinaryCalculator()
    
    override func setUpWithError() throws {
      binaryCalculator = BinaryCalculator()
      try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_convertType_11_입력() {
        XCTAssertEqual(binaryCalculator.convertType(inputNumber: "11"), 3)
    }
    
    func test_convertType_음수_11_입력() {
        XCTAssertEqual(binaryCalculator.convertType(inputNumber: "-11"), -3)
    }
}
