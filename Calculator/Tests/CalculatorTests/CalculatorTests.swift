//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김동욱 on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: Calculator?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func enQueue() {
    }
    
    func test_queue() {
        //given
        
        //when
        
        //then
    }
}
