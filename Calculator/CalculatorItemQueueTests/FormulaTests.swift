//
//  FormulaTests.swift
//  Created by 미니.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    func test_피연산자의수가연산자의수보다1개많은경우연산을정상수행하는지() {
        // driven
        let operands: [Double] = [10, 9, 8, 7, 6]
        let operators: [Operator] = [.add, .divide, .multiply, .subtract]
        let sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 10.625)
    }
    
    func test_피연산자의수가연산자의수보다2개이상많은경우연산수행결과가예측값과동일한가() {
        // driven
        let operands: [Double] = [10, 9, 8, 7, 6, 5]
        let operators: [Operator] = [.add, .divide, .multiply, .subtract]
        let sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 10.625)
    }
    
    func test_연산자의수가피연산자의수와동일한경우연산수행결과가예측치와동일한가() {
        // driven
        let operands: [Double] = [10, 9, 8, 7]
        let operators: [Operator] = [.add, .divide, .multiply, .subtract]
        let sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 16.625)
    }
    
    func test_연산자의수가피연산자의수보다많은경우수행결과가예측치와동일한가() {
        // driven
        let operands: [Double] = [10, 9, 8]
        let operators: [Operator] = [.add, .divide, .multiply, .subtract]
        let sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 2.375)
    }
    
    func test_연산자가나눗셈인경우피연산자가0인경우nil을반환하는가() {
        // driven
        let operands: [Double] = [10, 9, 0]
        let operators: [Operator] = [.add, .divide, .multiply, .subtract]
        let sut = Formula(operands: operands, operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_피연산자가없는경우nil을반환하는가() {
        // driven
        let operators: [Operator] = [.add, .divide, .multiply, .subtract]
        let sut = Formula(operators: operators)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertNil(result)
    }
}
