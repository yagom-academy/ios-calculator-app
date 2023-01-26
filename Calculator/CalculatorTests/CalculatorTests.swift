//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 무리 on 2023/01/24.
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
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
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
    
    func test_data배열에_값이하나인상태에서_dequeue호출시_data배열은_빈배열이된다() {
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
    
    func test_data배열값이_여러개존재하는상태에서_dequeue호출시_첫번째로들어온값이_삭제된다() {
        // given
        sut.data = [11, 22, 33, 44]
        let expectation = 11
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열_dequeue실행시_first의인덱스를가르키는_head의값이증가한다() {
        // given
        sut.data = [2, 3, 4, 1, 6, 7, 8, 0]
        let expectation = 2

        // when
        sut.dequeue()
        sut.dequeue()
        let result = sut.head
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열의count가40이상이고_퍼센트가25이상일시_배열의nil값을포함하여_dequeue한다() {
        // given
        for number in 1...40 {
            sut.enqueue(number)
        }
        
        // when
        for number in 1...10 {
            sut.dequeue()
        }
        
        // then
        print(sut.data)
    }
    
    //MARK: - clearAll test code
    func test_clearAll호출시_data배열값이_모두삭제되어_count가0이다() {
        // given
        sut.data = [1, 2, 3, 4, 5]
        let expectation = 0
        
        // when
        sut.clearAll()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - first, last test code
    func test_data배열의첫번째값과_first변수의값이_같다() {
        // given
        sut.data = [94, 1, 17]
        let expectation = 94
        
        // when
        let result = sut.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열값이없을때_first는nil을반환한다() {
        // when
        let result = sut.first
        
        // then
        XCTAssertNil(result)
    }
    
    func test_data배열의마지막값과_last변수의값이_같다() {
        // given
        sut.data = [92, 5, 19]
        let expectation = 19
        
        // when
        let result = sut.last
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열값이없을때_last는nil을반환한다() {
        // when
        let result = sut.last
        
        // then
        XCTAssertNil(result)
    }
}
