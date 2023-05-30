//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by idinaloq on 2023/05/29.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_노드가없는경우_isEmpty가true인지() {
        let isEmpty = sut.isEmpty
        
        XCTAssertEqual(isEmpty, true)
    }
    
    func test_최초list에노드가없는경우_head에노드를추가하고_tail을head로설정하는지() {

        let input = 1

        sut.append(data: input)
        let headData = sut.headData
        let tailData = sut.tailData

        XCTAssertEqual(headData, 1)
        XCTAssertEqual(tailData, 1)
        
    }
    
    func test_list에노드가있는경우_head는유지하고_tail이_추가되었는지() {
        let firstinput = 1
        let secondinput = 2
        
        sut.append(data: firstinput)
        sut.append(data: secondinput)
        let headData = sut.headData
        let tailData = sut.tailData
        
        XCTAssertEqual(headData, 1)
        XCTAssertEqual(tailData, 2)
    }
}
