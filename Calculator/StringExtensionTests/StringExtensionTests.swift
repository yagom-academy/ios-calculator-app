//
//  StringExtensionTests.swift
//  StringExtensionTests
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {
    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = String()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
}
