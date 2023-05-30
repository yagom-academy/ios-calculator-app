//
//  CalculatorNodeTests.swift
//  CalculatorNodeTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorNodeTests: XCTestCase {
	var sut: Node<Any>!
	
    override func setUpWithError() throws {
        try super.setUpWithError()
		sut = Node<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
		sut = nil
    }
}
