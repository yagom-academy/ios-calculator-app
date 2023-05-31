//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by myungsun on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_NumberItem_인스턴스를_enqueue하면_items_프로퍼티에_정상적으로_값이_들어간다() {
        let numberItem = NumberItem(number: 10)
        
        sut.enqueue(item: numberItem)
        
        if let numberItem = sut.dequeue() as? NumberItem {
            XCTAssertEqual(numberItem.number, 10)
        }
    }
    
    func test_OperatorItem_인스턴스를_enqueue하면_items_프로퍼티에_정상적으로_값이_들어간다() {
        let operatorItem = OperatorItem.add
        
        sut.enqueue(item: operatorItem)
        
        if let operatorItem = sut.dequeue() as? OperatorItem {
            XCTAssertEqual(operatorItem, OperatorItem.add)
        }
    }
    
    func test_items_프로퍼티가_비어있을_때_dequeue_메서드를_호출하면_nil을_반환한다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_items_프로퍼티가_비어있지_않을_때_dequeue_메서드를_호출하면_nil을_반환하지_않는다() {
        let numberItem = NumberItem(number: 7)
        
        sut.enqueue(item: numberItem)
        let result = sut.dequeue()
        
        XCTAssertNotNil(result)
    }
    
    func test_clear_메서드를_호출하면_items_프로퍼티에_들어있는_값이_비어있는_상태가_된다() {
        sut.enqueue(item: NumberItem(number: 5))
        sut.enqueue(item: NumberItem(number: 10))
        sut.enqueue(item: OperatorItem.add)
        sut.clear()
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
}

