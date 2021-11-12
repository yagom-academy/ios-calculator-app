//
//  ExperssionParserTests.swift
//  CalculatorTests
//
//  Created by 황제하 on 2021/11/12.
//

import XCTest

class ExperssionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!
    
    override func setUpWithError() throws {
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_수식을_입력했을때_componentsByOperators함수에서_숫자만_반환하는가() {
        // given
        let input = "1+2−3*4/5"
        
        // when
        let result = sut.componentsByOperators(form: input)
        
        // then
        XCTAssertEqual(result, ["1", "2", "3", "4", "5"])
    }
    
    func test_수식을_입력했을때_Formula_operands큐에_올바르게_들어가는가() {
        // given
        let input = "1+2−3*4/5"
        
        // when
        let formula = sut.parse(form: input)
        var result: [Double] = []
        while formula.operands.isEmpty == false {
            let number = try! formula.operands.dequeue()
            result.append(number)
        }
        
        // then
        XCTAssertEqual(result, [1, 2, 3, 4, 5])
    }
    
    func test_수식을_입력했을때_Formula_operators큐에_올바르게_들어가는가() {
        // given
        let input = "1+2−3*4/5"
        
        // when
        let formula = sut.parse(form: input)
        var result: [Operator] = []
        while formula.operators.isEmpty == false {
            let `operator` = try! formula.operators.dequeue()
            result.append(`operator`)
        }
        
        // then
        XCTAssertEqual(result, [.add, .subtract, .multiply, .divide])
    }
    
    func test_수식을_입력했을때_Formula_result함수의_결과가_올바르게_나오는가() {
        // given
        let input = "1+2−1*4/5"
        
        // when
        let formula = sut.parse(form: input)
        let result = try! formula.result()
        
        // then
        XCTAssertEqual(result, 1.6)
    }
    
    func test_수식중에_0으로_나누는곳이_있다면_divideToZero에러를_던지는가() {
        // given
        let input = "1+2−1/0*5"
        
        // when
        let formula = sut.parse(form: input)
        
        // then
        XCTAssertThrowsError(try formula.result()) { error in
            XCTAssertEqual(error as? OperatorError, .divideToZero)
        }
    }
}
