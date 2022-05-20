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
        let expectationOperands: [Double] = [1, 2, 3, 4, 5]
        let expectationOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        // what
        formula = Formula()
        formula.operands = [1, 2, 3, 4, 5]
        formula.operators = [.add, .subtract, .divide, .multiply]
        
        // then
        print("DEBUG: \(formula.operands)")
        for (formulaOperand, expectationOperand) in zip(formula.operands, expectationOperands) {
            XCTAssertEqual(formulaOperand, expectationOperand)
        }
        
        print("DEBUG: \(formula.operators)")
        for (formulaOperator, expectationOperator) in zip(formula.operators, expectationOperators) {
            XCTAssertEqual(formulaOperator, expectationOperator)
        }
    }
    
    func test_큐에들어있는값들로_계산한결과값_리턴() throws {
        // given
        let expectation: Double = 15.0
        
        // what
        formula = Formula()
        formula.operands = [5, 4, 3, 5]
        formula.operators = [.add, .divide, .multiply]

        // then
        switch formula.result() {
        case .success(let data):
            XCTAssertEqual(data, expectation)
        case .failure(_):
            break
        }
    }
    
    func test_0으로나누면_에러리턴() throws {
        // given
        let expectation: FormulaError = .notANumber
        
        // what
        formula = Formula()
        formula.operands = [5, 4, 0, 5]
        formula.operators = [.add, .divide, .multiply]

        // then
        switch formula.result() {
        case .success(_):
            break
        case .failure(let error):
            XCTAssertEqual(error as! FormulaError, expectation)
        }
    }
}
