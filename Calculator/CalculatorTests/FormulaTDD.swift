//
//  FormulaTDD.swift
//  CalculatorTests
//
//  Created by LeeChiheon on 2022/05/20.
//

import XCTest

class FormulaTDD: XCTestCase {
    // TODO: 식을 연산자와 숫자로 나누어 큐에 저장, 큐에 들어있는 데이터를 바탕으로 결과를 계산할 수 있는지 테스트
    var formula: Formula!
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        formula = nil
    }

    // MARK: - Formula Tests
    
    func test_연산자와_수를_큐에_나눠서_저장() throws {
        // given
        let expression: String = "1 + 2 - 3 / 4 * 5"
        let expectationOperands: [Double] = [1, 2, 3, 4, 5]
        let expectationOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        // what
        formula = Formula(by: expression)
        
        // then
        for (formulaOperand, expectationOperand) in zip(formula.operands, expectationOperands) {
            XCTAssertEqual(formulaOperand, expectationOperand)
        }
        
        for (formulaOperator, expectationOperator) in zip(formula.operators, expectationOperators) {
            XCTAssertEqual(formulaOperator, expectationOperator)
        }
    }
}
