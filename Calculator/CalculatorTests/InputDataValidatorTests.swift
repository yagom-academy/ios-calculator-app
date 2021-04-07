//
//  InputDataValidatorTests.swift
//  CalculatorTests
//
//  Created by 황인우 on 2021/04/07.
//

import Foundation
import XCTest
@testable import Calculator

class InputDataValidatorTests: XCTestCase {
    private var sut_inputDataValidator: InputDataValidator!
    
    override func setUpWithError() throws {
        sut_inputDataValidator = InputDataValidator()
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        sut_inputDataValidator = nil
    }
    
    func test_elements_of_medianNotation() throws {
        ["0", "1", "0", "1", "+", "1", "1", "1", "1" ].forEach { sut_inputDataValidator.validate(input: $0) }
        XCTAssertEqual(sut_inputDataValidator.data.medianNotation, ["0101","+", "1111"])
        }
}
