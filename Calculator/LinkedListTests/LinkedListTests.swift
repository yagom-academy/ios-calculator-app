//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Double>!

    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    func testLinkedList_Double타입의값을_append했을때_해당값이잘들어가야한다() {
        // given
        sut.append(10.0)
        // when
        let result = sut.head?.data
        // then
        XCTAssertEqual(result, 10.0)
    }
    
    func testLinkedList_비어있는LinkedList에_isEmpty를_호출했을때_정확한Bool값이나와야한다() {
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertTrue(result)
    }
    
    func testLinkedList_Double타입의값3개를_append한후_removeAll을이용하여전부삭제돼야한다() {
        // given
        sut.append(10.0)
        sut.append(20.0)
        sut.append(30.0)
        sut.removeAll()
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertTrue(result)
    }
    
    func testLinkedList_LinkedList_가비었을때_removeFirst를하면_nil이나와야한다() {
        // when
        let result = sut.removeFirst()
        // then
        XCTAssertNil(result)
    }
    
    func testLinkedList_removeFirst를했을때_제일앞에요소가나와야한다() {
        // given
        sut.append(10.0)
        // when
        let result = sut.removeFirst()
        // then
        XCTAssertEqual(result, 10.0)
    }
}
