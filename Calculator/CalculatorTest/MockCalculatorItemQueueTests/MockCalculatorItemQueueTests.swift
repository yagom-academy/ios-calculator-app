//
//  MockCalculatorItemQueueTests.swift
//  MockCalculatorItemQueueTests
//
//  Created by kyungmin, EtialMoon on 2023/06/05.
//

import XCTest
@testable import Calculator

final class MockCalculatorItemQueueTests: XCTestCase {
    var sut: MockCalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MockCalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_MockCalculatorItemQueue가_비었을때_enqueue메서드실행시_parameter노드가_firstNode와lastNode가_되는지_확인() {
        //given
        sut?.enqueue(1)
        //when
        let resultFirstNode = sut?.first
        let resultLastNode = sut?.last
        //then
        XCTAssertTrue(resultFirstNode === resultLastNode)
    }
    
    func test_MockCalculatorItemQueue에_요소가_존재할때_lastNode의_previousNode프로퍼티가_nil인지_확인() {
        //given
        sut?.enqueue(1)
        //when
        let result = sut?.last?.previousNode
        //then
        XCTAssertNil(result)
    }
    
    func test_MockCalculatorItemQueue에_노드가_존재할때_enqueue메서드실행시_기존lastNode의_previousNode프로퍼티가_새로들어온파라미터노드가_되는지_확인() {
        //given
        sut?.enqueue(1)
        //when
        sut?.enqueue(2)
        let result = sut?.first?.previousNode
        //then
        XCTAssertTrue(result === sut?.last)
    }

    func test_enqueue메서드실행시_parameter의_타입에_상관없이_노드로_저장되는지_확인() {
        //given
        sut?.enqueue(1)
        sut?.enqueue("=")
        var input: [Node<Any>?] = [Node<Any>?]()
        input.append(sut?.first)
        if sut?.first !== sut?.last {
            input.append(sut?.last)
        }
        //when
        var result: Int = 2
        //then
        XCTAssertEqual(input.count, result)
    }
    
    func test_MockCalculatorItemQueue가_비어있을때_dequeue메서드실행시_nil을_반환하는지_확인() {
        //given
        let result = sut?.dequeue()
        //when, then
        XCTAssertNil(result)
    }
    
    func test_MockCalculatorItemQueue의_노드가_한개일때_dequeue메서드실행시_first노드와lastNode를_nil로_바꿔주는지_확인() {
        //given
        sut?.enqueue(1)
        sut?.dequeue()
        //when
        let resultFirstNode = sut?.first
        let resultLastNode = sut?.last
        // then
        XCTAssertNil(resultFirstNode)
        XCTAssertNil(resultLastNode)
    }
    
    func test_MockCalculatorItemQueue의_노드가_한개일때_dequeue메서드실행시_firstNode의_value값을_반환하는지_확인() {
        //given
        sut?.enqueue(1)
        //when
        var input:Int = Int()
        if let result = sut?.dequeue() as? Int {
            input = result
        }
        let result = 1
        //then
        XCTAssertEqual(input, result)
    }
    
    func test_MockCalculatorItemQueue의_노드가_여러개일때_dequeue메서드실행시_firstNode의_previousNode를_firstNode로_바꿔주는지_확인() {
        //given
        sut?.enqueue(1)
        sut?.enqueue(2)
        sut?.enqueue(3)
        //when
        sut?.dequeue()
        let input:Node<Any>? = sut?.first?.previousNode
        let result:Node<Any>? = sut?.last
        //then
        XCTAssertTrue(input === result)
    }
    
    func test_MockCalculatorItemQueue의_노드가_여러개일때_dequeue메서드실행시_firstNode의_value값을_반환하는지_확인() {
        //given
        sut?.enqueue(1)
        sut?.enqueue(2)
        sut?.enqueue(3)
        //when
        var input:Int = Int()
        if let result = sut?.dequeue() as? Int {
            input = result
        }
        let result = 1
        //then
        XCTAssertEqual(input, result)
    }
}
