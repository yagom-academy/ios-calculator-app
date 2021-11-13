//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/11.
//

import XCTest

class FormulaTests: XCTestCase {
    var formula: Formula = Formula(
        operands: CalculatorItemQueue<Double>(),
        operators: CalculatorItemQueue<Operator>())
    
    override func setUp() {
        formula.operands.enqueue(3.7)
        formula.operands.enqueue(4.9)
        formula.operands.enqueue(0.0)
        formula.operands.enqueue(12.4)
        formula.operands.enqueue(-342.6)
    }
    
    override func tearDown() {
        formula = Formula(
            operands: CalculatorItemQueue<Double>(),
            operators: CalculatorItemQueue<Operator>())
    }
    
    func testCalculateResult() throws {
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.subtract)
        formula.operators.enqueue(.devide)
        formula.operators.enqueue(.multiply)
        
        do {
            let result = try formula.result()
            XCTAssertEqual(result, ((3.7 + 4.9) - 0.0) / 12.4 * -342.6)
        } catch QueueError.EmptyQueue {
            print(QueueError.EmptyQueue.localizedDescription)
        } catch OperationError.devidedByZero {
            print(OperationError.devidedByZero)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func testCalculateResultWhereDevideByZero() throws {
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.devide)
        formula.operators.enqueue(.subtract)
        formula.operators.enqueue(.multiply)
        
        XCTAssertThrowsError(try formula.result())
    }
}

