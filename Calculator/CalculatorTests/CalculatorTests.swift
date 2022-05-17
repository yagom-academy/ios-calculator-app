//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이은찬 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Any>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_비어있을때isEmpty가트루인지확인() {
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
}
