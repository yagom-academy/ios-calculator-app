//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김동용 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = CalculatorItemQueue(isEmpty: true)
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
        sut = nil
    }
    
    func test_() {
        //given
        
        //when
        
        //then
        
    }
}
