//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by dhoney96 on 2022/05/17.
//

import XCTest

class CalculatorTests: XCTestCase {
    var calculator: CalculatorItemQueue!

    override func setUpWithError() throws {
        calculator = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }
    
    func test_String타입을_Double타입으로_변환해서_반환() {
        let strNumber = "123"
        let correctNumber = 123.0
        
        let resultNumber = calculator.convertToDouble(from: strNumber)
        
        XCTAssertEqual(correctNumber, resultNumber)
    }
    
    func test_문자열의_마지막_문자가_연산기호일경우_item에_추가() {
        let number = "123/"
        let length = 1
        
        calculator.enqueue(number)
        
        XCTAssertEqual(length, calculator.item.count)
    }
    
    func test_item리스트의_첫번째_요소를_반환() {
        let number1 = "123+"
        let number2 = "456-"
        let returnNumber = "123+"
        
        calculator.enqueue(number1)
        calculator.enqueue(number2)
        
        let result = calculator.dequeue()
        
        XCTAssertEqual(returnNumber, result)
    }
}
