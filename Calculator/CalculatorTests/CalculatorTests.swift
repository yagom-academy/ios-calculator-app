//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 유한석 on 2022/05/16.
//

import XCTest

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    //MARK: - CalculatorItemQueue
    func test_enqueue에1개_dequeue에2개_일때_큐의길이는3반환() {
        //given
        sut.enqueue = ["1"]
        sut.dequeue = ["2","3"]
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_queue에요소가없으면_0반환() {
        //given
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 0)
    }
}
