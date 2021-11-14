//
//  AddOperatorTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/14.
//

import XCTest
@testable import Calculator

class AddOperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Operator(rawValue: "+")
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
