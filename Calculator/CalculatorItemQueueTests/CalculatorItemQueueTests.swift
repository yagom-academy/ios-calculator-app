//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Gundy on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue호출시_data가비어있는지() {
        // given
        let input = 0.0
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_enqueue를_1회호출시_3을전달하면_data의첫값과_같은지() {
        // given
        let input = 3.0
        
        // when
        sut.enqueue(input)
        if let result = sut.peek {
            // then
            XCTAssertEqual(result, 3.0)
        }
    }

    func test_enqueue반복호출시_data의마지막값과_전달값의마지막값이_같은지() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        
        // when
        input.forEach{ sut.enqueue($0) }
        if let result = sut.last {
            // then
            XCTAssertEqual(result, 7.0)
        }
    }

    func test_data가있을때_dequeue호출시_반환값이있는지() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }

    func test_data가없을때_dequeue호출시_nil을반환하는지() {
        // given
        sut.clear()
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }

    func test_data가있을때_dequeue호출시_data의카운트가_감소하는지() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        sut.dequeue()
        let result = sut.count
        
        // then
        XCTAssert(result < input.count)
    }

    func test_data가있을때_peek호출시_반환값이있는지() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNotNil(result)
    }

    func test_data가없을때_peek호출시_nil을반환하는지() {
        // given
        sut.clear()
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNil(result)
    }

    func test_data가있을때_peek호출시_data의카운트가_그대로인지() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        let _ = sut.peek
        let result = sut.count
        
        // then
        XCTAssertEqual(result, input.count)
    }

    func test_data가있을때_clear호출시_data가_빈배열인지() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        sut.clear()
        let result = sut.isEmpty
        
        // then
        XCTAssert(result)
    }

    func test_data가있을때_count호출시_0이아닌지() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.count
        
        // then
        XCTAssertNotEqual(result, Int.zero)
    }

    func test_data의요소가4개일때_count호출시_4를반환하는지() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, input.count)
    }

    func test_data의요소가있을때_isEmpty호출시_false를반환하는지() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }

    func test_data의요소가없을때_isEmpty호출시_true를반환하는지() {
        // given
        sut.clear()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }

    func test_capacity와count가_같을때_isFull호출시_true를반환하는지() {
        // given
        sut.capacity = sut.count
        
        // when
        let result = sut.isFull
        
        // then
        XCTAssertTrue(result)
    }

    func test_capacity와count가_다를때_isFull호출시_false를반환하는지() {
        // given
        sut.capacity = sut.count + 1
        
        // when
        let result = sut.isFull
        
        // then
        XCTAssertFalse(result)
    }

    func test_data의요소가_4개일때_capasity_getter호출시_입력배열의용량과_같은지() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        let result = sut.capacity
        
        // then
        XCTAssertEqual(result, input.capacity)
    }

    func test_capasity_setter호출시_기존용량과다른지() {
        // given
        let originCapacity = sut.capacity
        
        // when
        sut.capacity += 1
        let result = sut.capacity
        
        // then
        XCTAssertNotEqual(result, originCapacity)
    }

    func test_인덱스범위내에서_insert호출시_인덱스2에_마지막입력값9가_위치하는지() {
        // given
        let data = [1.0, 3.0, 5.0, 7.0]
        data.forEach{
            sut.enqueue($0)
        }
        let input = 9.0
        
        // when
        sut.insert(input, at: 2)
        for _ in 0...1 {
            sut.dequeue()
        }
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, input)
    }

    func test_인덱스범위내에서_remove호출시_인덱스의_값이변하는지() {
        // given
        let data = [1.0, 3.0, 5.0, 7.0]
        data.forEach{
            sut.enqueue($0)
        }
        let input = 9.0
        
        // when
        sut.enqueue(input)
        sut.remove(at: sut.count - 1)
        let result = sut.last
        
        // then
        XCTAssertNotEqual(result, input)
    }
}
