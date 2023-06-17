//
//  OperandFormatterTests.swift
//  OperandFormatterTests
//
//  Created by Min Hyun on 2023/06/14.
//

import XCTest
@testable import Calculator

final class OperandFormatterTests: XCTestCase {
    func test_formatStringOperand로_문자열_형태의_소수를_보내면_올바른_형태로_변환합니다() {
        let inputString = "1234.56"
        let inputDouble = 1234.56
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
        numberFormatter.roundingMode = .halfUp
        
        let expectation = numberFormatter.string(for: inputDouble)!
        let result = OperandFormatter.formatStringOperand(inputString)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_formatInput로_쉼표가_포함된_문자열을_보내면_변환을_진행하지_않습니다() {
        let input = "1,234.56"
        let result = OperandFormatter.formatInput(input)

        XCTAssertEqual(result, input)
    }
    
    func test_formatInput로_문자열_형태의_소수를_보내면_올바른_형태로_변환합니다() {
        let input = "1234.56"
        let expectation = "1,234.56"
        let result = OperandFormatter.formatInput(input)

        XCTAssertEqual(result, expectation)
    }
    
    func test_removeComma로_쉼표가_포함된_문자열을_보내면_쉼표를_제거합니다() {
        let input = "1,234.56"
        let result = OperandFormatter.removeComma(input)
        let expectation = "1234.56"
        
        XCTAssertEqual(result, expectation)
    }
}
