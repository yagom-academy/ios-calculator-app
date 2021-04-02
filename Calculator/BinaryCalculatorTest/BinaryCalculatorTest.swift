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
        test_andOperate_양의정수_두개()
        //test_nandOperate_양의정수_두개()
        test_orOperate_양의정수_두개()
    }
    
    func test_convertType_11_입력() {
        XCTAssertEqual(try binaryCalculator.convertType(inputNumber: "11"), 3)
    }
    
    func test_convertType_음수_11_입력() {
        XCTAssertEqual(try binaryCalculator.convertType(inputNumber: "-11"), -3)
    }
    
    func test_andOperate_양의정수_두개() {
        XCTAssertEqual(binaryCalculator.andOperate(with: 29, and: 24), 24)
    }
    
//    func test_nandOperate_양의정수_두개() {
//        XCTAssertEqual(binaryCalculator.nandOperate(with: 29, and: 24), 0b111111000)
//    }
//
    func test_orOperate_양의정수_두개() {
        XCTAssertEqual(binaryCalculator.orOperate(with: 29, and: 24), 29)
    }
}
