//
//  CalculatorItemLinkedListTests.swift
//  CalculatorItemLinkedListTests
//
//  Created by 이태영 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemLinkedListTests: XCTestCase {
    var sut: CalculatorItemLinkedList!

    override func setUpWithError() throws {
        sut = CalculatorItemLinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}
