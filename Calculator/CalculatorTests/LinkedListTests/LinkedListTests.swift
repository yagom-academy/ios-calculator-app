//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Dasan on 2023/05/30.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<CalculateItem>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_first_조건없이_first를호출할때_first는_nil이다() {
        // given, when
        let result = sut.first
        
        // then
        XCTAssertNil(result)
    }
    
    func test_first_초기화로_head에_data_1를넣고_first를호출하면_first는_1이다() {
        // given
        sut = LinkedList(head: Node(data: 1))
        let expectation = 1.0
        
        //when
        let result = sut.first as! Double
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_last_조건없이_last를호출할때_last는_nil이다() {
        // given, when
        let result = sut.last
        
        // then
        XCTAssertNil(result)
    }
    
    func test_last_초기화로_head에_data_1를넣고_last를호출하면_last는_1이다() {
        // given
        sut = LinkedList(head: Node(data: 1))
        let expectation = 1.0
        
        //when
        let result = sut.last as! Double
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_append_노드가없을때_append_1을하면_first와last값이_1로_같다() {
        // given
        sut.append(1)
        
        //when
        let firstResult = sut.first as! Double
        let lastResult = sut.last as! Double
        
        // then
        XCTAssertEqual(firstResult, lastResult)
    }
    
    func test_append_append_1_2_3을하면_first값은_1이다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        let expectation = 1.0
        
        //when
        let result = sut.first as! Double
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_append_append_1_2_3을하면_last값은_3이다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        let expectation = 3.0
        
        //when
        let result = sut.last as! Double
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeFirst_append_1을하고_removeFirst를하면_first와last는_nil이다() {
        // given
        sut.append(1)
        
        // when
        let _ = sut.removeFirst()
        
        // then
        XCTAssertNil(sut.first)
        XCTAssertNil(sut.last)
    }
    
    func test_removeFirst_append_1_2_3을하고_removeFirst를하면_first값은_2가된다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        let _ = sut.removeFirst()
        let expectation = 2.0
        
        // when
        let result = sut.first as! Double
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
}
