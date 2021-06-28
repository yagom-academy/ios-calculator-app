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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_계산기에_1더하기2더하기3연산시_6이나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "1")
        calculator.enterExpression(operation: "+", inputNumber: "2")
        calculator.enterExpression(operation: "+", inputNumber: "3")
        calculator.enterExpression(operation: "=", inputNumber: "")
    
        let plusResult = try calculator.calculate()
        XCTAssertTrue(plusResult == "6")
        print(plusResult)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_계산기에_1곱하기2곱하기3연산시_6이나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "1")
        calculator.enterExpression(operation: "×", inputNumber: "2")
        calculator.enterExpression(operation: "×", inputNumber: "3")
        calculator.enterExpression(operation: "=", inputNumber: "")
        
        let multiplyResult = try calculator.calculate()
        XCTAssertTrue(multiplyResult == "6")
        print(multiplyResult)
    }
    
    func test_계산기에_1빼기2빼기3연산시_마이너스4가나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "1")
        calculator.enterExpression(operation: "-", inputNumber: "2")
        calculator.enterExpression(operation: "-", inputNumber: "3")
        calculator.enterExpression(operation: "=", inputNumber: "")
        
        let minusResult = try calculator.calculate()
        XCTAssertTrue(minusResult == "-4")
        print(minusResult)
    }
    
    func test_계산기에_1나누기2연산시_0p5가나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "1")
        calculator.enterExpression(operation: "÷", inputNumber: "2")
        calculator.enterExpression(operation: "=", inputNumber: "")
        
        let divideResult = try calculator.calculate()
        print(divideResult)
        XCTAssertTrue(divideResult == "0.5")
    }

    func test_계산기에_1곱하기3더하기2나누기2연산시_4가나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "1")
        calculator.enterExpression(operation: "×", inputNumber: "3")
        calculator.enterExpression(operation: "+", inputNumber: "2")
        calculator.enterExpression(operation: "÷", inputNumber: "2")
        calculator.enterExpression(operation: "=", inputNumber: "")
        
        let complexResult = try calculator.calculate()
        print(complexResult)
        XCTAssertTrue(complexResult == "4")
    }
    
    func test_계산기에_1곱하기3더하기2나누기0연산시_NaN이나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "1")
        calculator.enterExpression(operation: "×", inputNumber: "3")
        calculator.enterExpression(operation: "+", inputNumber: "2")
        calculator.enterExpression(operation: "÷", inputNumber: "0")
        calculator.enterExpression(operation: "=", inputNumber: "")
        
        let complexResult = try calculator.calculate()
        print(complexResult)
        XCTAssertTrue(complexResult == "NaN")
    }
    
    func test_계산기에_10p1더하기12p5나누기125더하기8빼기100곱하기13p8연산시_마이너스1361p8이나온다() throws {
        calculator.enterExpression(operation: "", inputNumber: "10.1")
        calculator.enterExpression(operation: "+", inputNumber: "12.5")
        calculator.enterExpression(operation: "÷", inputNumber: "125")
        calculator.enterExpression(operation: "+", inputNumber: "8")
        calculator.enterExpression(operation: "-", inputNumber: "100")
        calculator.enterExpression(operation: "×", inputNumber: "13.8")
        calculator.enterExpression(operation: "=", inputNumber: "")
        
        let complexResult = try calculator.calculate()
        print(complexResult)
        XCTAssertTrue(complexResult == "-1361.8")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
