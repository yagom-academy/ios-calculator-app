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
        sut.enqueue(1)
        let expectation = 0
        
        // when
        sut.dequeue()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열에_값이없는상태에서_dequeue호출시_반환값은_nil이다() {
        // when
        let result = sut.dequeue()

        // then
        XCTAssertNil(result)
    }
    
    func test_data배열값이_여러개존재하는상태에서_dequeue호출시_첫번째로들어온값이_삭제된다() {
        // given
        for number in 11...15 {
            sut.enqueue(number)
        }
        let expectation = 11
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열_여러번dequeue실행시_first가_변경된다() {
        // given
        for number in 5...10 {
            sut.enqueue(number)
        }
        let expectation = 7

        // when
        sut.dequeue()
        sut.dequeue()
        let result = sut.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_data배열의count가40이상이고_퍼센트가25이상일시_배열의nil값을포함하여_dequeue한다() {
        // given
        for number in 1...40 {
            sut.enqueue(number)
        }
        let expectation = 11
        
        // when
        for number in 1...10 {
            sut.dequeue()
        }
        let result = sut.first
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - clearAll test code
    func test_clearAll호출시_data배열값이_모두삭제되어_count가0이다() {
        // given
        for number in 1...5 {
            sut.enqueue(number)
        }
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
        for number in 30...35 {
            sut.enqueue(number)
        }
        let expectation = 30
        
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
        for number in 14...19 {
            sut.enqueue(number)
        }
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
