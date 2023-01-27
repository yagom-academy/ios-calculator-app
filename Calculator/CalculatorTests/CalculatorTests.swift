//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jinah Park on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_dequeue호출시_큐가빈상태일경우_nil을반환한다() {
        //given
        sut = .init()
        //when
        let result = sut.dequeue()
        //then
        XCTAssertNil(result)
    }
    
    func test_dequeue호출시_큐가비지않았을경우_첫번째요소를빼서반환한다() {
        //given
        sut = .init(["1", "2", "3"])
        let expectedResult = "1"
        let expectedData = ["2", "3"]
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(expectedResult, result)
        XCTAssertEqual(expectedData, sut.data)
        
    }
    
    func test_dequeue호출시_큐에하나의요소가있을경우_첫번째요소를빼서반환하고빈배열이남는다() {
        //given
        sut = .init(["1"])
        let expectedResult = "1"
        let expectedData:[String] = []
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(expectedResult, result)
        XCTAssertEqual(expectedData, sut.data)
        
    }
    
    func test_peek호출시_큐가빈상태일경우_nil을반환한다() {
        //given
        sut = .init()
        //when
        let result = sut.peek()
        //then
        XCTAssertNil(result)
    }
    
    func test_peek호출시_큐가비지않았을경우_첫번째요소를빼지않고반환한다() {
        //given
        sut = .init(["1", "2", "3"])
        let expectedResult = "1"
        let expectedData = ["1", "2", "3"]
        //when
        let result = sut.peek()
        //then
        XCTAssertEqual(expectedResult, result)
        XCTAssertEqual(expectedData, sut.data)
        
    }
    
    func test_enqueue호출시_맨뒤에요소가추가된다() {
        //given
        sut = .init(["1", "2", "3"])
        let expectedData = ["1", "2", "3", "4"]
        //when
        sut.enqueue("4")
        //then
        XCTAssertEqual(expectedData, sut.data)
    }
    
    func test_enqueue호출시_큐가비었을경우_요소가추가된다() {
        //given
        sut = .init()
        let expectedData = ["4"]
        //when
        sut.enqueue("4")
        //then
        XCTAssertEqual(expectedData, sut.data)
    }
    
    func test_clear호출시_모든요소가삭제된다() {
        //given
        sut = .init(["1", "2", "3"])
        let expectedData: [String] = []
        //when
        sut.clear()
        //then
        XCTAssertEqual(expectedData, sut.data)
    }
    
    func test_isEmpty호출시_비어있을때_True를반환한다() {
        //given
        sut = .init()
        //when
        let result = sut.isEmpty
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty호출시_요소가하나라도있을때_False를반환한다() {
        //given
        sut = .init(["1"])
        //when
        let result = sut.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    func test_비어있을때_count가_0이다() {
        //given
        sut = .init()
        let expectedCount = 0
        //then
        XCTAssertEqual(expectedCount, sut.count)
    }
    
    func test_1개의요소가있을때_count가_1이다() {
        //given
        sut = .init(["1"])
        let expectedCount = 1
        //then
        XCTAssertEqual(expectedCount, sut.count)
    }
}
