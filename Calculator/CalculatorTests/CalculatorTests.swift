//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_숫자스택에서_Double타입_1을_append하면_Double타입_1이_남는다() {
        var stack = CalculatorItemQueue()
        stack.appendItem(1.0)
        XCTAssertEqual(stack.number, [1.0])
    }
}
