//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by smfc on 19/9/2022.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
        
    func test_큐가비어있을때_enqueue메서드를통해입력되는지확인() {
        // given
        let input = "1"
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertEqual(sut.queue, ["1"])
    }
    
    func test_큐가이미들어있을때_enqueue로새로추가한엘리먼트가뒤로추가되는지확인() {
        // given
        sut.queue = ["1"]
        let input = "2"
        
        // when
        let _ = sut.enqueue(input)
        
        // then
        XCTAssertEqual(sut.queue[1], "2")
    }
    
    func test_큐에아무것도없을때_count메서드결과가0인지확인() {
        // given
        sut.queue = []
        
        // when
        let result = sut.count()
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_큐에데이터가들어있을때_enqueue한갯수만큼count가올라가는지확인() {
        // given
        sut.queue = ["1", "2"]
        for _ in 1...5 {
            sut.enqueue(String(Int.random(in: 1...9)))
        }
        
        // when
        let result = sut.count()
        
        // then
        XCTAssertEqual(result, 7)
    }
    
    func test_큐가비어있는경우_isEmpty메서드가true를반환하는지확인() {
        // given
        sut.queue = []
        
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐가비어있지않은경우_isEmpty메서드가false를반환하는지확인() {
        // given
        sut.queue = ["1", "2"]
        
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_큐가비어있는경우_clear메서드호출시isEmpty로확인하면true인지확인() {
        // given
        sut.queue = []
        
        // when
        sut.clear()
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐가비어있지않은경우_clear메서드호출시isEmpty로확인하면true인지확인() {
        // given
        sut.queue = ["1", "2", "3", "4" , "5"]
        
        // when
        sut.clear()
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐가비어있지않을때_dequeue메서드호출시처음인덱스값이리턴되는지확인() {
        // given
        sut.queue = ["0", "1", "2"]
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, "0")
    }
    
    func test_큐가비어있는경우_dequeue메서드호출시nil을반환하는지확인() {
        // given
        sut.queue = []
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐가들어있는경우_dequeue를여러번했을때해당되는요소를반환하는지확인() {
        // given
        sut.queue = ["0", "1", "2", "3"]
        
        // when
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, "2")
    }
    
    func test_큐가비어있을때_peek메서드호출시nil을반환하는지확인() {
        // given
        sut.queue = []
        
        // when
        let result = sut.peek()
        
        // then
      XCTAssertNil(result)
    }
    
    func test_큐가dequeue로인해head가count보다큰경우_peek메서드호출시nil을반환하는지확인() {
        // given
        sut.enqueue("0")
        sut.enqueue("1")
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐가들어있는경우_peek메서드호출시첫번째요소가반환되는지확인() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        let _ = sut.dequeue()
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, "2")
    }
}
