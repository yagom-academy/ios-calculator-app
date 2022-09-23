//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 써니쿠키 on 2022/09/19.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Double>!

    override func setUpWithError() throws {
        try super .setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super .tearDownWithError()
        sut = nil
    }
    
    func test_초기화후에_리스트는비어있다() {
        //given: setUpWithError메서드에서 초기화로 리스트가 비어있을 때
        //when, then: 리스트는 비어있다.
        XCTAssertTrue(sut.isEmpty())
    }

    func test_append_리스트가비어있을때_1추가시_마지막값_1() {
        //given: setUpWithError메서드에서 초기화로 리스트가 비어있을 때
        //when: 1 추가시
        sut.append(2.0)

        //then: 1이 마지막값으로 추가된다.
        let lastDate = sut.last?.data
        XCTAssertEqual(2.0, lastDate)
        
        //의도한 fail test
        XCTAssertNotEqual(4.0, lastDate)
    }

    func test_append_리스트가비어있지않을때_3추가시_마지막값_3() {
        //given: 1,2가 담겨있을 때
        sut.append(1.0)
        sut.append(2.0)

        //when: 3 추가 시
        sut.append(3.0)

        //then: 3이 마지막값으로 추가된다.
        let lastDate = sut.last?.data
        XCTAssertEqual(3.0, lastDate)
        
        //의도한 fail test
        XCTAssertNotEqual(2.0, lastDate)
    }
    
    func test_last_리스트가비어있을때_nil() {
        //given: setUpWithError메서드에서 초기화로 리스트가 비어있을 때
        //when,then: last는 nil이다
        XCTAssertNil(sut.last)
    }

    func test_last_리스트에1_2_3이담겨있을때_3() {
        //given: 1,2,3이 담겨있을 때
        sut.append(1.0)
        sut.append(2.0)
        sut.append(3.0)

        //when, then: last는 3이다
        let lastDate = sut.last?.data
        XCTAssertEqual(3.0, lastDate)
        
        //의도한 fail test
        XCTAssertNotEqual(2.0, lastDate)
    }

    func test_removeLast_리스트가비어있을때_반환값nil() {
        //given: setUpWithError메서드에서 초기화로 리스트가 비어있을 때
        //when, then: nil을 반환한다.
        XCTAssertNil(sut.removeLast())
    }

    func test_removeLast_리스트에_1_2_3이담겨있을때_제거되고_반환되는값_3() {
        //given: 1,2,3이 담겨있을 때
        sut.append(1.0)
        sut.append(2.0)
        sut.append(3.0)

        //when: 마지막을 지워줄 시
        let lastNode = sut.removeLast()

        //then: 제거되고 반환되는 값은 3이다
        XCTAssertNotEqual(3.0, sut.last?.data)
        XCTAssertEqual(3.0, lastNode?.data)
        
        //의도한 fail test
        XCTAssertNotEqual(2.0, lastNode?.data)
    }

    func test_removeFirst_리스트가비어있을때_반환값nil() {
        //given setUpWithError메서드에서 초기화로 리스트가 비어있을 때
        //when, then nil을 반환한다.
        XCTAssertNil(sut.removeFirst())
    }

    func test_removeFirst_리스트에_1_2_3이담겨있을때_제거되고_반환되는값_1() {
        //given 1,2,3이 담겨있을 때
        sut.append(1.0)
        sut.append(2.0)
        sut.append(3.0)

        //when 1을 지우면
        let firstNode = sut.removeFirst()

        //then: 제거되고 반환되는 값은 1이다
        XCTAssertNotEqual(1.0, sut.head?.data)
        XCTAssertEqual(1.0, firstNode?.data)
        
        //의도한 fail test
        XCTAssertNotEqual(2.0, firstNode?.data)
    }
}
