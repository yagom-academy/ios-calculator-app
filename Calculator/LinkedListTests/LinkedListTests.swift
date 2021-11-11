//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK:- append() tests
    func test_빈리스트에서append호출시_4를전달하면_headvalue에4가할당되는지() {
        //when
        sut.append(4)
        //then
        XCTAssertEqual(sut.head?.value, 4)
    }
    
    func test_4가있는리스트에서append호출시_7을전달하면_headnextvalue에7이할당되는지() {
        //given
        sut.append(4)
        //when
        sut.append(7)
        //then
        XCTAssertEqual(sut.head?.next?.value, 7)
    }
    
    // MARK:- removeFirst() tests
    func test_빈List에서_removeFirst호출시_에러없이nil반환되는지() {
        //given
        guard sut.isEmpty else {
            return
        }
        //when
        let result = sut.removeFirst()
        //then
        XCTAssertNil(result)
    }
    func test_4가있는List에서_removeFirst호출시_4가반환되고head와tail이nil되는지() {
        //given
        sut.append(4)
        //when
        let result = sut.removeFirst()
        //then
        XCTAssertEqual(result, 4)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    func test_4와7추가한List에서_removeFirst호출시_4가반환되고head와tail이7되는지() {
        //given
        sut.append(4)
        sut.append(7)
        //when
        let result = sut.removeFirst()
        //then
        XCTAssertEqual(result, 4)
        XCTAssertEqual(sut.head?.value, 7)
        XCTAssertEqual(sut.tail?.value, 7)
    }
    func test_4와7과9추가한List에서_removeFirst호출시_4가반환되고head7tail9되는지() {
        //given
        sut.append(4)
        sut.append(7)
        sut.append(9)
        //when
        let result = sut.removeFirst()
        //then
        XCTAssertEqual(result, 4)
        XCTAssertEqual(sut.head?.value, 7)
        XCTAssertEqual(sut.tail?.value, 9)
    }

    // MARK:- isEmpty tests
    func test_빈List에_isEmpty를요청하면_true반환() {
        //given
        //when
        let result = sut.isEmpty
        //then
        XCTAssertTrue(result)
    }
    func test_비지않은List에_isEmpty를요청하면_false반환() {
        //given
        sut.append(1)
        //when
        let result = sut.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    // MARK:- first tests
    func test_빈List에_first를요청하면_nil반환() {
        //given
        guard sut.isEmpty else { return }
        //when
        let result = sut.first
        //then
        XCTAssertNil(result)
    }
    func test_4가있는List에_first를요청하면_4반환() {
        //given
        sut.append(4)
        //when
        let result = sut.first
        //then
        XCTAssertEqual(result, 4)
    }
    func test_4와9를추가한List에_first를요청하면_4반환() {
        //given
        sut.append(4)
        sut.append(9)
        //when
        let result = sut.first
        //then
        XCTAssertEqual(result, 4)
    }
    
    // MARK:- count tests
    func test_빈List에_count를요청하면_0반환() {
        //given
        guard sut.isEmpty else { return }
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 0)
    }
    func test_4가있는List에_count요청하면_1반환() {
        //given
        sut.append(4)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 1)
    }
    func test_4와9가있는List에_count요청하면_2반환() {
        //given
        sut.append(4)
        sut.append(9)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 2)
    }
    
    // MARK:- tail tests
    func test_빈List에_tail요청하면_nil반환하는지() {
        //given
        guard sut.isEmpty else {
            return
        }
        //when
        let result = sut.tail
        //then
        XCTAssertNil(result)
    }
    func test_4추가한List에서_tail를요청하면_value4반환하는지() {
        //given
        sut.append(4)
        //when
        let result = sut.tail?.value
        //then
        XCTAssertEqual(result, 4)
    }
    func test_4와7추가한List에서_tail를요청하면_value7반환하는지() {
        //given
        sut.append(4)
        sut.append(7)
        //when
        let result = sut.tail?.value
        //then
        XCTAssertEqual(result, 7)
    }
}
