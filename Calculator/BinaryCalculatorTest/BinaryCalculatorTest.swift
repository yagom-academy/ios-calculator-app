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
        test_convertType_11_입력()
        test_convertType_음수_11_입력()
    }
    
    func test_convertType_11_입력() {
        XCTAssertEqual(try binaryCalculator.convertType(inputNumber: "11"), 3)
    }
    
    func test_convertType_음수_11_입력() {
        XCTAssertEqual(try binaryCalculator.convertType(inputNumber: "-11"), -3)
    }
}
