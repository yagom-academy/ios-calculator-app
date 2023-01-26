//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김성준 on 2023/01/24.
//

import XCTest

extension Int : CalculateItem { }

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Int>?
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    func test_queue에_값이없을때_isEmpty를호출시_true가나온다() {
        //given
        sut?.clear()
        //when
        let result = sut?.isEmpty
        let expectation = true
        //then
        XCTAssertEqual(result, expectation)
    }


    func test_peek을_실행할때_queue가_비어있다면_nil이_반환된다() {
        //given
        sut?.clear()
        //when
        let result = sut?.peek()
        let expectation: Int? = nil
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_peek을_실행할때_queue의_첫번째요소가_반환된다() {
        //given
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)

        sut?.dequeue()
        
        let result = sut?.queue.first
        let expectation: Int? = nil
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_enqueue를_실행할때_파라미터로_준값이_queue에들어간다() {
        //given
        let element = 3
        //when
        sut?.enqueue(element)
        let result = sut?.peek()
        let expectation = element
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_count는_queue요소의_갯수를_get_한다() {
        //given
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)

        let result = sut?.count
        let expectation = 3
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue를_실행할때_첫번째요소가_삭제된다() {
        //given
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)

        sut?.dequeue()
        
        let result = sut?.queue.first
        let expectation: Int? = nil
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue를_실행할때_첫번째요소가_삭제되면서_반환된다() {
        //given
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)

        let result = sut?.dequeue()
        let expectation = firstElement
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue를_실행할때_queue가_비어있다면_nil이_반환된다() {
        //given
        sut?.clear()
        //when
        let result = sut?.dequeue()
        let expectation: Int? = nil
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue를_실행할때_count가_1만큼_줄어든다() {
        //given
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)
        let previousCount = sut?.count

        sut?.dequeue()
        let result = sut?.count
        let expectation = previousCount! - 1
        //then
        XCTAssertEqual(result, expectation)
    }
    
}
