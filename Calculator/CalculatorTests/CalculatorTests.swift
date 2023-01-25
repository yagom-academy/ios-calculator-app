//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박소연 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - enqueue test code
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
    
    //MARK: - dequeue test code
    func test_data배열에_값이하나인상태에서_dequeue호출시_count는_0이다() {
        // given
        sut.data = [1]
        let expectation = 0
        
        // when
        sut.dequeue()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열에_값이하나인상태에서_dequeue호출시_빈배열을반환한다() {
        // given
        sut.data = [1]
        let expectation: [Int] = []
        
        // when
        sut.dequeue()
        let result = sut.data
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_값이없는상태에서_dequeue호출시_반환값은_nil이다() {
        // when
        let result = sut.dequeue()

        // then
        XCTAssertNil(result)
    }
    
    func test_data배열값이_여러개존재하는상태에서_dequeue호출시_첫번째로들어온값이_삭제된다(){
        // given
        sut.data = [11, 22, 33, 44]
        let expectation = 11
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - clearAll test code
    func test_clearAll호출시_data배열값이_모두삭제되어_count가0이다(){
        // given
        sut.data = [1, 2, 3, 4, 5]
        let expectation = 0
        // when
        sut.clearAll()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
