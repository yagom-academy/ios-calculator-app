//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kyungmin, EtialMoon on 2023/06/07.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_ExpressionPaser의_parse메서드_매개변수로_짧은수식_String값을_넣어줄때_올바른_Formula인스턴스를_반환하는지_확인() {
        //given
        var folmulaInstance = ExpressionParser.parse(from: "2+3")
        var inputOperands = [Double]()
        var inputOperators = [Operator]()
        while let operandValue = folmulaInstance.operands.dequeue() {
            inputOperands.append(operandValue)
        }
        while let operatorValue = folmulaInstance.operators.dequeue() {
            inputOperators.append(operatorValue)
        }
        //when
        let resultOperands:[Double] = [2, 3]
        let resultOperators:[Operator] = [.add]
        //then
        for (index, operandValue) in inputOperands.enumerated() {
            XCTAssertEqual(operandValue, resultOperands[index])
        }
        for (index, operatorValue) in inputOperators.enumerated() {
            XCTAssertEqual(operatorValue, resultOperators[index])
        }
    }
    
    func test_ExpressionPaser의_parse메서드_매개변수로_긴수식_String값을_넣어줄때_올바른_Formula인스턴스를_반환하는지_확인() {
        //given
        var folmulaInstance = ExpressionParser.parse(from: "2+3−4−6÷3×8")
        var inputOperands = [Double]()
        var inputOperators = [Operator]()
        while let operandValue = folmulaInstance.operands.dequeue() {
            inputOperands.append(operandValue)
        }
        while let operatorValue = folmulaInstance.operators.dequeue() {
            inputOperators.append(operatorValue)
        }
        //when
        let resultOperands:[Double] = [2, 3, 4, 6, 3, 8]
        let resultOperators:[Operator] = [.add, .subtract, .subtract, .divide, .multiply]
        //then
        for (index, operandValue) in inputOperands.enumerated() {
            XCTAssertEqual(operandValue, resultOperands[index])
        }
        for (index, operatorValue) in inputOperators.enumerated() {
            XCTAssertEqual(operatorValue, resultOperators[index])
        }
    }
    
    func test_ExpressionPaser의_parse메서드_매개변수로_오류수식_String값을_넣어줄때_올바른_Formula인스턴스를_반환하는지_확인() {
        //given
        var folmulaInstance = ExpressionParser.parse(from: "2++−−÷×8")
        var inputOperands = [Double]()
        var inputOperators = [Operator]()
        while let operandValue = folmulaInstance.operands.dequeue() {
            inputOperands.append(operandValue)
        }
        while let operatorValue = folmulaInstance.operators.dequeue() {
            inputOperators.append(operatorValue)
        }
        //when
        let resultOperands:[Double] = [2, 8]
        let resultOperators:[Operator] = [.add, .add, .subtract, .subtract, .divide, .multiply]
        //then
        for (index, operandValue) in inputOperands.enumerated() {
            XCTAssertEqual(operandValue, resultOperands[index])
        }
        for (index, operatorValue) in inputOperators.enumerated() {
            XCTAssertEqual(operatorValue, resultOperators[index])
        }
    }
}
