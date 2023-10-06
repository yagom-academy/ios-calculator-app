//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박기석 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_스택이모두비었을때_isEmpty_true() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }

    func test_스택이안비었을때_isEmpty_false() {
        sut.enqueue(1)
        
        let result = sut.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_count가옳게출력되는지테스트() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let result = sut.count
        
        XCTAssertEqual(result, 3)
    }
    
    func test_front호출테스트() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let result = sut.peek
        
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue호출시값이잘들어가있는지() {
        sut.enqueue(1)
        sut.enqueue(28)
        sut.enqueue(9)
        sut.enqueue(17)
        
        XCTAssertEqual(sut.enqueueBox, [1, 28, 9, 17])
    }
    
    func test_dequeue호출시값이잘빠지는지() {
        sut.enqueue(1)
        sut.enqueue(77)
        sut.enqueue(28)
        sut.enqueue(9)
        sut.enqueue(17)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 1)
    }
    
    func test_빈배열에서dequeue호출시nil을반환하는지() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_clear호출시모두초기화되는지() {
        sut.enqueue(1)
        sut.enqueue(77)
        sut.enqueue(28)
        sut.enqueue(9)
        sut.enqueue(17)
        sut.dequeue()
        sut.clear()
        
        let result = sut.enqueueBox.isEmpty && sut.dequeueBox.isEmpty
        
        XCTAssertTrue(result)
    }

}
