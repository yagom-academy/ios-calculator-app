//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/08.
//

import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_배열에서_Double타입_1을_append하면_Double타입_1이_남는다() {
        var queue = CalculatorItemQueue<Double>()
        queue.appendItem(1.0)
        XCTAssertEqual(queue.array, [1.0])
    }
    
    func test_빈_배열에서_Character타입_더하기를_append하면_연산자배열에_더하기가_생성되는지() {
        var queue = CalculatorItemQueue<Character>()
        queue.appendItem("+")
        XCTAssertEqual(queue.array, ["+"])
    }
    
    func test_배열에서_removeItem을_하면_배열의_첫번째_값이_빠지는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.appendItem(1)
        queue.appendItem(2)
        queue.appendItem(3)
        
        do {
            try queue.removeItem()
        } catch {
            return
        }
        
        XCTAssertEqual(queue.array, [2, 3])
    }
    
    func test_배열에_값이_하나_들어있을_경우_removeItem을_하면_빈_배열로_되는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.appendItem(1)
        
        do {
            try queue.removeItem()
        } catch {
            return
        }
        
        XCTAssertEqual(queue.array, [])
    }
    
    func test_빈_배열에_removeItem을_하면_오류를_뱉는지() {
        var queue = CalculatorItemQueue<Int>()
        
        do {
            try queue.removeItem()
        } catch {
            return
        }
        
        XCTAssertThrowsError(QueueError.emptyArray)
    }
}
