//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김성준 on 2023/01/24.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>?
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_queue에값이없을때_isEmpty를호출시_true가나온다() {
        //give
        sut?.clear()
        //when
        let result = sut?.isEmpty
        let expectation = true
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue를_실행할시_파라미터로_준값이_queue에들어간다() {
        //give
        let element = 3
        //when
        sut?.enqueue(element)
        let result = sut?.peek()
        let expectation = element
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_size를_실행할시_queue의_갯수가_반환된다() {
        //give
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
    
    func test_dequeue를_실행할시_첫번째요소가_삭제된다() {
        //give
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3
        //when
        sut?.enqueue(firstElement)
        sut?.enqueue(secondElement)
        sut?.enqueue(thirdElement)
        
        let _ = sut?.dequeue()
        let result = sut?.count
        let expectation = 2
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_dequeue를_실행할시_첫번째요소가_삭제되면서_반환된다() {
        //give
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
}
