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
    
    func testCalculatorItemQueue_문자열을_enqueue했을때해당문자열이잘들어가야한다() {
        sut.enqueue("HI")
        
        guard let result = sut.dequeue() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HI")
    }
    
    func testCalculatorItemQueue_Queue가비어있을때_removeAll을하면_nil이나와야한다() {
        sut.enqueue("HI")
        sut.enqueue("HO")
        sut.enqueue("HU")
        sut.removeAll()
        
        let result = sut.bringQueue().bringHead()
        
        XCTAssertEqual(result == nil, true)
    }
    
    func testCalculatorItemQueue_Queue_가비었을때_removeFirst를하면_nil이나와야한다() {
        
    }
    
    func testCalculatorItemQueue_removeFirst를했을때_제일앞에요소가나와야한다() {
        
    }
}
