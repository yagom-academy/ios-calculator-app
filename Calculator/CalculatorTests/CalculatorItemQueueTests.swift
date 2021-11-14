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
        XCTAssertEqual(queue.item, [1.0])
    }
    
    func test_빈_배열에서_Character타입_더하기를_append하면_연산자배열에_더하기가_생성되는지() {
        var queue = CalculatorItemQueue<Operator>()
        queue.appendItem(.add)
        XCTAssertEqual(queue.item, [.add])
    }
    
    func test_배열에_값이_하나_들어있을_경우_removeItem을_하면_빈_배열로_되는지() {
        var queue = CalculatorItemQueue<Operator>()
        queue.appendItem(.add)
        
        XCTAssertEqual(try queue.removeItem(), [])
    }
    
    func test_빈_Double배열에_removeItem을_하면_오류를_뱉는지() {
        var queue = CalculatorItemQueue<Double>()
        
        do {
            try queue.removeItem()
        } catch {
            return
        }
        
        XCTAssertThrowsError(QueueError.emptyArray)
    }
    
    func test_빈_Operator배열에_removeItem을_하면_오류를_뱉는지() {
        var queue = CalculatorItemQueue<Double>()
        
        do {
            try queue.removeItem()
        } catch {
            return
        }
        
        XCTAssertThrowsError(QueueError.emptyArray)
    }
    
    func test_배열에_Character_값이_3개_들어있을_때_removeAllItem을_하면_빈_배열로_되는지() {
        var queue = CalculatorItemQueue<Operator>()
        queue.appendItem(.add)
        queue.appendItem(.divide)
        queue.appendItem(.multiply)
        
        do {
            try queue.removeAllItems()
        } catch {
            return
        }
        
        XCTAssertEqual(queue.item, [])
    }
    
    func test_배열에_Double_값이_3개_들어있을_때_removeAllItem을_하면_빈_배열로_되는지() {
        var queue = CalculatorItemQueue<Double>()
        queue.appendItem(1)
        queue.appendItem(2)
        queue.appendItem(3)
        
        do {
            try queue.removeAllItems()
        } catch {
            return
        }
        
        XCTAssertEqual(queue.item, [])
    }
}
