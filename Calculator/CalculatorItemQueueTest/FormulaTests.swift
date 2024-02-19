//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by EUNJI CHOI on 2/20/24.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_단순_덧셈_결과를_올바르게_반환한다() {
        // 1 + 2 = 3
        var formula = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        formula.operands.enqueue(1)
        formula.operands.enqueue(2)
        formula.operators.enqueue(.add)
        
        XCTAssertEqual(formula.result(), 3, "1과 2를 더한 결과는 3이어야 한다.")
    }
    
    func test_문자열_파싱으로_단순_덧셈_수식을_생성한다() {
        // "1+2"를 파싱하여 Formula 생성
        var formula = ExpressionParser.parse(from: "1+2")
        
        // 결과 검증
        XCTAssertFalse(formula.operands.isEmpty, "피연산자 큐가 비어 있지 않아야 한다.")
        XCTAssertFalse(formula.operators.isEmpty, "연산자 큐가 비어 있지 않아야 한다.")
        XCTAssertEqual(formula.result(), 3, "\"1+2\"의 계산 결과는 3이어야 한다.")
    }
}
