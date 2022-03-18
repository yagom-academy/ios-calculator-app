//
//  StringTests.swift
//  StringTests
//
//  Created by 김태현 on 2022/03/18.
//

import XCTest
@testable import Calculator

class StringTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_split() {
        let mockString = "123+4.0"
        
        let result = mockString.split(with: "+")
        
        XCTAssertEqual(result, ["123", "4.0"])
    }
}
