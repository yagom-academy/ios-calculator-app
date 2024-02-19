//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by EUNJI CHOI on 2/20/24.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
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
    
    func test_공백만_있는_문자열_분리() {
        let components = ExpressionParser.componentsByOperators(from: " ")
        XCTAssertTrue(components.isEmpty)
    }

    // 테스트 2: 단일 숫자
    func test_단일_숫자_분리() {
        let components = ExpressionParser.componentsByOperators(from: "1")
        XCTAssertEqual(components, ["1"])
    }

    // 테스트 3: 숫자와 연산자 혼합
    func test_숫자와_연산자_혼합_분리() {
        let components = ExpressionParser.componentsByOperators(from: "1+2")
        XCTAssertEqual(components, ["1", "+", "2"])
    }

    // 테스트 4: 공백 포함 분리
    func test_공백_포함_분리() {
        let components = ExpressionParser.componentsByOperators(from: " 1  +  2 ")
        XCTAssertEqual(components, ["1", "+", "2"])
    }
    
    func test_단순_덧셈_파싱을_성공적으로_수행한다() {
        // "1+2" 수식을 파싱
        var formula = ExpressionParser.parse(from: "1+2")
        // 반환된 Formula 인스턴스에서 피연산자와 연산자를 검증
        guard let firstOperand = formula.operands.dequeue(),
              let secondOperand = formula.operands.dequeue(),
              let operation = formula.operators.dequeue() else {
            XCTFail("피연산자 또는 연산자가 없습니다.")
            return
        }
        
        // 예상되는 값과 비교
        XCTAssertEqual(firstOperand, 1.0, "첫 번째 피연산자가 1.0이어야 합니다.")
        XCTAssertEqual(secondOperand, 2.0, "두 번째 피연산자가 2.0이어야 합니다.")
        XCTAssertEqual(operation, .add, "연산자가 덧셈이어야 합니다.")
        
        // 더 이상의 피연산자나 연산자가 없는지 확인
        XCTAssertTrue(formula.operands.isEmpty, "피연산자 큐가 비어 있어야 합니다.")
        XCTAssertTrue(formula.operators.isEmpty, "연산자 큐가 비어 있어야 합니다.")
    }

}
