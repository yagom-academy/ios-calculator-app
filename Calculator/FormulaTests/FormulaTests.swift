//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by EtialMoon on 2023/06/03.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_operands에1_2를_enqueue하면_operands의enqueuedCalculatorItems에1_2가들어있다() {
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        let expectation = [1.0, 2.0]

        XCTAssertEqual(sut.operands.enqueuedCalculatorItems, expectation)
    }
    
    func test_operands에1_2가있고_dequeue하면_1이반환된다() {
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        let expectation = 1.0

        XCTAssertEqual(sut.operands.dequeue(), expectation)
    }
    
    func test_operators에더하기와빼기가있고_dequeue하면_더하기가반환된다() {
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        let expectation = Operator.add

        XCTAssertEqual(sut.operators.dequeue(), expectation)
    }
    
    func test_operands에1_2_3이있고_operators에더하기곱하기가있을때_result는9가반환된다() throws {
        for input in 1...3 {
            sut.operands.enqueue(Double(input))
        }
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.multiply)
        let expectation = 9.0
        
        let result = try sut.result()
        
        XCTAssertEqual(result, expectation)
    }

    func test_operands에1_4_2가있고_operators에더하기빼기가있을때_result는3이반환된다() throws {
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        let expectation = 3.0

        let result = try sut.result()

        XCTAssertEqual(result, expectation)
    }

    func test_operands에2_4_2가있고_operators에더하기나누기가있을때_result는3이반환된다() throws {
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.divide)
        let expectation = 3.0

        let result = try sut.result()

        XCTAssertEqual(result, expectation)
    }

    func test_operands에10_4_2가있고_operators에빼기곱하기가있을때_result는12가반환된다() throws {
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.multiply)
        let expectation = 12.0

        let result = try sut.result()

        XCTAssertEqual(result, expectation)
    }

    func test_operands에10_4_2가있고_operators에빼기나누기가있을때_result는3이반환된다() throws {
        sut.operands.enqueue(10.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.divide)
        let expectation = 3.0

        let result = try sut.result()

        XCTAssertEqual(result, expectation)
    }

    func test_operands에1_4_2가있고_operators에곱하기나누기가있을때_result는2가반환된다() throws {
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.divide)
        let expectation = 2.0

        let result = try sut.result()

        XCTAssertEqual(result, expectation)
    }

    func test_operands에1_0이있고operators에나누기가있을때_result를수행하면_에러를던진다() throws {
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(0.0)
        sut.operators.enqueue(Operator.divide)

        XCTAssertThrowsError(try sut.result())
    }

    func test_operands에값이없을때_result를수행하면_에러를던진다() {
        XCTAssertThrowsError(try sut.result())
    }
}
