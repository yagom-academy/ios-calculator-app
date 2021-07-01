//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박태현 on 2021/06/28.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var calculator = Calculator()

    func test_계산기에_1더하기2더하기3연산시_6이나온다() throws {
        //give
        var input = ["", "1", "+", "2", "+", "3", "=", ""]
        
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()
        
        //then
        print(calculationResult)
        let expectedResult = "6"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }
    
    func test_계산기에_1곱하기2곱하기3연산시_6이나온다() throws {
        //give
        var input = ["", "1", "×", "2", "×", "3", "=", ""]
        
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()

        //then
        print(calculationResult)
        let expectedResult = "6"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }
    
    func test_계산기에_1빼기2빼기3연산시_마이너스4가나온다() throws {
        //give
        var input = ["", "1", "-", "2", "-", "3", "=", ""]
                
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()
        
        //then
        print(calculationResult)
        let expectedResult = "-4"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }
    
    func test_계산기에_1나누기2연산시_0p5가나온다() throws {
        //give
        var input = ["", "1", "÷", "2", "=", ""]
        
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()

        //then
        print(calculationResult)
        let expectedResult = "0.5"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }

    func test_계산기에_1곱하기3더하기2나누기2연산시_4가나온다() throws {
        //give
        var input = ["", "1", "×", "3", "+", "2", "÷", "2", "=", ""]
        
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()

        //then
        print(calculationResult)
        let expectedResult = "4"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }
    
    func test_계산기에_1곱하기3더하기2나누기0연산시_NaN이나온다() throws {
        //give
        var input = ["", "1", "×", "3", "+", "2", "÷", "0", "=", ""]
        
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()

        //then
        print(calculationResult)
        let expectedResult = "NaN"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }
    
    func test_계산기에_10p1더하기12p5나누기125더하기8빼기100곱하기13p8연산시_마이너스1361p8이나온다() throws {
        //give
        var input = ["", "10.1", "+", "12.5", "÷", "125", "+", "8", "-", "100", "×", "13.8", "=", ""]
          
        //when
        while !input.isEmpty {
            calculator.enterExpression(operation: input.removeFirst(), inputNumber: input.removeFirst())
        }
        let calculationResult = try calculator.calculate()
        
        //then
        print(calculationResult)
        let expectedResult = "-1361.8"
        XCTAssertTrue(calculationResult == expectedResult)
        XCTAssertFalse(calculationResult != expectedResult)
    }
}
