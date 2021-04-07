//
//  TestClasses.swift
//  CalculatorTests
//
//  Created by 김민성 on 2021/04/07.
//

import XCTest
@testable import Calculator

class BinaryCalculationTests: XCTestCase {
    private var sut_calculator: Calculator!
    private var sut_binaryCalcualtion: BinaryCalculation!
    private var sut_inputDataValidator: InputDataValidator!
    
    override func setUpWithError() throws {
        sut_calculator = Calculator()
        sut_binaryCalcualtion = BinaryCalculation()
        sut_inputDataValidator = InputDataValidator()
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut_calculator = nil
        sut_binaryCalcualtion = nil
    }
    
    // MARK: Binary Calculation Test
    
    func test_binaryNumbers_convert_to_postNotation() {
        sut_inputDataValidator.data.medianNotation = ["~", "0101","+", "1111"]
        sut_calculator.convertToPostfixNotation(&sut_inputDataValidator.data)
        XCTAssertEqual(sut_inputDataValidator.data.postfixNotation, ["0101", "~", "1111", "+"])
    }
    
    func test_binaryCalculation_addition() {
        sut_inputDataValidator.data.postfixNotation = ["0101", "~", "1111", "+"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000001001"))
    }
    
    func test_binaryCalculation_subtraction() {
        sut_inputDataValidator.data.postfixNotation = ["0101", "~", "1111", "-"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000000000"))
    }
    
    func test_binaryCalculation_overflowTest() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10", "+"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("100000001"))
    }
    
    func test_binaryCalculation_underflowTest() {
        sut_inputDataValidator.data.postfixNotation = ["00000000", "10", "-"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000000000"))
    }
    
    func test_binaryCalculation_AND_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "&"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("010001000"))
    }
    
    func test_binaryCalculation_NAND_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "~&"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000000000"))
    }
    
    func test_binaryCalculation_OR_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "|"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("011111111"))
    }
    
    func test_binaryCalculation_NOR_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "~|"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000000000"))
    }
    
    func test_binaryCalculation_XOR_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "^"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("001110111"))
    }
    
    func test_binaryCalculation_NOT_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1010", "~"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000000000"))
    }
    
    func test_binaryCalculation_right_Shift_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "00000011", ">>"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000011111"))
    }
    
    func test_binaryCalculation_left_Shift_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["00000111", "00000010", "<<"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator.data), .success("000011100"))
    }
    
}
