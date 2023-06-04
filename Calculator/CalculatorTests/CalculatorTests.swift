//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by yyss99 on 2023/06/03.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가_비었을때_isEmpty가_true이다() {
        //given
        let expectation = true
        //when
        let result = sut.isEmpty
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue_실행시_isEmpty가_false이다() {
        //given
        let expectation = false
        //when
        sut.enqueue("3")
        let result = sut.isEmpty
        //then
        XCTAssertEqual(expectation, result)
    }



}
