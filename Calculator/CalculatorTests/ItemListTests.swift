//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/19.
//

import XCTest
@testable import Calculator

final class ItemListTests: XCTestCase {
    var sut: ItemList!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ItemList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_값을_넣었을_때_head가_nil이_아님() {
        sut.enqueue("test")
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_enqueue_값이_잘_연결되어있는지_확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.enqueue("4")
        
        XCTAssertEqual(sut.head?.data, "1")
        XCTAssertEqual(sut.head?.next?.data, "2")
        XCTAssertEqual(sut.head?.next?.next?.data, "3")
        XCTAssertEqual(sut.head?.next?.next?.next?.data, "4")
        XCTAssertEqual(sut.tail?.data, "4")
    }
    
    func test_dequeue_값이_있는데_실행하면_data값을_반환() {
        sut.enqueue("test")
        let data = sut.dequeue()
        
        XCTAssertEqual(data, "test")
    }
    
    func test_dequeue_값이_없는데_실행하면_nil() {
        let data = sut.dequeue()
        
        XCTAssertNil(data)
    }
    
    func test_dequeue_값이_잘빠지는지_확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.enqueue("4")
        
        XCTAssertEqual(sut.dequeue(), "1")
        XCTAssertEqual(sut.count, 3)
        
        XCTAssertEqual(sut.dequeue(), "2")
        XCTAssertEqual(sut.count, 2)
        
        XCTAssertEqual(sut.dequeue(), "3")
        XCTAssertEqual(sut.count, 1)
        
        XCTAssertEqual(sut.dequeue(), "4")
        XCTAssertEqual(sut.count, 0)
        
        XCTAssertNil(sut.dequeue())
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_값을_넣고_clearQueue_실행_시_head_tail_이_nil() {
        test_enqueue_값을_넣었을_때_head가_nil이_아님()
        sut.clearQueue()
        
        XCTAssertTrue(sut.isEmpty())
    }

}
