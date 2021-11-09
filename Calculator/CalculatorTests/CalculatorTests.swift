//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    func test_숫자배열이_초기화_직후_비어있는지() {
        let calculatorTest = CalculatorItemQueue()
        
        let result = calculatorTest.numberArray.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_연산자배열이_초기화_직후_비어있는지() {
        let calculatorTest = CalculatorItemQueue()
        
        let result = calculatorTest.mathOperatorArray.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_숫자배열에_넣는_5가_Double_타입인지() {
        var calculatorTest = CalculatorItemQueue()
        calculatorTest.enQueueNumberArray(item: 5)
        
        let expectation: Double = 5
        let result = calculatorTest.numberArray[0]
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열에_넣는_음수가_Double_타입인지() {
        var calculatorTest = CalculatorItemQueue()
        calculatorTest.enQueueNumberArray(item: -2)
        
        let expectation: Double = -2
        let result = calculatorTest.numberArray[0]
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열에_넣는_0이_Double_타입인지() {
        var calculatorTest = CalculatorItemQueue()
        calculatorTest.enQueueNumberArray(item: 0)
        
        let expectation: Double = 0
        let result = calculatorTest.numberArray[0]
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_연산자배열에_add케이스_넣어지는지() {
        var calculatorTest = CalculatorItemQueue()
        calculatorTest.enQueueMathOperatorArray(item: .add)
        
        let expectation: MathOperator = .add
        let result = calculatorTest.mathOperatorArray[0]
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_숫자배열이_비어있을때_deQueue메서드로_nil반환되는지() {
        var calculatorTest = CalculatorItemQueue()
        
        let result = calculatorTest.deQueueNumberArray()
        
        XCTAssertNil(result)
    }
    
    func test_숫자배열에_원소있을때_deQueue메서드로_뽑히는지() {
        var calculatorTest = CalculatorItemQueue()
        calculatorTest.enQueueNumberArray(item: 100)
        
        let expectation: Double = 100
        let result = calculatorTest.deQueueNumberArray()
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_연산자배열이_비어있을때_deQueue메서드로_nil반환되는지() {
        var calculatorTest = CalculatorItemQueue()
        
        let result = calculatorTest.deQueueMathOperatorArray()
        
        XCTAssertNil(result)
    }
    
    func test_연산자배열에_원소있을때_deQueue메서드로_뽑히는지() {
        var calculatorTest = CalculatorItemQueue()
        calculatorTest.enQueueMathOperatorArray(item: .multiply)
        
        let expectation: MathOperator = .multiply
        let result = calculatorTest.deQueueMathOperatorArray()
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_두배열이_모두_비워지는지() {
        var calculatorTest = CalculatorItemQueue()
        
        calculatorTest.enQueueNumberArray(item: 1)
        calculatorTest.enQueueNumberArray(item: -2)
        calculatorTest.enQueueNumberArray(item: 3.3)
        calculatorTest.enQueueNumberArray(item: 0)
        
        calculatorTest.enQueueMathOperatorArray(item: .add)
        calculatorTest.enQueueMathOperatorArray(item: .subtract)
        calculatorTest.enQueueMathOperatorArray(item: .multiply)
        calculatorTest.enQueueMathOperatorArray(item: .divide)
        
        calculatorTest.clearBothArrays()
        
        let result = calculatorTest.numberArray.isEmpty && calculatorTest.mathOperatorArray.isEmpty
        
        XCTAssertTrue(result)
    }
}
