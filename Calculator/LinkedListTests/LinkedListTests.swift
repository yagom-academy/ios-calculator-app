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
    
    func test_append_5번_후_removeFirst후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.append(data: "4")
        sut.append(data: "5")
        sut.removeFirst()
        XCTAssertEqual(sut.bringHead(), "2")
    }
    
    func test_append_5번_후_tail확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.append(data: "4")
        sut.append(data: "5")
        XCTAssertEqual(sut.bringTail(), "5")
    }
    
    func test_append_3번_removeFirst_1번_후_확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_append_3번_후_removeAll실행_count확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeAll()
        XCTAssertTrue(sut.count == 0)
    }
    
    func test_append_3번_후_removeAll실행_head와tail확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeAll()
        XCTAssertEqual(sut.bringHead() == nil && sut.bringTail() == nil, true)
    }
    
    func test_append_3번_후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        XCTAssertTrue(sut.bringHead() == "1")
    }
    
    func test_append_3번_removeFirst_1번후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        XCTAssertTrue(sut.bringHead() == "2")
    }
    
    func test_append_3번_후_tail확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        XCTAssertTrue(sut.bringTail() == "3")
    }
    
    func test_append_3번_removeFirst_1번후_tail확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        XCTAssertTrue(sut.bringTail() == "3")
    }
    
    func test_append_3번_removeFirst_3번후_head확인() {
        sut.append(data: "1")
        sut.append(data: "2")
        sut.append(data: "3")
        sut.removeFirst()
        sut.removeFirst()
        sut.removeFirst()
        XCTAssertTrue(sut.bringHead() == nil)
    }
}
