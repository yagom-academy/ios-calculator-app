//
//  OperatorTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/17.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Operator가add이고calculate할때_결과값이예상값과같아야한다() {
        
    }
}
