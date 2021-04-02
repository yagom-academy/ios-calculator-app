//
//  BinaryCalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//

import XCTest

class BinaryCalculatorTests: XCTestCase {
    private var sut: BinaryCalculator?
    
    override func setUpWithError() throws {
        sut = BinaryCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_add() {
        let positiveResult = sut?.add(firstNumber: 1, secondNumber: 2)
        XCTAssertEqual(positiveResult, 3)
        
        let negativeResult = sut?.add(firstNumber: 1, secondNumber: -2)
        XCTAssertEqual(negativeResult, -1)
    }

    func test_subtract() {
        let positiveResult = sut?.subtract(firstNumber: 100, secondNumber: 12)
        XCTAssertEqual(positiveResult, 88)
        
        let negativeResult = sut?.subtract(firstNumber: 1, secondNumber: 2)
        XCTAssertEqual(negativeResult, -1)
    }

    func test_AND() {
        let zeroResult = sut?.AND(firstNumber: 8, secondNumber: 7)
        XCTAssertEqual(zeroResult, 0)

        let positiveResult = sut?.AND(firstNumber: 8, secondNumber: 9)
        XCTAssertEqual(positiveResult, 8)
    }

    func test_NAND() {
        let nandWithIntMax = sut?.NAND(firstNumber: 8, secondNumber: Int.max)
        XCTAssertEqual(nandWithIntMax, -9)
    }

    func test_OR() {
        let positiveResult = sut?.OR(firstNumber: 8, secondNumber: 7)
        XCTAssertEqual(positiveResult, 15)
        
        let negativeResult = sut?.OR(firstNumber: -2, secondNumber: 11)
        XCTAssertEqual(negativeResult, -1)
    }

    func test_NOR() {
        let positiveResult = sut?.NOR(firstNumber: -8, secondNumber: -7)
        XCTAssertEqual(positiveResult, 6)
        
        let negativeResult = sut?.NOR(firstNumber: 0, secondNumber: 11)
        XCTAssertEqual(negativeResult, -12)
    }

    func test_XOR() {
        let XORWithPositiveNumbers = sut?.XOR(firstNumber: 8, secondNumber: 7)
        XCTAssertEqual(XORWithPositiveNumbers, 15)
        
        let XORWithZero = sut?.XOR(firstNumber: 0, secondNumber: 130)
        XCTAssertEqual(XORWithZero, 130)
        
        let XORWithNegativeNumbers = sut?.XOR(firstNumber: -8, secondNumber: -7)
        XCTAssertEqual(XORWithNegativeNumbers, 1)
    }

    func test_NOT() {
        let zeroResult = sut?.NOT(firstNumber: -1)
        XCTAssertEqual(zeroResult, 0)
        
        let negativeResult = sut?.NOT(firstNumber: 8)
        XCTAssertEqual(negativeResult, -9)
    }

    func test_shiftLeft() {
        let positiveResult = sut?.shiftLeft(firstNumber: 8, secondNumber: 2)
        XCTAssertEqual(positiveResult, 32)
        
        let shiftZero = sut?.shiftLeft(firstNumber: 0, secondNumber: 2)
        XCTAssertEqual(shiftZero, 0)
        
        // 부호를 유지한 채로 bit shift 진행 (shift logically)
        let shiftNegativeNumber = sut?.shiftLeft(firstNumber: -8, secondNumber: 2)
        XCTAssertEqual(shiftNegativeNumber, -32)
    }

    func test_shiftRight() {
        let positiveResult = sut?.shiftRight(firstNumber: 8, secondNumber: 2)
        XCTAssertEqual(positiveResult, 2)
        
        let shiftZero = sut?.shiftRight(firstNumber: 0, secondNumber: 2)
        XCTAssertEqual(shiftZero, 0)
        
        // 부호를 유지한 채로 bit shift 진행 (shift logically)
        let shiftNegativeNumber = sut?.shiftRight(firstNumber: -8, secondNumber: 2)
        XCTAssertEqual(shiftNegativeNumber, -2)
    }
    
    func test_formatInput() {
        let positiveInput = try? sut?.formatInput("1010")
        XCTAssertEqual(positiveInput, 10)
    }
    
    func test_formatResult() {
        let negativeResult = try? sut?.formatResult(of: -1)
        XCTAssertEqual(negativeResult, "11111111")
        
        // MSB(8개의 비트 중 가장 왼쪽의 비트)를 Sign-Bit로 사용
        let minimumResult = try? sut?.formatResult(of: -128)
        XCTAssertEqual(minimumResult, "10000000")

        let positiveResult = try? sut?.formatResult(of: 18)
        XCTAssertEqual(positiveResult, "10010")
        
        // 양수의 최대 표현범위는 127까지이므로 그 이상의 입력이 들어오면 error를 throw
        XCTAssertThrowsError(try sut?.formatResult(of: 1023)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.outOfRangeInput)
        }
    }

    func test_reset() {
        sut?.reset()
        XCTAssertTrue(sut?.stack.isEmpty == true)
    }
}
