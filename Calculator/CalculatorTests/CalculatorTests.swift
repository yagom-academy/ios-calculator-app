//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 황인우 on 2021/04/02.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var sut_inputDataValidator: InputDataValidator!
    private var sut_calculator: Calculator!
    private var sut_decimalCalculation: DecimalCalculation!
    private var sut_binaryCalcualtion: BinaryCalculation!
    
    override func setUpWithError() throws {
        sut_inputDataValidator = InputDataValidator()
        sut_calculator = Calculator()
        sut_decimalCalculation = DecimalCalculation()
        sut_binaryCalcualtion = BinaryCalculation()
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut_inputDataValidator = nil
        sut_calculator = nil
        sut_binaryCalcualtion = nil
        sut_decimalCalculation = nil
    }
    
    // MARK: Binary Calculation Test
    
    func test_elements_of_medianNotation() throws {
        sut_inputDataValidator.validateData(input: "0")
        sut_inputDataValidator.validateData(input: "1")
        sut_inputDataValidator.validateData(input: "0")
        sut_inputDataValidator.validateData(input: "1")
        sut_inputDataValidator.validateData(input: "+")
        sut_inputDataValidator.validateData(input: "1")
        sut_inputDataValidator.validateData(input: "1")
        sut_inputDataValidator.validateData(input: "1")
        sut_inputDataValidator.validateData(input: "1")
        XCTAssertEqual(sut_inputDataValidator.data.medianNotation, ["0101","+", "1111"])

    }
    
    func test_binaryNumbers_convert_to_postNotation() {
        sut_inputDataValidator.data.medianNotation = ["~", "0101","+", "1111"]
        sut_calculator.convertToPostfixNotation(sut_inputDataValidator)
        XCTAssertEqual(sut_inputDataValidator.data.postfixNotation, ["0101", "~", "1111", "+"])
    }
    
    func test_binaryCalculation_addition() {
        sut_inputDataValidator.data.postfixNotation = ["0101", "~", "1111", "+"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000001001"))
    }
    
    func test_binaryCalculation_subtraction() {
        sut_inputDataValidator.data.postfixNotation = ["0101", "~", "1111", "-"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000000000"))
    }
    
    func test_binaryCalculation_overflowTest() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10", "+"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("100000001"))
    }
    
    func test_binaryCalculation_underflowTest() {
        sut_inputDataValidator.data.postfixNotation = ["00000000", "10", "-"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000000000"))
    }
    
    func test_binaryCalculation_AND_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "&"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("010001000"))
    }
    
    func test_binaryCalculation_NAND_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "~&"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000000000"))
    }
    
    func test_binaryCalculation_OR_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "|"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("011111111"))
    }
    
    func test_binaryCalculation_NOR_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "~|"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000000000"))
    }
    
    func test_binaryCalculation_XOR_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "10001000", "^"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("001110111"))
    }
    
    func test_binaryCalculation_NOT_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1010", "~"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000000000"))
    }
    
    func test_binaryCalculation_right_Shift_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["11111111", "00000011", ">>"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000011111"))
    }
    
    func test_binaryCalculation_left_Shift_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["00000111", "00000010", "<<"]
        XCTAssertEqual(sut_binaryCalcualtion.calculatePostfixNotation(sut_inputDataValidator), .success("000011100"))
    }
    
    // MARK: Decimal Calculation Test
    
    func test_decimalNumbers_convert_to_postNotation() {
        sut_inputDataValidator.data.medianNotation = ["24.1324521","+", "1323.23124", "*", "2", "-", "63"]
        sut_calculator.convertToPostfixNotation(sut_inputDataValidator)
        XCTAssertEqual(sut_inputDataValidator.data.postfixNotation, ["24.1324521", "1323.23124", "2", "*", "+", "63", "-"])
    }
    
    func test_decimalCalculation_addition_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "+"]
        XCTAssertEqual(sut_decimalCalculation.calculatePostfixNotation(sut_inputDataValidator), .success("3,576.46557"))
    }
    
    func test_decimalCalculation_subtraction_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "-"]
        XCTAssertEqual(sut_decimalCalculation.calculatePostfixNotation(sut_inputDataValidator), .success("-1,107.99679"))
    }
    
    func test_decimalCalculation_division_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "/"]
        XCTAssertEqual(sut_decimalCalculation.calculatePostfixNotation(sut_inputDataValidator), .success("0.52694815"))
    }
    
    func test_decimalCalculation_multiplication_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "*"]
        XCTAssertEqual(sut_decimalCalculation.calculatePostfixNotation(sut_inputDataValidator), .success("2,890,862.27"))
    }
    
    func test_opratorPrecedence_calculation() {
        sut_inputDataValidator.data.postfixNotation = ["24.1324521", "1323.23124", "2", "*", "+", "63", "-"]
        XCTAssertEqual(sut_decimalCalculation.calculatePostfixNotation(sut_inputDataValidator), .success("2,607.59493"))
    }
}
