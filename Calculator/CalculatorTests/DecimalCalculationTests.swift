//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 황인우 on 2021/04/02.
//

import XCTest
@testable import Calculator

class DecimalCalculationTests: XCTestCase {
    private var sut_inputDataValidator: InputDataValidator!
    private var sut_calculator: Calculator!
    
    override func setUpWithError() throws {
        sut_inputDataValidator = InputDataValidator()
        sut_calculator = Calculator(binaryCalculation: BinaryCalculation(), decimalCalculation: DecimalCalculation())

        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut_inputDataValidator = nil
        sut_calculator = nil
    }
    
    // MARK: Decimal Calculation Test
    
    func test_decimalNumbers_convert_to_postNotation() {
        sut_inputDataValidator.data.medianNotation = ["24.1324521","+", "1323.23124", "*", "2", "-", "63"]
        sut_calculator.convertToPostfixNotation(&sut_inputDataValidator.data)
        XCTAssertEqual(sut_inputDataValidator.data.postfixNotation, ["24.1324521", "1323.23124", "2", "*", "+", "63", "-"])
    }
    
    func test_decimalCalculation_addition_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "+"]
        XCTAssertEqual(sut_calculator.executeDecimalCalculation(sut_inputDataValidator.data), .success("3,576.46557"))
    }
    
    func test_decimalCalculation_subtraction_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "-"]
        XCTAssertEqual(sut_calculator.executeDecimalCalculation(sut_inputDataValidator.data), .success("-1,107.99679"))
    }
    
    func test_decimalCalculation_division_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "/"]
        XCTAssertEqual(sut_calculator.executeDecimalCalculation(sut_inputDataValidator.data), .success("0.52694815"))
    }
    
    func test_decimalCalculation_multiplication_calculation_Test() {
        sut_inputDataValidator.data.postfixNotation = ["1234.23439", "2342.23118", "*"]
        XCTAssertEqual(sut_calculator.executeDecimalCalculation(sut_inputDataValidator.data), .success("2,890,862.27"))
    }
    
    func test_opratorPrecedence_calculation() {
        sut_inputDataValidator.data.postfixNotation = ["24.1324521", "1323.23124", "2", "*", "+", "63", "-"]
        XCTAssertEqual(sut_calculator.executeDecimalCalculation(sut_inputDataValidator.data), .success("2,607.59493"))
    }
}
