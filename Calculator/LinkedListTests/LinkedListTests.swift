//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count가0일때_isEmpty가True인지() {
        // given
        sut.count = 0
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_count가0보다클때_isEmpty가False인지() {
        // given
        sut.count = 5
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_append호출시_isEmpty일때_head와tail에newNode가할당되는지() {
        // given
        sut.count = 0
        let data: Int = 10
        
        // when
        sut.append(data)
        
        // then
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
        XCTAssertTrue(sut.head === sut.tail)
    }
    
    func test_append호출시_isEmpty일때_count가1증가하는지() {
        // given
        sut.count = 0
        let data: Int = 10
        
        // when
        sut.append(data)
        
        // then
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_append호출시_count가1일때_tail에newNode가할당되는지() {
        // given
        let data: Int = 10
        sut.append(data)
        let newData: Int = 20
        
        // when
        sut.append(newData)
        
        // then
        XCTAssertFalse(sut.head === sut.tail)
        XCTAssertEqual(sut.head?.data, data)
        XCTAssertEqual(sut.tail?.data, newData)
    }
    
    func test_append호출시_count가1일때_tail에newNode가할당된후_count가1늘어나는지() {
        // given
        let data: Int = 10
        sut.append(data)
        
        // when
        sut.append(data)
        
        // then
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_append호출시_count가2이상일때_tail에newNode가할당되는지() {
        // given
        let firstData: Int = 10
        sut.append(firstData)
        let secondData: Int = 20
        sut.append(secondData)
        let thirdData: Int = 30
        sut.append(thirdData)
        let forthData: Int = 40
        
        // when
        sut.append(forthData)
        
        // then
        XCTAssertEqual(sut.head?.data, 10)
        XCTAssertEqual(sut.head?.next?.data, 20)
        XCTAssertEqual(sut.head?.next?.next?.data, 30)
        XCTAssertEqual(sut.tail?.data, 40)
        XCTAssertTrue(sut.head?.next?.next?.next === sut.tail)
    }
    
    func test_append호출시_count가2이상일때_tail에newNode가할당된후_count가1올라가는지() {
        // given
        let firstData: Int = 10
        sut.append(firstData)
        let secondData: Int = 20
        sut.append(secondData)
        let thirdData: Int = 30
        
        // when
        sut.append(thirdData)
        
        // then
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_removeFirst호출시_head의Next가head가되는지() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        let head = sut.head
        let headNext = sut.head?.next
        
        // when
        sut.removeFirst()
        
        // then
        XCTAssertTrue(sut.head === headNext)
        XCTAssertFalse(sut.head === head)
        XCTAssertEqual(sut.head?.data, 20)
    }
    
    func test_removeFirst호출시_head의Next가head가된후_count가1감소하는지() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        let count = sut.count
        
        // when
        sut.removeFirst()
        
        // then
        XCTAssertEqual(sut.count, (count - 1))
    }
    
}
