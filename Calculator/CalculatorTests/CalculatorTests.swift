//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()

    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil

    }
    
    func test_not_enqueue_isEmpty_return_true() {
        // given
        

        // when
        let reselt = sut.isEmpty()

        // then
        XCTAssertTrue(reselt)
        
    }
    
    func test_once_enqueue_isEmpty_return_false() {
        // given
        sut.enqueue(0)

        // when
        let reselt = sut.isEmpty()

        // then
        XCTAssertFalse(reselt)
        
    }
    
    
    

    
}
