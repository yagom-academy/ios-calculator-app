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
        sut = CalculatorItemQueue<Int>(enqueueBox: [], dequeueBox: [])
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isEmpty프로퍼티를확인할시_비어있을때_True반환() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }

    func test_스택이안비었을때_isEmpty_false() {
        //given
        sut.enqueue(1)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_count프로퍼티를확인할때_1과2와3이들어있을시_count가3이출력된다() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_peek프로퍼티를확인할때_1과2와3이들어있을시_1이나온다() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let result = sut.peek
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_1과28과9와17을enqueue했을때_enqueueBox에1과28과9와17이들어있다() {
        //given
        sut.enqueue(1)
        sut.enqueue(28)
        sut.enqueue(9)
        sut.enqueue(17)
        
        //when
        let result = sut.enqueueBox
        
        //then
        XCTAssertEqual(result, [1, 28, 9, 17])
    }
    
    func test_1과77과28과9와17을enqueue하고_dequeue호출했을때_1이나온다() {
        //given
        sut.enqueue(1)
        sut.enqueue(77)
        sut.enqueue(28)
        sut.enqueue(9)
        sut.enqueue(17)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈배열에서dequeue호출시nil을반환하는지() {
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_enqueue로여러요소를넣고_clear호출시모두초기화되는지() {
        // given
        sut.enqueue(1)
        sut.enqueue(77)
        sut.enqueue(28)
        sut.enqueue(9)
        sut.enqueue(17)
        sut.dequeue()
        sut.clear()
        
        //when
        let result = sut.enqueueBox.isEmpty && sut.dequeueBox.isEmpty
        
        //then
        XCTAssertTrue(result)
    }

}
