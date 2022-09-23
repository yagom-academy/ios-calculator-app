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
    
    func test_enqueue로_요소를_넣어주면_data는_비어있지않다() {
        // given
        let input = 0.0
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertTrue(!sut.isEmpty)
    }
    
    func test_빈큐에_enqueue로_3을_넣어주면_data의_첫값과_같다() {
        // given
        sut.clear()
        let input = 3.0
        
        // when
        sut.enqueue(input)
        guard let result = sut.peek else {
            return XCTFail()
        }
        
        // then
        XCTAssertEqual(result, input)
    }

    func test_enqueue를_반복호출하면_data의_마지막요소와_전달값의_마지막요소가_같다() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        
        // when
        input.forEach{ sut.enqueue($0) }
        guard let result = sut.last,
        let last = input.last else {
            return XCTFail()
        }
        
        // then
        XCTAssertEqual(result, last)
    }

    func test_data에_요소가_있을때_dequeue를_호출하면_반환값이_있다() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }

    func test_data에_요소가_없을때_dequeue를_호출하면_nil을_반환한다() {
        // given
        sut.clear()
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }

    func test_data에_요소가_있을때_dequeue를_호출하면_data의_카운트가_감소한다() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        let originCount = sut.count
        
        // when
        sut.dequeue()
        let result = sut.count
        
        // then
        XCTAssert(result < originCount)
    }

    func test_data에_요소가_있을때_peek을_호출하면_반환값이_있다() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNotNil(result)
    }

    func test_data에_요소가_없을때_peek를_호출하면_nil을_반환한다() {
        // given
        sut.clear()
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNil(result)
    }

    func test_data에_요소가_있을때_peek를_호출하면_data의_카운트가_변하지않는다() {
        // given
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        let originCount = sut.count
        
        // when
        let _ = sut.peek
        let result = sut.count
        
        // then
        XCTAssertEqual(result, originCount)
    }

    func test_data에_요소가_있을때_clear를_호출하면_data가_빈다() {
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

    func test_data에_요소가_있을때_count를_호출하면_0이아니다() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.count
        
        // then
        XCTAssertNotEqual(result, Int.zero)
    }

    func test_data의_요소가_4개일때_count를_호출하면_4를_반환한다() {
        // given
        sut.clear()
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, input.count)
    }

    func test_data에_요소가_있을때_isEmpty를_호출하면_false를_반환한다() {
        // given
        sut.enqueue(1.0)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }

    func test_data에_요소가_없을때_isEmpty를_호출하면_true를_반환한다() {
        // given
        sut.clear()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }

    func test_capacity와_count가_같을때_isFull을_호출하면_true를_반환한다() {
        // given
        sut.capacity = sut.count
        
        // when
        let result = sut.isFull
        
        // then
        XCTAssertTrue(result)
    }

    func test_capacity와_count가_다를때_isFull을_호출하면_false를_반환한다() {
        // given
        sut.capacity = sut.count + 1
        
        // when
        let result = sut.isFull
        
        // then
        XCTAssertFalse(result)
    }

    func test_data의_요소가_4개일때_capasity의_getter를_호출하면_입력배열의_용량과_같다() {
        // given
        sut.clear()
        let input = [1.0, 3.0, 5.0, 7.0]
        input.forEach{
            sut.enqueue($0)
        }
        
        // when
        let result = sut.capacity
        
        // then
        XCTAssertEqual(result, input.capacity)
    }

    func test_capasity의_setter를_호출하면_기존용량과_달라진다() {
        // given
        let originCapacity = sut.capacity
        
        // when
        sut.capacity += 1
        let result = sut.capacity
        
        // then
        XCTAssertNotEqual(result, originCapacity)
    }

    func test_인덱스의_범위내에서_insert를_호출하면_인덱스에_입력값이_위치한다() {
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

    func test_인덱스의_범위내에서_remove를_호출하면_인덱스의_값이_변한다() {
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
