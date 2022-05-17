//
//  CalculatorList.swift
//  CalculatorTests
//
//  Created by 유한석 on 2022/05/17.
//

import XCTest

class CalculatorListTests: XCTestCase {
    var sut: CalculatorList<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
// MARK: - 
}
