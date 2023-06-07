//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by kangkyungmin on 2023/06/07.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>()
                      , operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Formula의_operands프로퍼티에_Double값이_enqueue되는지_확인() {
        //given
        let enqueueValue = 0.1
        sut.operands.enqueue(enqueueValue)
        //when
        var result = Double()
        if let dequeueValue = sut.operands.dequeue() {
            result = dequeueValue
        }
        //then
        XCTAssertEqual(enqueueValue, result)
    }
    
    func test_Formula의_operators프로퍼티에_Operator값이_enqueue되는지_확인() {
        //given
        let enqueueValue = Operator.divide
        sut.operators.enqueue(enqueueValue)
        //when, then
        let result = Operator.divide
        if let dequeueValue = sut.operators.dequeue() {
            XCTAssertEqual(dequeueValue, result)
        }
    }
    
    func test_Formula의_operands프로퍼티에_값이_있을때_dequeue되는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operands.enqueue(0.2)
        sut.operands.enqueue(0.3)
        //when, then
        let result = [0.1, 0.2, 0.3]
        for resultElement in result {
            let dequeueValue: Double? = sut.operands.dequeue()
            XCTAssertEqual(dequeueValue, resultElement)
        }
    }
    
    func test_Formula의_operators프로퍼티에_값이_있을때_dequeue되는지_확인() {
        //given
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.add)
        //when, then
        let result: [Operator] = [.add, .subtract, .add]
        for resultElement in result {
            let dequeueValue: Operator? = sut.operators.dequeue()
            XCTAssertEqual(dequeueValue, resultElement)
        }
    }
    
    func test_Formula의_result메서드가_operators의_요소는1개이고_operands의_요소는2개일때_결과를_제대로반환하는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operands.enqueue(0.2)
        sut.operators.enqueue(Operator.add)
        //when
        let result = 0.3
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_Formula의_result메서드가_operators의_요소는5개이고_operands의_요소는4개일때_결과를_제대로반환하는지_확인() {
        //given
        sut.operands.enqueue(1)
        sut.operands.enqueue(2)
        sut.operands.enqueue(2)
        sut.operands.enqueue(2)
        sut.operands.enqueue(2)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.divide)
        //when
        let result = 1.0
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_Formula의_result메서드가_operators의_요소는2개이고_operands의_요소는2개일때_결과를_제대로반환하는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operands.enqueue(0.2)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        //when
        let result = 0.3
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_Formula의_result메서드가_operators의_요소_divide로_operands의_요소0을_받으면_error를_반환하는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operands.enqueue(0)
        sut.operators.enqueue(Operator.divide)
        //when
        let result: Double? = nil
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_Formula의_result메서드가_operators의_요소는4개이고_operands의_요소는1개일때_error를_제대로반환하는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operands.enqueue(0.2)
        sut.operands.enqueue(0.1)
        sut.operands.enqueue(0.2)
        sut.operators.enqueue(Operator.add)
        //when
        let result: Double? = nil
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_Formula의_result메서드가_operators의_요소는2개이고_operands의_요소는1개일때_결과를_제대로반환하는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.subtract)
        //when
        let result: Double? = 0.1
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_Formula의_result메서드가_operators의_요소는0개이고_operands의_요소는0개일때_결과를_제대로반환하는지_확인() {
        //given
        sut.operands.enqueue(0.1)
        sut.operands.dequeue()
        sut.operators.enqueue(Operator.subtract)
        sut.operators.dequeue()
        //when
        let result: Double? = nil
        let input = try? sut.result()
        //then
        XCTAssertEqual(result, input)
    }
}
