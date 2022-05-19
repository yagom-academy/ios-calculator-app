//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Gordon Choi on 2022/05/19.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    
}
