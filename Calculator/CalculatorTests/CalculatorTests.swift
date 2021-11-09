//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/08.
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
    
    func testDeleteItemFailedWhenQueueIsEmpty() {
        let result = sut.delete()
        let isFail = (result == nil)
        XCTAssertTrue(isFail)
    }
    
    func testInsertAndDeleteItemSucceeded() {
        let item = 6
        sut.insert(item)
        let deleteResult = sut.delete()
        let isDeleteSuccess = (deleteResult == item)
        XCTAssertTrue(isDeleteSuccess)
    }

}
