//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 임성민 on 2020/12/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func testAddPositiveInteger() {
        let input = ["1", "+", "10", "+", "100", "+", "1000", "+", "10000"]
        let expectation = "11111.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddNegativaInteger() {
        let input = ["-1", "+", "-10", "+", "-100", "+", "-1000", "+", "-10000"]
        let expectation = "-11111.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignInteger() {
        let input = ["1", "+", "-10", "+", "100", "+", "-1000", "+", "10000"]
        let expectation = "9091.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddPositiveDecimal() {
        let input = ["1.8", "+", "10.3", "+", "100.35", "+", "1000.393", "+", "10000.0343"]
        let expectation = "11112.8773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddNegativeDecimal() {
        let input = ["-1.8", "+", "-10.3", "+", "-100.35", "+", "-1000.393", "+", "-10000.0343"]
        let expectation = "-11112.8773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignDecimal() {
        let input = ["1.8", "+", "-10.3", "+", "100.35", "+", "-1000.393", "+", "10000.0343"]
        let expectation = "9091.4913"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "+", "-10", "+", "100.35", "+", "-1000.393"]
        let expectation = "-909.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignIntegerAndBothSignDecimalAndZero() {
        let input = ["1", "+", "-10", "+", "100.35", "+", "-1000.393" + "0"]
        let expectation = "-909.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }

    func testSubtractPositiveInteger() {
        let input = ["1", "-", "10", "-", "100", "-", "1000", "-", "10000"]
        let expectation = "-11109.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractNegativaInteger() {
        let input = ["-1", "-", "-10", "-", "-100", "-", "-1000", "-", "-10000"]
        let expectation = "11109.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignInteger() {
        let input = ["1", "-", "-10", "-", "100", "-", "-1000", "-", "10000"]
        let expectation = "-9089.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractPositiveDecimal() {
        let input = ["1.8", "-", "10.3", "-", "100.35", "-", "1000.393", "-", "10000.0343"]
        let expectation = "-11109.2773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractNegativeDecimal() {
        let input = ["-1.8", "-", "-10.3", "-", "-100.35", "-", "-1000.393", "-", "-10000.0343"]
        let expectation = "11109.2773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignDecimal() {
        let input = ["1.8", "-", "-10.3", "-", "100.35", "-", "-1000.393", "-", "10000.0343"]
        let expectation = "-9087.8913"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "-", "-10", "-", "100.35", "-", "-1000.393"]
        let expectation = "911.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignIntegerAndBothSignDecimalAndZero() {
        let input = ["1", "-", "-10", "-", "100.35", "-", "-1000.393", "-", "0"]
        let expectation = "911.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyPositiveInteger() {
        let input = ["1", "*", "10", "*", "100", "*", "1000", "*", "10000"]
        let expectation = "10000000000.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyNegativaInteger() {
        let input = ["-1", "*", "-10", "*", "-100", "*", "-1000", "*", "-10000"]
        let expectation = "-10000000000.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignInteger() {
        let input = ["1", "*", "-10", "*", "100", "*", "-1000", "*", "10000"]
        let expectation = "10000000000.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyPositiveDecimal() {
        let input = ["1.8", "*", "10.3", "*", "100.35", "*", "1000.393", "*", "10000.0343"]
        let expectation = "18612265561.621906"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyNegativeDecimal() {
        let input = ["-1.8", "*", "-10.3", "*", "-100.35", "*", "-1000.393", "*", "-10000.0343"]
        let expectation = "-18612265561.621906"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignDecimal() {
        let input = ["1.8", "*", "-10.3", "*", "100.35", "*", "-1000.393", "*", "10000.0343"]
        let expectation = "18612265561.621906"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "*", "-10", "*", "100.35", "*", "-1000.393"]
        let expectation = "1003894.3755"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignIntegerAndBothSignDecimalAndZero() {
        let input = ["1", "*", "-10", "*", "100.35", "*", "-1000.393", "*", "0"]
        let expectation = "0.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDividePositiveInteger() {
        let input = ["1", "/", "10", "/", "100", "/", "1000"]
        let expectation = "1e-06"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideNegativaInteger() {
        let input = ["-1", "/", "-10", "/", "-100", "/", "-1000"]
        let expectation = "1e-06"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignInteger() {
        let input = ["1", "/", "-10", "/", "100", "/", "-1000"]
        let expectation = "1e-06"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDividePositiveDecimal() {
        let input = ["1.8", "/", "10.3", "/", "100.35"]
        let expectation = "0.001741478"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideNegativeDecimal() {
        let input = ["-1.8", "/", "-10.3", "/", "-100.35"]
        let expectation = "-0.001741478"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignDecimal() {
        let input = ["1.8", "/", "-10.3", "/", "100.35"]
        let expectation = "-0.001741478"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "/", "-10", "/", "100.35", "/", "-1000.393"]
//        let expectation = "-0.000001740"
        let expectation = String(format: "%.9f", 1 / -10 / 100.35 / -1000.393)
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignIntegerAndBothSignDecimalAndZero() throws {
        let input = ["1", "/", "-10", "/", "100.35", "/", "-1000.393", "/", "0"]
        
        XCTAssertThrowsError(try DecimalCalculator.shared.calculate(input), "divideByZero")
    }
    
    func testDecimalOperatorPrecedence() {
        let input = ["1", "+", "2", "*", "4", "/", "8", "-", "1"]
        let expectation = "1.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBinaryPositiveInteger() {
        let input = ["1", "+", "10", "+", "100", "+", "1111"]
        let expectation = "10110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBinaryNegativeInteger() {
        let input = ["-1", "+", "-10", "+", "-100", "+", "-1111"]
        let expectation = "-10110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBinaryBothSignInteger() {
        let input = ["-1", "+", "10", "+", "-100", "+", "1111"]
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBinaryPositiveInteger() {
        let input = ["1", "-", "10", "-", "100", "-", "1111"]
        let expectation = "-10100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBinaryNegativeInteger() {
        let input = ["-1", "-", "-10", "-", "-100", "-", "-1111"]
        let expectation = "10100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBinaryBothSignInteger() {
        let input = ["-1", "-", "10", "-", "-100", "-", "1111"]
        let expectation = "-1110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAndBinaryPositiveInteger() {
        let input = ["1", "AND", "11", "AND", "111", "AND", "1111"]
        let expectation = "1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAndBinaryNegativeInteger() {
        let input = ["-1", "AND", "-11", "AND", "-111", "AND", "-1111"]
        let expectation = "-1111"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAndBinaryBothSignInteger() {
        let input = ["-1", "AND", "11", "AND", "-111", "AND", "1111"]
        let expectation = "1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNAndBinaryPositiveInteger() {
        let input = ["1", "NAND", "11", "NAND", "111", "NAND", "1111"]
        let expectation = "-1010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }

    func testNAndBinaryNegativeInteger() {
        let input = ["-1", "NAND", "-11", "NAND", "-111", "NAND", "-1111"]
        let expectation = "1110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }

    func testNAndBinaryBothSignInteger() {
        let input = ["-1", "NAND", "11", "NAND", "-111", "NAND", "1111"]
        let expectation = "-1000"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testORBinaryPositiveInteger() {
        let input = ["1", "OR", "10", "OR", "101", "OR", "1010"]
        let expectation = "1111"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testORBinaryNagativeInteger() {
        let input = ["-1", "OR", "-10", "OR", "-101", "OR", "-1010"]
        let expectation = "-1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testORBinaryBothSignInteger() {
        let input = ["-1", "OR", "10", "OR", "-101", "OR", "1010"]
        let expectation = "-1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNORBinaryPositiveInteger() {
        let input = ["1", "NOR", "10", "NOR", "101", "NOR", "1010"]
        let expectation = "-1011"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNORBinaryNagativeInteger() {
        let input = ["-1", "NOR", "-10", "NOR", "-101", "NOR", "-1010"]
        let expectation = "1001"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNORBinaryBothSignInteger() {
        let input = ["-1", "NOR", "10", "NOR", "-101", "NOR", "1010"]
        let expectation = "-1111"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testXORBinaryPositiveInteger() {
        let input = ["1", "XOR", "10", "XOR", "101", "XOR", "1010"]
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testXORBinaryNagativeInteger() {
        let input = ["-1", "XOR", "-10", "XOR", "-101", "XOR", "-1010"]
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testXORBinaryBothSignInteger() {
        let input = ["-1", "XOR", "10", "XOR", "-101", "XOR", "1010"]
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testLeftShiftBinaryPositiveInteger() {
        let input = ["10001", "<<"]
        let expectation = "100010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testLeftShiftBinaryNegativeInteger() {
        let input = ["-10001", "<<"]
        let expectation = "-100010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testRightShiftBinaryPositiveInteger() {
        let input = ["10001", ">>"]
        let expectation = "1000"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testRightShiftBinaryNegativeInteger() {
        let input = ["-10001", ">>"]
        let expectation = "-1001"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNotBinaryPositiveInteger() {
        let input = ["10001", "NOT"]
        let expectation = "-10010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNotBinaryNegativeInteger() {
        let input = ["-10001", "NOT"]
        let expectation = "10000"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceOneTwo() {
        let input = ["101", ">>", "AND", "10", "<<", "NAND", "1001", "NOT"]
        let expectation = "-1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceOneThree() {
        let input = ["101", ">>", "+", "10", "<<", "OR", "1001", "NOT", "-", "1"]
        let expectation = "-1011"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceTwoThree() {
        let input = ["101", "+", "10", "AND", "1001", "-", "1"]
        let expectation = "100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceOneTwoThree() {
        let input = ["101", "<<", "+", "10", "AND", "101", ">>", "-", "1"]
        let expectation = "1011"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
}
