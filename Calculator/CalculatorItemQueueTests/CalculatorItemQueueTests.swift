//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: MockCalculatorItemQueue<Int>!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		let dummyLinkedList = DummyLinkedList<Int>()
		sut = MockCalculatorItemQueue(dummyList: dummyLinkedList)
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
	}
}
