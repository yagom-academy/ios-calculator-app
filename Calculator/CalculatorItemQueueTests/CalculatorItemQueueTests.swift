//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    func testCalculatorItemQueue_문자열을_enqueue했을때해당문자열이잘들어가야한다() {
        sut.enqueue("HI")
        
        let result = sut.queue.head?.data

        XCTAssertEqual(result, "HI")
    }
    
    func testCalculatorItemQueue_비어있는CalculatorItemQueue에_isEmpty를_호출했을때_정확한Bool값이나와야한다() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func testCalculatorItemQueue_문자열3개를enqueue한후_removeAll을하면_전부삭제돼야한다() {
        sut.enqueue("HI")
        sut.enqueue("HO")
        sut.enqueue("HU")
        sut.removeAll()
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func testCalculatorItemQueue_Queue_가비었을때_dequeue를하면_nil이나와야한다() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func testCalculatorItemQueue_dequeue를했을때_해당문자열이나와야한다() {
        sut.enqueue("HI")
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, "HI")
    }
}
