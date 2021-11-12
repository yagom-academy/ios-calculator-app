//
//  StringExtensionTests.swift
//  StringExtensionTests
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import XCTest

class StringExtensionTests: XCTestCase {
    var sut: String.Type!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = String.self
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
