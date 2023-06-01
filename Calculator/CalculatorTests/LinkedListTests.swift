//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by idinaloq on 2023/05/29.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }
    
    func test_head가nil인경우_isEmpty가_true인지() {
        //given
        let head = sut.currentHead()
        guard head == nil else {
            XCTFail("List가 비어있지 않음.")
            return
        }
        //when
        let isEmpty = sut.isEmpty
        //then
        XCTAssertEqual(isEmpty, true)
    }
    
    func test_최초list에노드가없는경우_head에노드를추가하고_tail을head로설정하는지() {
        //given
        let input = 1
        //when
        sut.append(data: input)
        let head = sut.currentHead()
        let tail = sut.currentTail()
        //then
        XCTAssert(head === tail)
    }
    
    func test_list에노드가있는경우_head는유지하고_tail이추가되었는지() {
        //given
        let firstInput = 1
        let secondInput = 2
        //when
        sut.append(data: firstInput)
        sut.append(data: secondInput)
        let head = sut.currentHead()
        let tail = sut.currentTail()
        //then
        XCTAssert(head !== tail)
    }
    
    func test_isEmpty가true인경우_removeFirst메서드가_nil을반환하는지() {
        //given
        guard sut.isEmpty == true else {
            XCTFail("isEmpty가 true가 아님.")
            return
        }
        //when
        let removedData = sut.removeFirst()
        //then
        XCTAssertTrue(sut.isEmpty)
        XCTAssertEqual(removedData, nil)
    }
    
    func test_node가한개만존재할떄_removeFirst메서드로head와tail이nil로설정되고_제거한값을리턴하는지() {
        //given
        let input = 1
        sut.append(data: input)
        //when
        let removedData = sut.removeFirst()
        let head = sut.currentHead()
        let tail = sut.currentTail()
        //then
        XCTAssertNil(head)
        XCTAssertNil(tail)
        XCTAssertEqual(removedData, input)
    }
    
    func test_node가복수개이고_removeFirst메서드를사용했을때_head와tail이nil이아니고제거한값을차례로리턴하는지() {
        //given
        let firstInput = 1
        let secondInput = 2
        let thirdInput = 3
        sut.append(data: firstInput)
        sut.append(data: secondInput)
        sut.append(data: thirdInput)
        //when
        let removedFirstData = sut.removeFirst()
        let removedSecondData = sut.removeFirst()
        let head = sut.currentHead()
        let tail = sut.currentTail()
        //then
        XCTAssertNotNil(head)
        XCTAssertNotNil(tail)
        XCTAssertEqual(removedFirstData, firstInput)
        XCTAssertEqual(removedSecondData, secondInput)
    }
    
    func test_node가존재할때_removeAll메서드가실행되면_head와tail이nil로설정되는지() {
        //given
        let input = 1
        sut.append(data: input)
        //when
        sut.removeAll()
        let head = sut.currentHead()
        let tail = sut.currentTail()
        //then
        XCTAssertNil(head)
        XCTAssertNil(tail)
    }
}
