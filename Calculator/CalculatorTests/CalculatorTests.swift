//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박소연 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
