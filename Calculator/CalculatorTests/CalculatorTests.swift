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
    
    func testSubtract() throws {
        let result = try binaryCalculator.subtract(first: "100001", second: "1111")
        XCTAssertEqual(result, "10010")
    }
    
    func testAnd() throws {
        let result = try binaryCalculator.and(first: "100001", second: "1111")
        XCTAssertEqual(result, "1")
    }
    
    func testOr() throws {
        let result = try binaryCalculator.or(first: "100001", second: "1111")
        XCTAssertEqual(result, "101111")
    }
    
    func testXor() throws {
        let result = try binaryCalculator.xor(first: "100001", second: "1111")
        XCTAssertEqual(result, "101110")
    }
    
    func testNor() throws {
        let result = try binaryCalculator.nor(first: "100001", second: "1111")
        XCTAssertEqual(result, "-110000")
    }
    
    func testNot() throws {
        let result = try binaryCalculator.not(first: "100110")
        XCTAssertEqual(result, "-100111")
    }
    
    func testNand() throws {
        let result = try binaryCalculator.nand(first: "100001", second: "1111")
        XCTAssertEqual(result, "-10")
    }
    
    func testRightShift() throws {
        let result = try binaryCalculator.rightShift(first: "1111")
        XCTAssertEqual(result, "111")
    }
    
    func testLeftShift() throws {
        let result = try binaryCalculator.leftShift(first: "1111")
        XCTAssertEqual(result, "11110")
    }
    
    func testRemoveAll() throws {
        binaryCalculator.clear()
        XCTAssertTrue(binaryCalculator.postfixStack.isEmpty && binaryCalculator.calculateStack.isEmpty)
    }
}
