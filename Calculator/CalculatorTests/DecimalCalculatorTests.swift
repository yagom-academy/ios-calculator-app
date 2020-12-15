//
//  DecimalCalculatorTests.swift
//  CalculatorTests
//
//  Created by Yeon on 2020/12/14.
//

import XCTest
@testable import Calculator

final class DecimalCalculatorTests: XCTestCase {
    private var sut: DecimalCalculator!
    
    override func setUp() {
        sut = DecimalCalculator()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testAdditionIntWithInt() throws {
        //1. given (formual : 13 + 5)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.add()
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "18"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ add function int with int is wrong❗️")
    }
    
    func testAdditionDoubleWithDouble() throws {
        //1. given (formual : 13.5 + 5.3)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        try! sut.add()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("3")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "18.8"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ add function double with double is wrong❗️")
    }
    
    func testAdditionIntWithDouble() throws {
        //1. given (formual : 13 + 5.3)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.add()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("3")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "18.3"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ add function int with double is wrong❗️")
    }
    
    func testSubtractionIntWithInt() throws {
        //1. given (formual : 13 - 5)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.subtract()
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "8"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ subtract function int with int is wrong❗️")
    }
    
    func testSubtractionDoubleWithDouble() throws {
        //1. given (formual : 13.3 - 5.8)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("3")
        try! sut.subtract()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("8")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "7.5"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ subtract function double with double value is wrong❗️")
    }
    
    func testSubtractionIntWithDouble() throws {
        //1. given (formual : 13 - 5.8)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.subtract()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("8")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "7.2"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ subtract function int with double value is wrong❗️")
    }

    
    func testMultiplicationIntWithInt() throws {
        //1. given (formual : 13 * 5)
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.multiply()
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "65"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ multiply function int with int is wrong❗️")
    }
    
    func testMultiplicationDoubleWithDouble() throws {
        //1. given (formual : 2.5 * 5.2)
        try! sut.enterNumber("2")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        try! sut.multiply()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("3")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "13.25"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ multiply function double with double value is wrong❗️")
    }
    
    func testMultiplicationIntWithDouble() throws {
        //1. given (formual : 2 * 5.3)
        try! sut.enterNumber("2")
        try! sut.multiply()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("3")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "10.6"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ multiply function int with double value is wrong❗️")
    }
    
    func testDivisionIntWithInt() throws {
        //1. given (formual : 10 / 5)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.divide()
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "2"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ divide function int with int is wrong❗️")
    }
    
    func testDivisionDoubleWithDouble() throws {
        //1. given (formual : 7.2 / 5.4)
        try! sut.enterNumber("7")
        try! sut.enterNumber(".")
        try! sut.enterNumber("2")
        try! sut.divide()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("4")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "1.333333333"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ divide function double with double is wrong❗️")
    }
    
    func testDivisionIntWithDouble() throws {
        //1. given (formual : 10 / 2.5)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.divide()
        try! sut.enterNumber("2")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "4"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ divide function int with int is wrong❗️")
    }
    
    func testDivisionByZero() throws {
        //1. given (formual : 15 / 0)
        try! sut.enterNumber("1")
        try! sut.enterNumber("5")
        try! sut.divide()
        try! sut.enterNumber("0")

        //2. Assert
        XCTAssertThrowsError(try sut.equal(), "⚠️ divideByZero Error Occured❗️")
    }
    
    func testToggleSign() throws {
        //1. given (formual : -5)
        try! sut.enterNumber("5")
        try! sut.toggleSign()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "-5"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ toggleSign function is wrong❗️")
    }
    
    func testFourRuleCalculationsInt() throws {
        //1. given (formual : 13 + 3 * 5 / 5 )
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.add()
        try! sut.enterNumber("3")
        try! sut.multiply()
        try! sut.enterNumber("5")
        try! sut.divide()
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "16"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ fourRuleCalculation int Wrong❗️")
    }
    
    func testFourRuleCalculationsIntWithToggleSign() throws {
        //1. given (formual : 13 - -3 * 5 / -5 )
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.subtract()
        try! sut.enterNumber("3")
        try! sut.toggleSign()
        try! sut.multiply()
        try! sut.enterNumber("5")
        try! sut.divide()
        try! sut.enterNumber("5")
        try! sut.toggleSign()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "10"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ fourRuleCalculation int with toggleSing Wrong❗️")
    }
    
    func testFourRuleCalculationsDouble() throws {
        //1. given (formual : 13.3 + 3.2 * 5.4 / 2.7 )
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("3")
        try! sut.add()
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("2")
        try! sut.multiply()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("4")
        try! sut.divide()
        try! sut.enterNumber("2")
        try! sut.enterNumber(".")
        try! sut.enterNumber("7")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "19.7"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ fourRuleCalculation double Wrong❗️")
    }
    
    func testFourRuleCalculationsDoubleWithToggleSign() throws {
        //1. given (formual : 13.5 - -3.2 * 5.1 / -1.7 )
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        try! sut.subtract()
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("2")
        try! sut.toggleSign()
        try! sut.multiply()
        try! sut.enterNumber("5")
        try! sut.enterNumber(".")
        try! sut.enterNumber("1")
        try! sut.divide()
        try! sut.enterNumber("1")
        try! sut.enterNumber(".")
        try! sut.enterNumber("7")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "23.1"
        
        //3. then
        XCTAssertEqual(result, "23.1", "⚠️ fourRuleCalculation double with toggleSing Wrong❗️")
    }
    
    func testFourRuleCalculationsIntWithDouble() throws {
        //1. given (formual : 13.5 + 3 * 6 / 1.5 )
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        try! sut.add()
        try! sut.enterNumber("3")
        try! sut.multiply()
        try! sut.enterNumber("6")
        try! sut.divide()
        try! sut.enterNumber("1")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "25.5"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ fourRuleCalculation int with double Wrong❗️")
    }
    
    func testFourRuleCalculationsIntWithDoubleWithToggleSign() throws {
        //1. given (formual : 13.5 + -3 * -6 / -1.5 )
        try! sut.enterNumber("1")
        try! sut.enterNumber("3")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        try! sut.add()
        try! sut.enterNumber("3")
        try! sut.toggleSign()
        try! sut.multiply()
        try! sut.enterNumber("6")
        try! sut.toggleSign()
        try! sut.divide()
        try! sut.enterNumber("1")
        try! sut.enterNumber(".")
        try! sut.enterNumber("5")
        try! sut.toggleSign()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "1.5"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ fourRuleCalculation int with double Wrong❗️")
    }
}
