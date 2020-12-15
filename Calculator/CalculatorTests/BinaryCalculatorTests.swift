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
        
        //3. then
        XCTAssertEqual(result, "1100", " ⚠️ add function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "1000", "⚠️ add function with toggleSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "10010", "⚠️ subtract function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "110000", "⚠️ subtract function with toggleSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "1010", "⚠️ and function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "0", "⚠️ and function with toggleSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "1111", "⚠️ or function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "-101", "⚠️ or function with toggleSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "101", "⚠️ xor function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "-101", "⚠️ xor function with toggleSign is wrong❗️")
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

        //3. then
        XCTAssertEqual(result, "-10000", "⚠️ nor function is wrong❗️")
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

        //3. then
        XCTAssertEqual(result, "100", "⚠️ nor function with toggleSign is wrong❗️")
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

        //3. then
        XCTAssertEqual(result, "-1011", "⚠️ nand function is wrong❗️")
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

        //3. then
        XCTAssertEqual(result, "-1", "⚠️ nand function with toggleSign is wrong❗️")
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

        //3. then
        XCTAssertEqual(result, "-1011", "⚠️ not function is wrong❗️")
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

        //3. then
        XCTAssertEqual(result, "1001", "⚠️ not function with toggleSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "101", "⚠️ rightShift function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "-101", "⚠️ rightShift function with togglSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "10100", "⚠️ leftShift function is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "-10100", "⚠️ leftShift function with toggleSign is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "-100010", "⚠️ binaryCalculator is wrong❗️")
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
        
        //3. then
        XCTAssertEqual(result, "11100", "⚠️ binaryCalculator with toggleSign is wrong❗️")
    }
    
}
