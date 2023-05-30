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
    
    func test_calculate_메서드를_사용해서_2_와_3을_더하면_5가_반환된다() {
        sut.enqueue(item: NumberItem(number: 2))
        sut.enqueue(item: OperatorItem.add)
        sut.enqueue(item: NumberItem(number: 3))
        let expectation = "5"
        
        let result = sut.calculate()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_메서드를_사용해서_5_와_6을_뺴면_마이너스_1이_반환된다() {
        sut.enqueue(item: NumberItem(number: 5))
        sut.enqueue(item: OperatorItem.subtract)
        sut.enqueue(item: NumberItem(number: 6))
        let expectation = "-1"
        
        let result = sut.calculate()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_메서드를_사용해서_2_점_3와_3_점_2을_곱하면_7_점_3_6_이_반환된다() {
        sut.enqueue(item: NumberItem(number: 2.3))
        sut.enqueue(item: OperatorItem.multiply)
        sut.enqueue(item: NumberItem(number: 3.2))
        let expectation = "7.36"
        
        let result = sut.calculate()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_메서드를_사용해서_2를_0으로_나누면_NaN을_반환한다() {
        sut.enqueue(item: NumberItem(number: 5))
        sut.enqueue(item: OperatorItem.divide)
        sut.enqueue(item: NumberItem(number: 0))
        let expectation = "NaN"
        
        let result = sut.calculate()
        XCTAssertEqual(result, expectation)
    }
}

