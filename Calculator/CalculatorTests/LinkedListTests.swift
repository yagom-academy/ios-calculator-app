//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by redmango1446 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_first_append를_안하면_first는_nil을_가진다() {
        // given
        // when
        let result = sut.first
        
        // then
        XCTAssertNil(result)
    }
    
    func test_last_append를_안하면_last는_nil을_가진다() {
        // given
        
        // when
        let result = sut.last
        
        // then
        XCTAssertNil(result)
    }
    
    func test_count_append를_안하면_count는_0을_가진다() {
        // given
        // when
        let result = sut.count
        let expectedValue = 0
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_popFirst_1을_append한뒤_popFirst를_호출하면_1을_반환한다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.popFirst()
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_popFirst_1과_2를_append한뒤_popFirst를_2번_호출하면_2를_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        
        // when
        var result = sut.popFirst()
        result = sut.popFirst()
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_popFirst_1을_append한뒤_popFirst를_2번_호출하면_nil을_반환한다() {
        // given
        sut.append(1)
        
        // when
        var result = sut.popFirst()
        result = sut.popFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_isEmpty_head가_nil이면_isEmpty는_true값을_가진다() {
        // given
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_1을_append하면_isEmpty는_false값을_가진다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_first_1을_append하면_first는_1을_가진다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.first?.data
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_first_1과_2를_append하면_first는_1을_가진다() {
        // given
        sut.append(1)
        sut.append(2)
        
        // when
        let result = sut.first?.data
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_last_1을_append하면_last는_1을_가진다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.last?.data
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_last_1과_2를_append하면_last는_2를_가진다() {
        // given
        sut.append(1)
        sut.append(2)
        
        // when
        let result = sut.last?.data
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_first_1과_2를_append하고_popfirst를_하면_first는_2를_가진다() {
        // given
        sut.append(1)
        sut.append(2)
        _ = sut.popFirst()
        
        // when
        let result = sut.first?.data
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_count_1을_2번_append하면_count는_2를_가진다() {
        // given
        sut.append(1)
        sut.append(1)
        
        // when
        let result = sut.count
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_count_5를_2번_append하고_popfirst를_1번하면_count는_1을_가진다() {
        // given
        sut.append(5)
        sut.append(5)
        _ = sut.popFirst()
        // when
        let result = sut.count
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
}
