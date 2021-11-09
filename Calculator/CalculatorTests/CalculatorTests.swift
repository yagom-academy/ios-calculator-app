//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_숫자스택에서_Double타입_1을_append하면_Double타입_1이_남는다() {
        var queue = CalculatorItemQueue<Double>()
        queue.appendItem(1.0)
        XCTAssertEqual(queue.array, [1.0])
    }
    
    func test_빈_연산자스택에서_Character타입_더하기를_append하면_연산자배열에_더하기가_생성되는지() {
        var queue = CalculatorItemQueue<Character>()
        queue.appendItem("+")
        XCTAssertEqual(queue.array, ["+"])
    }
}
