//
//  BinaryCalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//

import XCTest

class BinaryCalculatorTests: XCTestCase {
    private var binaryCalculatorTest: BinaryCalculator?
    override func setUpWithError() throws {
        binaryCalculatorTest = BinaryCalculator()
    }
    
    override func tearDownWithError() throws {
        binaryCalculatorTest = nil
    }
    
    func test_add() {
        let result1 = try? binaryCalculatorTest?.add(firstNumber: "1010", secondNumber: "11")
        XCTAssertEqual(result1, "1101")
        
        // 음수를 더하여 0이 되는 case
        let result2 = try? binaryCalculatorTest?.add(firstNumber: "10", secondNumber: "11111110")
        XCTAssertEqual(result2, "0")
        
        // 음수를 덧셈할 경우 음수 결과가 8bit 이진수로 표현됨 (MSB가 Sign-Bit)
        let result3 = try? binaryCalculatorTest?.add(firstNumber: "10", secondNumber: "11111101")
        XCTAssertEqual(result3, "11111111")
        
        // 오버플로우 발생시 오버플로우 된 자릿수 버림
        let result4 = try? binaryCalculatorTest?.add(firstNumber: "11110000", secondNumber: "10001000")
        XCTAssertEqual(result4, "1111000")
        
        // 오버플로우 발생시
        let result5 = try? binaryCalculatorTest?.add(firstNumber: "01110000", secondNumber: "01001000")
        XCTAssertEqual(result5, "111000")
    }
    
    func test_subtract() {
        let result1 = try? binaryCalculatorTest?.subtract(firstNumber: "1010", secondNumber: "11")
        XCTAssertEqual(result1, "111")
        
        // 음수를 빼서 양수 결과가 나오는 경우
        let result2 = try? binaryCalculatorTest?.subtract(firstNumber: "10", secondNumber: "11111110")
        XCTAssertEqual(result2, "100")
        
        // 뺄셈의 결과가 음수인 경우
        let result3 = try? binaryCalculatorTest?.subtract(firstNumber: "10", secondNumber: "11")
        XCTAssertEqual(result3, "11111111")
        
        // 언더플로우 발생시 언더플로우 된 자릿수 버림
        let result4 = try? binaryCalculatorTest?.subtract(firstNumber: "10000001", secondNumber: "10")
        XCTAssertEqual(result4, "1111111")
    }
    
    func test_AND() {
        
    }
    
    func test_NAND() {
        
    }
    
    func test_OR() {
        
    }
    
    func test_NOR() {
        
    }
    
    func test_XOR() {
        
    }
    
    func test_NOT() {
        let result1 = try? binaryCalculatorTest?.NOT(firstNumber: "00000001")
        XCTAssertEqual(result1, "11111110")
    }
    
    func test_shiftLeft() {
        
    }
    
    func test_shiftRight() {
        
    }
    
    func test_reset() {
        
    }
}
