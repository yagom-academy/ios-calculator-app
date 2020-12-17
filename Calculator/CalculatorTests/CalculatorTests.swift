//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 임성민 on 2020/12/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func testGetPostFixFormulaOfDecimalCalculator() {
        let input = ["1", "+", "10"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.getPostFixFormula(input), "Calculation Error")
        
        let expectations = [DecimalData(value: "1", type: nil), DecimalData(value: "10", type: nil), DecimalData(value: "+", type: DecimalOperatorType.add)]
        let results = (try! DecimalCalculator.shared.getPostFixFormula(input))
        
        for (i, expectaion) in expectations.enumerated() {
            let expectedValue = expectaion.value
            let resultValue = results[i].value
            let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectedValue) \n Result: \(resultValue)"
            
            XCTAssertEqual(expectedValue, resultValue, errorMessage)
        }
    }
    
    func testGetPostFixFormulaOfBinaryCalculator() {
        let input = ["1", "+", "10"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.getPostFixFormula(input), "Calculation Error")
        
        let expectations = [BinaryData(value: "1", type: nil), BinaryData(value: "10", type: nil), BinaryData(value: "+", type: BinaryOperatorType.add)]
        let results = (try! BinaryCalculator.shared.getPostFixFormula(input))
        
        for (i, expectaion) in expectations.enumerated() {
            let expectedValue = expectaion.value
            let resultValue = results[i].value
            let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectedValue) \n Result: \(resultValue)"
            
            XCTAssertEqual(expectedValue, resultValue, errorMessage)
        }
    }
    
    func testPutFormulaOfDecimalCalculator() {
        let input = ["1", "+", "10"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.putFormula(input), "Calculation Error")
        
        let expectations = [DecimalData(value: "1", type: nil), DecimalData(value: "10", type: nil), DecimalData(value: "+", type: DecimalOperatorType.add)]
        let results = (try! DecimalCalculator.shared.putFormula(input))
        
        for (i, expectaion) in expectations.enumerated() {
            let expectedValue = expectaion.value
            let resultValue = results[i].value
            let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectedValue) \n Result: \(resultValue)"
            
            XCTAssertEqual(expectedValue, resultValue, errorMessage)
        }
    }
    
    func testPutFormulaOfBinaryCalculator() {
        let input = ["1", "+", "10"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.putFormula(input), "Calculation Error")
        
        let expectations = [BinaryData(value: "1", type: nil), BinaryData(value: "10", type: nil), BinaryData(value: "+", type: BinaryOperatorType.add)]
        let results = (try! BinaryCalculator.shared.putFormula(input))
        
        for (i, expectaion) in expectations.enumerated() {
            let expectedValue = expectaion.value
            let resultValue = results[i].value
            let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectedValue) \n Result: \(resultValue)"
            
            XCTAssertEqual(expectedValue, resultValue, errorMessage)
        }
    }
    
    func testCalculationRelatedToShiftOfLeftShift() {
        let input = BinaryData(value: "1010", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToShift(operatorType: .leftShift, item: input), "Calculation Error")
        
        let expectation = BinaryData(value: "10100", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToShift(operatorType: .leftShift, item: input)
        let errorMessage = "\n ** Test Fail ** \n Input: \(input.value) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToShiftOfRightShift() {
        let input = BinaryData(value: "1010", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToShift(operatorType: .rightShift, item: input), "Calculation Error")
        
        let expectation = BinaryData(value: "101", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToShift(operatorType: .rightShift, item: input)
        let errorMessage = "\n ** Test Fail ** \n Input: \(input.value) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToShiftOfNot() {
        let input = BinaryData(value: "101", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToShift(operatorType: .not, item: input), "Calculation Error")
        
        let expectation = BinaryData(value: "-110", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToShift(operatorType: .not, item: input)
        let errorMessage = "\n ** Test Fail ** \n Input: \(input.value) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfAdd() {
        let operatorType = BinaryOperatorType.add
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "1100", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfSubtract() {
        let operatorType = BinaryOperatorType.subtract
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "-10", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfAnd() {
        let operatorType = BinaryOperatorType.and
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "101", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfNand() {
        let operatorType = BinaryOperatorType.nand
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "-110", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfOr() {
        let operatorType = BinaryOperatorType.or
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "111", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfNor() {
        let operatorType = BinaryOperatorType.nor
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "-1000", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testCalculationRelatedToLogicGateOfXor() {
        let operatorType = BinaryOperatorType.xor
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "10", type: nil)
        let result = try! BinaryCalculator.shared.calculationRelatedToLogicGate(operatorType: operatorType, firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(operatorType), \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result?.value)"
        
        XCTAssertEqual(expectation.value, result?.value, errorMessage)
    }
    
    func testAddOfBinaryCalculator() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.add(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "1100", type: nil)
        let result = try! BinaryCalculator.shared.add(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testSubtractOfBinaryCalculator() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.subtract(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "-10", type: nil)
        let result = try! BinaryCalculator.shared.subtract(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testAnd() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.and(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "101", type: nil)
        let result = try! BinaryCalculator.shared.and(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testNand() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.nand(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "-110", type: nil)
        let result = try! BinaryCalculator.shared.nand(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testOr() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.or(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "111", type: nil)
        let result = try! BinaryCalculator.shared.or(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testNor() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.nor(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "-1000", type: nil)
        let result = try! BinaryCalculator.shared.nor(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testXor() {
        let firstItem = BinaryData(value: "101", type: nil)
        let secondItem = BinaryData(value: "111", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.xor(firstItem: firstItem, secondItem: secondItem), "Calculation Error")
        
        let expectation = BinaryData(value: "10", type: nil)
        let result = try! BinaryCalculator.shared.xor(firstItem: firstItem, secondItem: secondItem)
        let errorMessage = "\n ** Test Fail ** \n Input: \(firstItem), \(secondItem) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testLeftShift() {
        let item = BinaryData(value: "1010", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.leftShift(item), "Calculation Error")
        
        let expectation = BinaryData(value: "10100", type: nil)
        let result = try! BinaryCalculator.shared.leftShift(item)
        let errorMessage = "\n ** Test Fail ** \n Input: \(item) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testRightShift() {
        let item = BinaryData(value: "1010", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.rightShift(item), "Calculation Error")
        
        let expectation = BinaryData(value: "101", type: nil)
        let result = try! BinaryCalculator.shared.rightShift(item)
        let errorMessage = "\n ** Test Fail ** \n Input: \(item) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testNot() {
        let item = BinaryData(value: "101", type: nil)
        
        XCTAssertNoThrow(try BinaryCalculator.shared.not(item), "Calculation Error")
        
        let expectation = BinaryData(value: "-110", type: nil)
        let result = try! BinaryCalculator.shared.not(item)
        let errorMessage = "\n ** Test Fail ** \n Input: \(item) \n Expectaion: \(expectation.value) \n Result: \(result.value)"
        
        XCTAssertEqual(expectation.value, result.value, errorMessage)
    }
    
    func testStringToDouble() {
        let input = "3.5"
        
        XCTAssertNoThrow(try DecimalCalculator.shared.stringToDouble(input), "Calculation Error")
        
        let expectation = 3.5
        let result = (try! DecimalCalculator.shared.stringToDouble(input))
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testStringToInt() {
        let input = "11"
        
        XCTAssertNoThrow(try BinaryCalculator.shared.stringToInt(input), "Calculation Error")
        
        let expectation = 3
        let result = (try! BinaryCalculator.shared.stringToInt(input))
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testGetOperatorDataOfDecimalCalculator() {
        let input = "+"
        
        XCTAssertNoThrow(try DecimalCalculator.shared.getOperatorData(input), "Calculation Error")
        
        let expectation = DecimalData(value: "+", type: .add)
        let result = try! DecimalCalculator.shared.getOperatorData(input)
        let resultValue = result.value
        let resultType = result.type
        let errorMessageForValue = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation.value) \n Result: \(resultValue)"
        let errorMessageForType = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(String(describing: expectation.type)) \n Result: \(String(describing: resultType))"
        
        XCTAssertEqual(expectation.value, resultValue, errorMessageForValue)
        XCTAssertEqual(expectation.type, resultType, errorMessageForType)
    }
    
    func testGetOperatorDataOfBinaryCalculator() {
        let input = "+"
        
        XCTAssertNoThrow(try BinaryCalculator.shared.getOperatorData(input), "Calculation Error")
        
        let expectation = BinaryData(value: "+", type: .add)
        let result = try! BinaryCalculator.shared.getOperatorData(input)
        let resultValue = result.value
        let resultType = result.type
        let errorMessageForValue = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation.value) \n Result: \(resultValue)"
        let errorMessageForType = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(String(describing: expectation.type)) \n Result: \(String(describing: resultType))"
        
        XCTAssertEqual(expectation.value, resultValue, errorMessageForValue)
        XCTAssertEqual(expectation.type, resultType, errorMessageForType)
    }
    
    func testAddOfDecimalCalculator() {
        let firstInput = DecimalData(value: "10", type: nil)
        let secondInput = DecimalData(value: "20", type: nil)

        XCTAssertNoThrow(try DecimalCalculator.shared.add(firstItem: firstInput, secondItem: secondInput), "Calculation Error")

        let expectation = DecimalData(value: "30.0", type: nil)
        let result = try! DecimalCalculator.shared.add(firstItem: firstInput, secondItem: secondInput)
        let resultValue = result.value
        let errorMessageForValue = "\n ** Test Fail ** \n Input: \(firstInput.value), \(secondInput.value) \n Expectaion: \(expectation.value) \n Result: \(resultValue)"
        
        XCTAssertEqual(expectation.value, resultValue, errorMessageForValue)
    }
    
    func testSubtractOfDecimalCalculator() {
        let firstInput = DecimalData(value: "10", type: nil)
        let secondInput = DecimalData(value: "20", type: nil)

        XCTAssertNoThrow(try DecimalCalculator.shared.subtract(firstItem: firstInput, secondItem: secondInput), "Calculation Error")

        let expectation = DecimalData(value: "-10.0", type: nil)
        let result = try! DecimalCalculator.shared.subtract(firstItem: firstInput, secondItem: secondInput)
        let resultValue = result.value
        let errorMessageForValue = "\n ** Test Fail ** \n Input: \(firstInput.value), \(secondInput.value) \n Expectaion: \(expectation.value) \n Result: \(resultValue)"
        
        XCTAssertEqual(expectation.value, resultValue, errorMessageForValue)
    }
    
    func testMultiply() {
        let firstInput = DecimalData(value: "10", type: nil)
        let secondInput = DecimalData(value: "20", type: nil)

        XCTAssertNoThrow(try DecimalCalculator.shared.multiply(firstItem: firstInput, secondItem: secondInput), "Calculation Error")

        let expectation = DecimalData(value: "200.0", type: nil)
        let result = try! DecimalCalculator.shared.multiply(firstItem: firstInput, secondItem: secondInput)
        let resultValue = result.value
        let errorMessageForValue = "\n ** Test Fail ** \n Input: \(firstInput.value), \(secondInput.value) \n Expectaion: \(expectation.value) \n Result: \(resultValue)"
        
        XCTAssertEqual(expectation.value, resultValue, errorMessageForValue)
    }
    
    func testDivide() {
        let firstInput = DecimalData(value: "10", type: nil)
        let secondInput = DecimalData(value: "20", type: nil)

        XCTAssertNoThrow(try DecimalCalculator.shared.divide(firstItem: firstInput, secondItem: secondInput), "Calculation Error")

        let expectation = DecimalData(value: "0.5", type: nil)
        let result = try! DecimalCalculator.shared.divide(firstItem: firstInput, secondItem: secondInput)
        let resultValue = result.value
        let errorMessageForValue = "\n ** Test Fail ** \n Input: \(firstInput.value), \(secondInput.value) \n Expectaion: \(expectation.value) \n Result: \(resultValue)"
        
        XCTAssertEqual(expectation.value, resultValue, errorMessageForValue)
    }
    
    func testAddPositiveInteger() {
        let input = ["1", "+", "10", "+", "100", "+", "1000", "+", "10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "11111.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddNegativaInteger() {
        let input = ["-1", "+", "-10", "+", "-100", "+", "-1000", "+", "-10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-11111.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignInteger() {
        let input = ["1", "+", "-10", "+", "100", "+", "-1000", "+", "10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "9091.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddPositiveDecimal() {
        let input = ["1.8", "+", "10.3", "+", "100.35", "+", "1000.393", "+", "10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "11112.8773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddNegativeDecimal() {
        let input = ["-1.8", "+", "-10.3", "+", "-100.35", "+", "-1000.393", "+", "-10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-11112.8773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignDecimal() {
        let input = ["1.8", "+", "-10.3", "+", "100.35", "+", "-1000.393", "+", "10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "9091.4913"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "+", "-10", "+", "100.35", "+", "-1000.393"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-909.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBothSignIntegerAndBothSignDecimalAndZero() {
        let input = ["1", "+", "-10", "+", "100.35", "+", "-1000.393" + "0"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-909.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }

    func testSubtractPositiveInteger() {
        let input = ["1", "-", "10", "-", "100", "-", "1000", "-", "10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-11109.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractNegativaInteger() {
        let input = ["-1", "-", "-10", "-", "-100", "-", "-1000", "-", "-10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "11109.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignInteger() {
        let input = ["1", "-", "-10", "-", "100", "-", "-1000", "-", "10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-9089.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractPositiveDecimal() {
        let input = ["1.8", "-", "10.3", "-", "100.35", "-", "1000.393", "-", "10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-11109.2773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractNegativeDecimal() {
        let input = ["-1.8", "-", "-10.3", "-", "-100.35", "-", "-1000.393", "-", "-10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "11109.2773"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignDecimal() {
        let input = ["1.8", "-", "-10.3", "-", "100.35", "-", "-1000.393", "-", "10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-9087.8913"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "-", "-10", "-", "100.35", "-", "-1000.393"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "911.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBothSignIntegerAndBothSignDecimalAndZero() {
        let input = ["1", "-", "-10", "-", "100.35", "-", "-1000.393", "-", "0"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "911.043"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyPositiveInteger() {
        let input = ["1", "*", "10", "*", "100", "*", "1000", "*", "10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "10000000000.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyNegativaInteger() {
        let input = ["-1", "*", "-10", "*", "-100", "*", "-1000", "*", "-10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-10000000000.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignInteger() {
        let input = ["1", "*", "-10", "*", "100", "*", "-1000", "*", "10000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "10000000000.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyPositiveDecimal() {
        let input = ["1.8", "*", "10.3", "*", "100.35", "*", "1000.393", "*", "10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "18612265561.621906"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyNegativeDecimal() {
        let input = ["-1.8", "*", "-10.3", "*", "-100.35", "*", "-1000.393", "*", "-10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-18612265561.621906"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignDecimal() {
        let input = ["1.8", "*", "-10.3", "*", "100.35", "*", "-1000.393", "*", "10000.0343"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "18612265561.621906"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "*", "-10", "*", "100.35", "*", "-1000.393"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1003894.3755"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testMultiplyBothSignIntegerAndBothSignDecimalAndZero() {
        let input = ["1", "*", "-10", "*", "100.35", "*", "-1000.393", "*", "0"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "0.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDividePositiveInteger() {
        let input = ["1", "/", "10", "/", "100", "/", "1000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1e-06"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideNegativaInteger() {
        let input = ["-1", "/", "-10", "/", "-100", "/", "-1000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1e-06"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignInteger() {
        let input = ["1", "/", "-10", "/", "100", "/", "-1000"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1e-06"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDividePositiveDecimal() {
        let input = ["1.8", "/", "10.3", "/", "100.35"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "0.001741478"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideNegativeDecimal() {
        let input = ["-1.8", "/", "-10.3", "/", "-100.35"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-0.001741478"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignDecimal() {
        let input = ["1.8", "/", "-10.3", "/", "100.35"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-0.001741478"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testDivideBothSignIntegerAndBothSignDecimal() {
        let input = ["1", "/", "-10", "/", "100.35", "/", "-1000.393"]
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")

        let expectation = "9.96e-07"
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
        
        XCTAssertNoThrow(try DecimalCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1.0"
        let result = (try! DecimalCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBinaryPositiveInteger() {
        let input = ["1", "+", "10", "+", "100", "+", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "10110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBinaryNegativeInteger() {
        let input = ["-1", "+", "-10", "+", "-100", "+", "-1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-10110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAddBinaryBothSignInteger() {
        let input = ["-1", "+", "10", "+", "-100", "+", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBinaryPositiveInteger() {
        let input = ["1", "-", "10", "-", "100", "-", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-10100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBinaryNegativeInteger() {
        let input = ["-1", "-", "-10", "-", "-100", "-", "-1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "10100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testSubtractBinaryBothSignInteger() {
        let input = ["-1", "-", "10", "-", "-100", "-", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAndBinaryPositiveInteger() {
        let input = ["1", "AND", "11", "AND", "111", "AND", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAndBinaryNegativeInteger() {
        let input = ["-1", "AND", "-11", "AND", "-111", "AND", "-1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1111"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testAndBinaryBothSignInteger() {
        let input = ["-1", "AND", "11", "AND", "-111", "AND", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNAndBinaryPositiveInteger() {
        let input = ["1", "NAND", "11", "NAND", "111", "NAND", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }

    func testNAndBinaryNegativeInteger() {
        let input = ["-1", "NAND", "-11", "NAND", "-111", "NAND", "-1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1110"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }

    func testNAndBinaryBothSignInteger() {
        let input = ["-1", "NAND", "11", "NAND", "-111", "NAND", "1111"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1000"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testORBinaryPositiveInteger() {
        let input = ["1", "OR", "10", "OR", "101", "OR", "1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1111"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testORBinaryNagativeInteger() {
        let input = ["-1", "OR", "-10", "OR", "-101", "OR", "-1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testORBinaryBothSignInteger() {
        let input = ["-1", "OR", "10", "OR", "-101", "OR", "1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNORBinaryPositiveInteger() {
        let input = ["1", "NOR", "10", "NOR", "101", "NOR", "1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1011"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNORBinaryNagativeInteger() {
        let input = ["-1", "NOR", "-10", "NOR", "-101", "NOR", "-1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1001"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNORBinaryBothSignInteger() {
        let input = ["-1", "NOR", "10", "NOR", "-101", "NOR", "1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1111"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testXORBinaryPositiveInteger() {
        let input = ["1", "XOR", "10", "XOR", "101", "XOR", "1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testXORBinaryNagativeInteger() {
        let input = ["-1", "XOR", "-10", "XOR", "-101", "XOR", "-1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testXORBinaryBothSignInteger() {
        let input = ["-1", "XOR", "10", "XOR", "-101", "XOR", "1010"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testLeftShiftBinaryPositiveInteger() {
        let input = ["10001", "<<"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "100010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testLeftShiftBinaryNegativeInteger() {
        let input = ["-10001", "<<"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-100010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testRightShiftBinaryPositiveInteger() {
        let input = ["10001", ">>"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1000"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testRightShiftBinaryNegativeInteger() {
        let input = ["-10001", ">>"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1001"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNotBinaryPositiveInteger() {
        let input = ["10001", "NOT"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-10010"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testNotBinaryNegativeInteger() {
        let input = ["-10001", "NOT"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "10000"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"

        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceOneTwo() {
        let input = ["101", ">>", "AND", "10", "<<", "NAND", "1001", "NOT"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceOneThree() {
        let input = ["101", ">>", "+", "10", "<<", "OR", "1001", "NOT", "-", "1"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "-1011"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceTwoThree() {
        let input = ["101", "+", "10", "AND", "1001", "-", "1"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "100"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
    func testBinaryOperatorPrecedenceOneTwoThree() {
        let input = ["101", "<<", "+", "10", "AND", "101", ">>", "-", "1"]
        
        XCTAssertNoThrow(try BinaryCalculator.shared.calculate(input), "Calculation Error")
        
        let expectation = "1011"
        let result = (try! BinaryCalculator.shared.calculate(input)).value
        let errorMessage = "\n ** Test Fail ** \n Input: \(input) \n Expectaion: \(expectation) \n Result: \(result)"
        
        XCTAssertEqual(expectation, result, errorMessage)
    }
    
}
