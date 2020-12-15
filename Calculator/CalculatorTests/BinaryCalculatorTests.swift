//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Yeon on 2020/12/14.
//

import XCTest
@testable import Calculator

final class BinaryCalculatorTests: XCTestCase {
    private var sut: BianryCalculator!
    
    override func setUp() {
        sut = BianryCalculator()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddition() throws {
        //1. given (formula : 1010 + 10)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.add()
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "1100"
        
        //3. then
        XCTAssertEqual(result, expectedValue, " ⚠️ add function is wrong❗️")
    }
    
    func testAdditionWithToggleSign() throws {
        //1. given (formula : 1010 + -10)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.add()
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.toggleSign()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "1000"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ add function with toggleSign is wrong❗️")
    }
    
    func testSubtraction() throws {
        //1. given (formula : 100001 - 1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.subtract()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "10010"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ subtract function is wrong❗️")
    }
    
    func testSubtractionWithToggleSign() throws {
        //1. given (formula : 100001 - -1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.subtract()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "110000"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ subtract function with toggleSign is wrong❗️")
    }
    
    func testAnd() throws {
        //1. given (formula : 1010 & 1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.and()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")

        //2. when
        let result = try! sut.equal()
        let expectedValue = "1010"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ and function is wrong❗️")
    }
    
    func testAndWithToggleSign() throws {
        //1. given (formula : 1010 & -1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.and()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "0"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ and function with toggleSign is wrong❗️")
    }
    
    func testOr() throws {
        //1. given (formula : 1010 | 1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.or()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")

        //2. when
        let result = try! sut.equal()
        let expectedValue = "1111"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ or function is wrong❗️")
    }
    
    func testOrWithToggleSign() throws {
        //1. given (formula : 1010 | -1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.or()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-101"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ or function with toggleSign is wrong❗️")
    }
    
    func testXor() throws {
        //1. given (formula : 1010 ^ 1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.xor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")

        //2. when
        let result = try! sut.equal()
        let expectedValue = "101"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ xor function is wrong❗️")
    }
    
    func testXorWithToggleSign() throws {
        //1. given (formula : 1010 ^ -1111)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.xor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-101"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ xor function with toggleSign is wrong❗️")
    }
    
    func testNor() throws {
        //1. given (formula : ~(1010 | 1111) )
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.nor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-10000"

        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ nor function is wrong❗️")
    }
    
    func testNorWithToggleSign() throws {
        //1. given (formula : ~(1010 | -1111) )
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.nor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "100"

        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ nor function with toggleSign is wrong❗️")
    }
    
    func testNand() throws {
        //1. given (formula : ~(1010 & 1111) )
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.nand()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-1011"

        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ nand function is wrong❗️")
    }
    
    func testNandWithToggleSign() throws {
        //1. given (formula : ~(1010 & -1111) )
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.nand()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-1"

        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ nand function with toggleSign is wrong❗️")
    }

    func testNot() throws {
        //1. given (formula : ~1010)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.not()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-1011"

        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ not function is wrong❗️")
    }
    
    func testNotWithToggleSign() throws {
        //1. given (formula : ~(-1010))
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.toggleSign()
        try! sut.not()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "1001"

        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ not function with toggleSign is wrong❗️")
    }
    
    func testRightShift() throws {
        //1. given (formula : 1010 >> 1)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.rightShift()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "101"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ rightShift function is wrong❗️")
    }
    
    func testRightShiftWithToggleSign() throws {
        //1. given (formula : -1010 >> 1)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.toggleSign()
        try! sut.rightShift()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-101"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ rightShift function with togglSign is wrong❗️")
    }
    
    func testLeftShift() throws {
        //1. given (formula : 1010 << 1)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.leftShift()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "10100"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ leftShift function is wrong❗️")
    }
    
    func testLeftShiftWithToggleSign() throws {
        //1. given (formula : -1010 << 1)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.toggleSign()
        try! sut.leftShift()

        //2. when
        let result = try! sut.equal()
        let expectedValue = "-10100"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ leftShift function with toggleSign is wrong❗️")
    }
    
    func testBinaryCalculator() throws {
        //1. given (formula : 1000 & 1001 + 11111 ~| 1101 ^ 111 <<)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.and()
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.add()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.nor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.xor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.leftShift()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "-100010"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ binaryCalculator is wrong❗️")
    }
    
    func testBinaryCalculatorWithToggleSign() throws {
        //1. given (formula : 1000 & -1001 + 11111 ~| 1101 ^ -111 >>)
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.and()
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.toggleSign()
        try! sut.add()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.nor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("0")
        try! sut.enterNumber("1")
        try! sut.xor()
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.enterNumber("1")
        try! sut.toggleSign()
        try! sut.rightShift()
        
        //2. when
        let result = try! sut.equal()
        let expectedValue = "11100"
        
        //3. then
        XCTAssertEqual(result, expectedValue, "⚠️ binaryCalculator with toggleSign is wrong❗️")
    }
    
}
