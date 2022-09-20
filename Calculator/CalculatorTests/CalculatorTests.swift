//  CalculatorTests.swift
//  Created by zhilly on 2022/09/20.

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sutQueue: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutQueue = CalculatorItemQueue<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutQueue = nil
    }
    
    func test_비어있는_String타입queue생성이가능할때() {
        XCTAssertTrue(sutQueue.isEmpty)
    }
    
    func test_비어있는_Double타입queue생성이가능할때() {
        let queue = CalculatorItemQueue<Double>()
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_비어있는_Int타입queue생성이가능할때() {
        let queue = CalculatorItemQueue<Int>()
        
        XCTAssertTrue(queue.isEmpty)
    }
}
