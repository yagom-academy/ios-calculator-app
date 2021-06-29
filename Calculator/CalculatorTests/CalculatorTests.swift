//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 잼킹 on 2021/06/29.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    let sut = Calculator()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_1더하기2더하기3을_중위표현식배열에넣고계산한뒤에_6과같은지비교한다() {
        // Give
        let expectInputValue = ["1", "+", "2", "+", "3", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }
        
        let expectResult: Double = 6
        let outputValue = sut.deriveEquationValue()
        // Then
        XCTAssertEqual(outputValue, .success(expectResult))
    }
    
    func test_1곱하기2곱하기3을_중위표현식배열에넣고계산한뒤에_6과같은지비교한다() {
        // Give
        let expectInputValue = ["1", "*", "2", "*", "3", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }
        
        let expectResult: Double = 6
        let outputValue = sut.deriveEquationValue()
        // Then
        XCTAssertEqual(outputValue, .success(expectResult))
    }
    
    func test_1빼기2빼기3을_중위표현식배열에넣고계산한뒤에_음수4와같은지비교한다() {
        // Give
        let expectInputValue = ["1", "-", "2", "-", "3", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }
        
        let expectResult: Double = -4
        let outputValue = sut.deriveEquationValue()
        // Then
        XCTAssertEqual(outputValue, .success(expectResult))
    }
    
    func test_1나누기2를_중위표현식배열에넣고계산한뒤에_0dot5과같은지비교한다() {
        // Give
        let expectInputValue = ["1", "/", "2", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }
        
        let expectResult: Double = 0.5
        let outputValue = sut.deriveEquationValue()
        // Then
        XCTAssertEqual(outputValue, .success(expectResult))
    }
    
    func test_1곱하기3더하기2나누기2를_중위표현식배열에넣고계산한뒤에_4과같은지비교한다() {
        // Give
        let expectInputValue = ["1", "*", "3", "+", "2", "/", "2", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }
        
        let expectResult: Double = 4
        let outputValue = sut.deriveEquationValue()
        // Then
        XCTAssertEqual(outputValue, .success(expectResult))
    }
    
    func test_1곱하기3더하기2나누기0을_중위표현식배열에넣고계산한뒤에_NaN과같은지비교한다() {
        // Give
        let expectInputValue = ["1", "*", "3", "+", "2", "/", "0", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }

        let expectResult = "NaN"
        let outputValue = sut.deriveEquationValue()
        // Then
        guard case .failure(let error) = outputValue else {
            return XCTFail("실패를 예상했으나 성공이나옴")
        }
        XCTAssertEqual(error.localizedDescription, expectResult)
    }
    
    func test_10dot1더하기12dot5나누기125더하기8빼기100곱하기13dot8을_중위표현식배열에넣고계산한뒤에_음수1361dot8과같은지비교한다() {
        // Give
        let expectInputValue = ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8", "="]
        // When
        for element in expectInputValue {
            sut.putIntoInfixExpression(of: element)
        }
        
        let expectResult: Double = -1361.8
        let outputValue = sut.deriveEquationValue()
        // Then
        XCTAssertEqual(outputValue, .success(expectResult))
    }
}
