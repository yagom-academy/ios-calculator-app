//
//  NodeTests.swift
//  MyCalculatorTests
//
//  Created by 이예은 on 2022/05/17.
//

import XCTest
@testable import Calculator

class NodeTests: XCTestCase {
    var sut: Node<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Node<Double>(0)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Node에_data를입력하면_값이_초기화가_잘된다() {
        let number = 3.0
        
        sut?.data = number
        let result = sut?.data
        
        XCTAssertEqual(result, 3)
    }
}
