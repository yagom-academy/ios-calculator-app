//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_HI를_enqueue했을때잘들어가는지() {
        sut.enqueue("HI")
        
        guard let result = sut.dequeue() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HI")
    }
    
    func test_HI랑HO를_enqueue했을때잘들어가는지() {
        sut.enqueue("HI")
        sut.enqueue("HO")
        
        guard let result = sut.dequeue() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HI")
        
        guard let result = sut.dequeue() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HO")
    }
    
    func test_HI랑HO랑HU를_enqueue한후_제일마지막요소가HI인지() {
        sut.enqueue("HI")
        sut.enqueue("HO")
        sut.enqueue("HU")
        
        guard let tail = sut.bringQueue().bringTail() else {
            return
        }
        
        guard let result = tail.bringData() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HU")
    }
    
    func test_HI랑HO랑HU를_enqueue한후removeAll을이용하여전부삭제가가능한지() {
        sut.enqueue("HI")
        sut.enqueue("HO")
        sut.enqueue("HU")
        sut.removeAll()
        
        let result = sut.bringQueue().bringHead()
        
        XCTAssertEqual(result == nil, true)
    }
    
    func test_HI랑HO를enqueue하고HI를dequeue하고_HU를다시enqueue했을때_head가HO인지() {
        sut.enqueue("HI")
        sut.enqueue("HO")
        
        let _ = sut.dequeue()
        
        sut.enqueue("HU")
        
        guard let head = sut.bringQueue().bringHead() else {
            return
        }
        
        guard let result = head.bringData() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HO")
    }
}
