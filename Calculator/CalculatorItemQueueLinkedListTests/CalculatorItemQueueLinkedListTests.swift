//
//  CalculatorItemQueueLinkedListTests.swift
//  CalculatorItemQueueLinkedListTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueLinkedListTests: XCTestCase {
    var sut: CalculatorItemQueueLinkedList!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueueLinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
