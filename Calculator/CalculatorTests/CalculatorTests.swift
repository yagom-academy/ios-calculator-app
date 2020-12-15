//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Wonhee on 2020/12/14.
//

import XCTest
@testable import Calculator

final class BinaryCalculatorTests: XCTestCase {

    private var binaryCalculator: BinaryCalculator!
    
    override func setUp() {
        binaryCalculator = BinaryCalculator()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        binaryCalculator = nil
    }
    
    func testAdd() throws {
        let result = try binaryCalculator.add(first: "1111", second: "100001")
        XCTAssertEqual(result, "110000")
    }
    func testAddWithNegative() throws {
        let result = try binaryCalculator.add(first: "11111", second: "-1111")
        XCTAssertEqual(result, "10000")
    }
    
    func testSubtract() throws {
        let result = try binaryCalculator.subtract(first: "100001", second: "1111")
        XCTAssertEqual(result, "10010")
    }
    func testSubtractWithNegative() throws {
        let result = try binaryCalculator.subtract(first: "11111", second: "-10000")
        XCTAssertEqual(result, "101111")
    }
    
    func testAnd() throws {
        let result = try binaryCalculator.and(first: "100001", second: "1111")
        XCTAssertEqual(result, "1")
    }
    func testAndWithNegative() throws {
        let result = try binaryCalculator.and(first: "1000", second: "-1000")
        XCTAssertEqual(result, "1000")
    }
    
    func testOr() throws {
        let result = try binaryCalculator.or(first: "100001", second: "1111")
        XCTAssertEqual(result, "101111")
    }
    func testOrWithNegative() throws {
        let result = try binaryCalculator.or(first: "1000", second: "-1000")
        XCTAssertEqual(result, "-1000")
    }
    
    func testXor() throws {
        let result = try binaryCalculator.xor(first: "100001", second: "1111")
        XCTAssertEqual(result, "101110")
    }
    func testXorWithNegative() throws {
        let result = try binaryCalculator.xor(first: "1000", second: "-1000")
        XCTAssertEqual(result, "-10000")
    }
    
    func testNor() throws {
        let result = try binaryCalculator.nor(first: "100001", second: "1111")
        XCTAssertEqual(result, "-110000")
    }
    func testNorWithNegative() throws {
        let result = try binaryCalculator.nor(first: "1000", second: "-1000")
        XCTAssertEqual(result, "111")
    }
    
    func testNot() throws {
        let result = try binaryCalculator.not(first: "100110")
        XCTAssertEqual(result, "-100111")
    }
    func testNotWithNegative() throws {
        let result = try binaryCalculator.not(first: "-100110")
        XCTAssertEqual(result, "100101")
    }
    
    func testNand() throws {
        let result = try binaryCalculator.nand(first: "100001", second: "1111")
        XCTAssertEqual(result, "-10")
    }
    func testNandWithNegative() throws {
        let result = try binaryCalculator.nand(first: "1000", second: "-1000")
        XCTAssertEqual(result, "-1001")
    }
    
    func testRightShift() throws {
        let result = try binaryCalculator.rightShift(first: "1111")
        XCTAssertEqual(result, "111")
    }
    func testRightShiftWithNegative() throws {
        let result = try binaryCalculator.rightShift(first: "-1000")
        XCTAssertEqual(result, "-100")
    }
    
    func testLeftShift() throws {
        let result = try binaryCalculator.leftShift(first: "1111")
        XCTAssertEqual(result, "11110")
    }
    func testLeftShiftWithNegative() throws {
        let result = try binaryCalculator.leftShift(first: "-1000")
        XCTAssertEqual(result, "-10000")
    }
    
    func testCalculate() throws {
        let result = try binaryCalculator.calculate(["1000", "&", "1001", "+", "11111", "~|", "1101", "^", "111", "<<"])
        XCTAssertEqual(result, "-100010")
    }
    
    func testRemoveAll() throws {
        binaryCalculator.clear()
        XCTAssertTrue(binaryCalculator.postfixStack.isEmpty && binaryCalculator.calculateStack.isEmpty)
    }
}
