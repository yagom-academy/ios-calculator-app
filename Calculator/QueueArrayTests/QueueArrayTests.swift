//
//  QueueArrayTests.swift
//  QueueArrayTests
//
//  Created by Gordon Choi on 2022/05/17.
//

import XCTest
@testable import Calculator

class QueueArrayTests: XCTestCase {
    var sut: QueueArray<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = QueueArray<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
}
