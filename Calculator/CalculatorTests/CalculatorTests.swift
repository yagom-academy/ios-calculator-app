//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박소연 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue호출시_isEmpty는_False이다() {
        // given
        let input = 1
        let expectation = false
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertFalse(expectation)
        
    }
    
    func test_enqueue호출시_count가증가된다() {
        // given
        let input = 1
        let expectation = 1
        
        // when
        sut.enqueue(input)
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_값이없는상태에서_dequeue호출시_반환값은_nil이다() {
        // when
        let result = sut.dequeue()

        // then
        XCTAssertNil(result)
    }
    
    func test_배열이존재하는상태에서_dequeue호출시_첫번째로들어온값이_삭제된다(){
        // given
        sut.data = [11, 22, 33, 44]
        let expectation = 11
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result as? Int, expectation)
    }
}
