//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: CalculatorItemQueue<Int>!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CalculatorItemQueue()
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
	}
}
