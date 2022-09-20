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
    
    func test_queue에3을push했을때() {
        let element: String = "3"
        
        XCTAssertNoThrow(sutQueue.push(element))
    }
    
    func test_queue에3을push했을때queue의isEmpty가false인지() {
        let element: String = "3"
        
        sutQueue.push(element)
        
        XCTAssertFalse(sutQueue.isEmpty)
    }
    
    func test_queue에3_6_9를push했을때() {
        let elementArray: [String] = ["3", "6", "9"]
        
        for element in elementArray {
            sutQueue.push(element)
        }
        
        XCTAssertFalse(sutQueue.isEmpty)
    }
    
    func test_queue에3_6_9를push하고pop을한번했을때() {
        let elementArray: [String] = ["3", "6", "9"]
        
        for element in elementArray {
            sutQueue.push(element)
        }
        
        XCTAssertEqual(sutQueue.pop(), "3")
    }
    
    func test_queue에pop할요소가없을때() {
        XCTAssertEqual(sutQueue.pop(), nil)
    }
    
    func test_queue에3_6_9를push하고pop을네번했을때() {
        let elementArray: [String] = ["3", "6", "9"]
        
        for element in elementArray {
            sutQueue.push(element)
        }
        
        var result: String?
        for _ in 0...elementArray.count {
            result = sutQueue.pop()
        }
        
        XCTAssertEqual(result, nil)
    }
}
