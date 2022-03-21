//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by DuDu on 2022/03/16.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>?

    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_초기화후_isEmpty가_true여야한다() {
        //given
        let sut = CalculatorItemQueue<Double>()
        
        //when, then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_초기화후_데이터를_enqueue하면_isEmpty가_false여야한다() {
        //given
        let sut = CalculatorItemQueue<Double>()
        sut.enqueue(1)
        
        //when, then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_초기화후_데이터들을_enqueue한후_dequeue를하면_가장먼저넣은_데이터가_나와야한다() {
        //given
        sut?.enqueue(1)
        sut?.enqueue(2)
        sut?.enqueue(3)
        
        //when, then
        XCTAssertEqual(sut?.dequeue(), 1)
    }
    
    func test_초기화후_데이터들을_enqueue한후_removeAll을하면_isEmpty가_true여야한다() {
        //given
        let sut = CalculatorItemQueue<Double>()
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.removeAll()
        
        //when, then
        XCTAssertTrue(sut.isEmpty)
    }
}
