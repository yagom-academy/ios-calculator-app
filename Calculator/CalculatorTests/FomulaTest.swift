//
//  FomulaTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/11.
//

import XCTest

class FomulaTest: XCTestCase {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    var formula = Formula(operands: operands, operators: operators)
    
    override func setUp() {
        formula = Formula(operands: operands, operators: operators)
    }
    
    override func tearDown() {
        formula.operands.removeAll()
        formula.operators.removeAll()
    }
    
    func test_피연산자와_연산자가_없는_경우_0을_반환하는지() {
        let calculationResult = formula.result()
        XCTAssertEqual(0.0, calculationResult)
    }
    
    func test_3개의_수를_덧셈만_하는_경우_정상적으로_연산되는지() {
        [3.0, -2.0, 15.0].forEach { number in
            formula.operands.enqueue(number)
        }
        
        let operators: [Character] = ["+", "+"]
        
        operators.forEach { arithmetic in
            guard let arithmetic = Operator(rawValue: arithmetic) else {
                return
            }
            
            formula.operands.enqueue(arithmetic)
        }
        
        let calculationResult = formula.result()
        XCTAssertEqual(-14.0, calculationResult)
    }
    
    func test_3개의_수를_뺄셈만_하는_경우_정상적으로_연산되는지() {
        [3.0, -2.0, 15.0].forEach { number in
            formula.operands.enqueue(number)
        }
        
        let operators: [Character] = ["-", "-"]
        
        operators.forEach { arithmetic in
            guard let arithmetic = Operator(rawValue: arithmetic) else {
                return
            }
            
            formula.operands.enqueue(arithmetic)
        }
        
        let calculationResult = formula.result()
        XCTAssertEqual(-10.0, calculationResult)
    }
    
    func test_3개의_수를_곱셈만_하는_경우_정상적으로_연산되는지() {
        [3.0, -2.0, 15.0].forEach { number in
            formula.operands.enqueue(number)
        }
        
        let operators: [Character] = ["*", "*"]
        
        operators.forEach { arithmetic in
            guard let arithmetic = Operator(rawValue: arithmetic) else {
                return
            }
            
            formula.operands.enqueue(arithmetic)
        }
        
        let calculationResult = formula.result()
        XCTAssertEqual(-90.0, calculationResult)
    }
    
    func test_3개의_수를_나눗셈만_하는_경우_정상적으로_연산되는지() {
        [15.0, 3.0, -2.0,].forEach { number in
            formula.operands.enqueue(number)
        }
        
        let operators: [Character] = ["/", "/"]
        
        operators.forEach { arithmetic in
            guard let arithmetic = Operator(rawValue: arithmetic) else {
                return
            }
            
            formula.operands.enqueue(arithmetic)
        }
        
        let calculationResult = formula.result()
        XCTAssertEqual(-2.5, calculationResult)
    }
    
    func test_0으로_나누는_경우가_포함되어있는_경우_최종_연산결과가_nan인지() {
        [15.0, 3.0, 0.0, -2.0,].forEach { number in
            formula.operands.enqueue(number)
        }
        
        let operators: [Character] = ["/", "/", "+"]
        
        operators.forEach { arithmetic in
            guard let arithmetic = Operator(rawValue: arithmetic) else {
                return
            }
            
            formula.operands.enqueue(arithmetic)
        }
        
        let calculationResult = formula.result()
        XCTAssertTrue(calculationResult.isNaN)
    }
    
    func test_일반적인_우선순위가_아닌_연산자의_순서에_따라_값이_연산되는지() {
        [15.0, 3.0, -2.0,].forEach { number in
            formula.operands.enqueue(number)
        }
        
        let operators: [Character] = ["+", "*"]
        
        operators.forEach { arithmetic in
            guard let arithmetic = Operator(rawValue: arithmetic) else {
                return
            }
            
            formula.operands.enqueue(arithmetic)
        }
        
        let calculationResult = formula.result()
        XCTAssertEqual(-36.0, calculationResult)
    }
}
