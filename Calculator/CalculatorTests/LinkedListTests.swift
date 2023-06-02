//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by Whales on 2023/06/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_append함수호출시_list의node개수가_늘어나는지() {
        // given
        let expectation: Int = 3
        // when
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_append함수호출시_list가isEmpty상태이면_data값이_head와tail의data에_들어가는지() {
        // given
        let expectation: Int = 1
        // when
        sut.append(data: 1)
        // then
        XCTAssertEqual(sut.readHeadData(), expectation)
        XCTAssertEqual(sut.readTailData(), expectation)
    }
    
    func test_append함수호출시_전달인자가_tail의data로_들어가는지() {
        // given
        let expectation: Int = 3
        // when
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // then
        XCTAssertEqual(sut.readTailData(), expectation)
    }
    
    func test_insert함수호출시_list의node개수가_늘어나는지() {
        // given
        let expectation: Int = 3
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        sut.insert(data: 3, at: 1)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_insert함수호출시_at전달인자가0이면_head의data로_들어가는지() {
        // given
        let expectation: Int = 3
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        sut.insert(data: 3, at: 0)
        // then
        XCTAssertEqual(sut.readHeadData(), expectation)
    }
    
    func test_insert함수호출시_at전달인자값이_count이상이면_개수변동없는지() {
        // given
        let expectation: Int = 2
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        sut.insert(data: 3, at: 8)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_insert함수호출시_data전달인자값이_at전달인자_자리의data로_들어가는지() {
        // given
        let expectation: Int = 2
        sut.append(data: 1)
        sut.append(data: 2)
        // when
        sut.insert(data: 3, at: 1)
        // then
        XCTAssertEqual(sut.readTailData(), expectation)
    }
    
    func test_removeFirst함수호출시_head가_두번째node로_옮겨가는지() {
        // given
        let expectation: Int = 2
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        sut.removeFirst()
        // then
        XCTAssertEqual(sut.readHeadData(), expectation)
    }
    
    func test_removeLast함수호출시_tail이_직전node로_옮겨가는지() {
        // given
        let expectation: Int = 2
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        sut.removeLast()
        // then
        XCTAssertEqual(sut.readTailData(), expectation)
    }
    
    func test_delete함수호출시_list의node개수가_줄어드는지() {
        // given
        let expectation: Int = 2
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        sut.delete(at: 1)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_removeAll함수호출시_list의isEmpty가_true가되는지() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // when
        sut.removeAll()
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
