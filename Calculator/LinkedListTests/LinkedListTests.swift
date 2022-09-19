//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Kyo on 2022/09/20.
//

import XCTest

@testable import Calculator
class LinkedListTests: XCTestCase {

    var sut: LinkedList<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_append_5번_후_count_확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.append(data: "4")
        sut.append(data: "5")
        XCTAssertEqual(sut.count, 5)
    }
    
    func test_append_3번_removeFirst_1번_후_확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_append_3번_후_removeAll실행확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeAll()
        XCTAssertTrue(sut.head == nil && sut.tail == nil)
    }
    
    func test_append_3번_후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        XCTAssertTrue(sut.head?.data == "1")
    }

    func test_append_3번_후_tail확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        XCTAssertTrue(sut.tail?.data == "3")
    }
    
    func test_append_3번_removeFirst_1번후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        XCTAssertTrue(sut.head?.data == "2")
    }
    
    func test_append_3번_removeFirst_3번후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        sut.removeFirst()
        sut.removeFirst()
        XCTAssertTrue(sut.head?.data == nil)
    }
}
