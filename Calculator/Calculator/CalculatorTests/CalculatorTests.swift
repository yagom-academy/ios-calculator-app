//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 노유빈 on 2022/09/19.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
