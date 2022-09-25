//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    func testCalculatorItemQueue_Double타입의값을_enqueue했을때해당값이잘들어가야한다() {
        sut.enqueue(10.0)
        
        let result = sut.queue.head?.data

        XCTAssertEqual(result, 10.0)
    }
    
    func testCalculatorItemQueue_비어있는CalculatorItemQueue에_isEmpty를_호출했을때_정확한Bool값이나와야한다() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func testCalculatorItemQueue_Double타입의값3개를enqueue한후_removeAll을하면_전부삭제돼야한다() {
        sut.enqueue(10.0)
        sut.enqueue(20.0)
        sut.enqueue(30.0)
        sut.removeAll()
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func testCalculatorItemQueue_Queue_가비었을때_dequeue를하면_nil이나와야한다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func testCalculatorItemQueue_dequeue를했을때_해당Double타입의값이나와야한다() {
        sut.enqueue(10.0)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 10.0)
    }
}
