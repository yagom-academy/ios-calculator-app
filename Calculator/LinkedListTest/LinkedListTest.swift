//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by 강민수 on 2023/01/26.
//

import XCTest
@testable import Calculator

extension String: CalculateItem {
}

final class LinkedListTest: XCTestCase {
    
    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_초기_인스턴스_생성시_isEmpty는_true이다() {
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_a의_값을_append하면_isEmpty는_false이다() {
        // given
        let firstValue = "a"
        // when
        sut.append(firstValue)
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_a의_값을_append한다면_head값은_a이다() {
        // given
        let value = "a"
        let exception = "a"
        // when
        sut.append(value)
        let headValue = sut.head!.value
        // then
        XCTAssertEqual(headValue, exception)
    }
    
    func test_a의_값을_처음_append한다면_tail값은_a이다() {
        // given
        let value = "a"
        let exception = "a"
        // when
        sut.append(value)
        let tailValue = sut.tail!.value
        // then
        XCTAssertEqual(tailValue, exception)
    }
    
    func test_a과_b_두개의_값을_append한다면_head는_a_tail은_b다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let headException = "a"
        let tailException = "b"
        // when
        sut.append(firstValue)
        sut.append(secondValue)
        let headValue = sut.head!.value
        let tailValue = sut.tail!.value
        // then
        XCTAssertEqual(headValue, headException)
        XCTAssertEqual(tailValue, tailException)
    }
    
    func test_a와_b_두개의_Node를_가진_LinkedList에서_removeFirst를_한다면_반환값은_a이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let exception = "a"
        // when
        sut.append(firstValue)
        sut.append(secondValue)
        let removedValue = sut.removeFirst()!
        // then
        XCTAssertEqual(exception, removedValue)
    }
    
    func test_a와_b_두개의_Node를_가진_LinkedList에서_removeFirst를_두번한다면_반환값은_head와_tail은_nil이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        // when
        sut.append(firstValue)
        sut.append(secondValue)
        _ = sut.removeFirst()
        _ = sut.removeFirst()

        let headValue = sut.head
        let tailValue = sut.tail
        // then
        XCTAssertNil(headValue)
        XCTAssertNil(tailValue)
    }
    
    func test_a와_b_두개의_Node를_가진_LinkedList에서_removeFirst를_두번한다면_반환값은_isEmpty는_true이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        // when
        sut.append(firstValue)
        sut.append(secondValue)
        _ = sut.removeFirst()
        _ = sut.removeFirst()
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_isEmpty가_true인_상태에서_removeFirst를_한다면_nil이_반환된다() {
        // given
        // when
        XCTAssertTrue(sut.isEmpty)
        // then
        XCTAssertNil(sut.removeFirst())
    }

    func test_a와b를_append하고_removeAll을_할_경우_head와_tail은_nil이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        // when
        sut.append(firstValue)
        sut.append(secondValue)
        
        sut.removeAll()
        // then
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
