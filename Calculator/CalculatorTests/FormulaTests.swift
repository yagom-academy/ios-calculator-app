//
//  FormulaTests.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    func test_1_더하기_2의_결과가_3인가() {
        let formula = Formula()
        
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(Operator.add)
        
        XCTAssertEqual(3.0, try formula.result())
    }
    
    func test_1_더하기_2_더하기_3의_결과가_6인가() {
        let formula = Formula()
        
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(2.0)
        formula.operands.enqueue(3.0)
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.add)
        
        XCTAssertEqual(6.0, try formula.result())
    }
    
    func test_2_더하기_3_곱하기_3_빼기_1의_결과가_14인가() {
        let formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operands.enqueue(3.0)
        formula.operands.enqueue(3.0)
        formula.operands.enqueue(1.0)
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.multiply)
        formula.operators.enqueue(Operator.substract)
        
        XCTAssertEqual(14.0, try formula.result())
    }
    
    func test_3_나누기_3_더하기_2_빼기_1의_결과가_2인가() {
        let formula = Formula()
        
        formula.operands.enqueue(3.0)
        formula.operands.enqueue(3.0)
        formula.operands.enqueue(2.0)
        formula.operands.enqueue(1.0)
        formula.operators.enqueue(Operator.divide)
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.substract)
        
        XCTAssertEqual(2.0, try formula.result())
    }
    
    func test_1_더하기_2_빼기_3_곱하기_2_빼기_3_나누기_6의_결과가_마이너스0점5인가() {
        let formula = Formula()
        
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(2.0)
        formula.operands.enqueue(3.0)
        formula.operands.enqueue(2.0)
        formula.operands.enqueue(3.0)
        formula.operands.enqueue(6.0)
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.substract)
        formula.operators.enqueue(Operator.multiply)
        formula.operators.enqueue(Operator.substract)
        formula.operators.enqueue(Operator.divide)
        
        XCTAssertEqual(-0.5, try formula.result())
    }
    
}
