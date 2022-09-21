//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by dragon on 2022/09/21.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Any>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
