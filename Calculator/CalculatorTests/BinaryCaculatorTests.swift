//
//  BinaryCalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//

import XCTest

//class BinaryCalculatorTests: XCTestCase {
//    private var binaryCalculatorTest: BinaryCalculator?
//    override func setUpWithError() throws {
//        binaryCalculatorTest = BinaryCalculator()
//    }
//
//    override func tearDownWithError() throws {
//        binaryCalculatorTest = nil
//    }
//
//    func test_add() {
//        let result1 = binaryCalculatorTest?.add(firstNumber: 1010, secondNumber: 11)
//        XCTAssertEqual(result1, 1101)
//
//        // 음수를 더하여 0이 되는 case
//        let result2 = binaryCalculatorTest?.add(firstNumber: 10, secondNumber: 11111110)
//        XCTAssertEqual(result2, 0)
//
//        // 음수를 덧셈할 경우 음수 결과가 8bit 이진수로 표현됨 (MSB가 Sign-Bit)
//        let result3 = binaryCalculatorTest?.add(firstNumber: 10, secondNumber: 11111101)
//        XCTAssertEqual(result3, 11111111)
//
//        // 오버플로우 발생시 오버플로우 된 자릿수 버림
//        let result4 = binaryCalculatorTest?.add(firstNumber: 11110000, secondNumber: 10001000)
//        XCTAssertEqual(result4, 1111000)
//
//        // 오버플로우 발생시
//        let result5 = binaryCalculatorTest?.add(firstNumber: 01110000, secondNumber: 01001000)
//        XCTAssertEqual(result5, 111000)
//    }
//
//    func test_subtract() {
//        let result1 = binaryCalculatorTest?.subtract(firstNumber: 1010, secondNumber: 11)
//        XCTAssertEqual(result1, 111)
//
//        // 음수를 빼서 양수 결과가 나오는 경우
//        let result2 = binaryCalculatorTest?.subtract(firstNumber: 10, secondNumber: 11111110)
//        XCTAssertEqual(result2, 100)
//
//        // 뺄셈의 결과가 음수인 경우
//        let result3 = binaryCalculatorTest?.subtract(firstNumber: 10, secondNumber: 11)
//        XCTAssertEqual(result3, 11111111)
//
//        // 언더플로우 발생시 언더플로우 된 자릿수 버림
//        let result4 = binaryCalculatorTest?.subtract(firstNumber: 10000001, secondNumber: 10)
//        XCTAssertEqual(result4, 1111111)
//    }
//
//    func test_AND() {
//        let result1 = binaryCalculatorTest?.AND(firstNumber: 0, secondNumber: 0)
//        XCTAssertEqual(result1, 0)
//
//        let result2 = binaryCalculatorTest?.AND(firstNumber: 0, secondNumber: 10)
//        XCTAssertEqual(result2, 0)
//
//        let result3 = binaryCalculatorTest?.AND(firstNumber: 10, secondNumber: 0)
//        XCTAssertEqual(result3, 0)
//
//        let result4 = binaryCalculatorTest?.AND(firstNumber: 11, secondNumber: 11111111)
//        XCTAssertEqual(result4, 11)
//    }
//
//    func test_NAND() {
//        let result1 = binaryCalculatorTest?.NAND(firstNumber: 0, secondNumber: 0)
//        XCTAssertEqual(result1, 11111111)
//
//        let result2 = binaryCalculatorTest?.NAND(firstNumber: 0, secondNumber: 10)
//        XCTAssertEqual(result2, 11111111)
//
//        let result3 = binaryCalculatorTest?.NAND(firstNumber: 10, secondNumber: 0)
//        XCTAssertEqual(result3, 11111111)
//
//        let result4 = binaryCalculatorTest?.NAND(firstNumber: 11, secondNumber: 11111111)
//        XCTAssertEqual(result4, 11111100)
//    }
//
//    func test_OR() {
//        let result1 = binaryCalculatorTest?.OR(firstNumber: 0, secondNumber: 0)
//        XCTAssertEqual(result1, 0)
//
//        let result2 = binaryCalculatorTest?.OR(firstNumber: 0, secondNumber: 10)
//        XCTAssertEqual(result2, 10)
//
//        let result3 = binaryCalculatorTest?.OR(firstNumber: 10, secondNumber: 0)
//        XCTAssertEqual(result3, 10)
//
//        let result4 = binaryCalculatorTest?.OR(firstNumber: 11, secondNumber: 11111111)
//        XCTAssertEqual(result4, 11111111)
//    }
//
//    func test_NOR() {
//        let result1 = binaryCalculatorTest?.NOR(firstNumber: 0, secondNumber: 0)
//        XCTAssertEqual(result1, 11111111)
//
//        let result2 = binaryCalculatorTest?.NOR(firstNumber: 0, secondNumber: 10)
//        XCTAssertEqual(result2, 11111101)
//
//        let result3 = binaryCalculatorTest?.NOR(firstNumber: 10, secondNumber: 0)
//        XCTAssertEqual(result3, 11111101)
//
//        let result4 = binaryCalculatorTest?.NOR(firstNumber: 11, secondNumber: 11111111)
//        XCTAssertEqual(result4, 0)
//    }
//
//    func test_XOR() {
//        let result1 = binaryCalculatorTest?.XOR(firstNumber: 0, secondNumber: 0)
//        XCTAssertEqual(result1, 0)
//
//        let result2 = binaryCalculatorTest?.XOR(firstNumber: 0, secondNumber: 10)
//        XCTAssertEqual(result2, 10)
//
//        let result3 = binaryCalculatorTest?.XOR(firstNumber: 10, secondNumber: 0)
//        XCTAssertEqual(result3, 10)
//
//        let result4 = binaryCalculatorTest?.XOR(firstNumber: 11, secondNumber: 11111111)
//        XCTAssertEqual(result4, 11111100)
//    }
//
//    func test_NOT() {
//        let result1 = binaryCalculatorTest?.NOT(firstNumber: 00000001)
//        XCTAssertEqual(result1, 1111111)
//
//        let result2 = binaryCalculatorTest?.NOT(firstNumber: 11001100)
//        XCTAssertEqual(result2, 110011)
//    }
//
//    func test_shiftLeft() {
//        let result1 = binaryCalculatorTest?.shiftLeft(firstNumber: 11, secondNumber: 10)
//        XCTAssertEqual(result1, 1100)
//
//        let result2 = binaryCalculatorTest?.shiftLeft(firstNumber: 10000000, secondNumber: 11)
//        XCTAssertEqual(result2, 0)
//
//        // secondNumber가 음수면 반대 방향으로 shift
//        let result3 = binaryCalculatorTest?.shiftLeft(firstNumber: 1100, secondNumber: 111111110)
//        XCTAssertEqual(result3, 110)
//    }
//
//    func test_shiftRight() {
//        let result1 = binaryCalculatorTest?.shiftRight(firstNumber: 11, secondNumber: 10)
//        XCTAssertEqual(result1, 0)
//
//        let result2 = binaryCalculatorTest?.shiftRight(firstNumber: 10000000, secondNumber: 11)
//        XCTAssertEqual(result2, 10000)
//
//        // secondNumber가 음수면 반대 방향으로 shift
//        let result3 = binaryCalculatorTest?.shiftRight(firstNumber: 1100, secondNumber: 11111110)
//        XCTAssertEqual(result3, 11000)
//    }
//
//    func test_reset() {
//        binaryCalculatorTest?.reset()
//        XCTAssertTrue(binaryCalculatorTest?.stack.isEmpty == true)
//    }
//}
