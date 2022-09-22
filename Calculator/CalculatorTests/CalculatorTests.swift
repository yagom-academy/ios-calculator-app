//  CalculatorTests.swift
//  Created by zhilly on 2022/09/20.

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_비어있는_String타입queue생성이가능할때() {
        XCTAssertTrue(sut.isEmpty)
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
        
        XCTAssertNoThrow(sut.push(element))
    }
    
    func test_queue에3을push했을때queue의isEmpty가false인지() {
        let element: String = "3"
        
        sut.push(element)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에3_6_9를push했을때() {
        let elementArray: [String] = ["3", "6", "9"]
        
        for element in elementArray {
            sut.push(element)
        }
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에3_6_9를push하고pop을한번했을때() {
        let elementArray: [String] = ["3", "6", "9"]
        
        for element in elementArray {
            sut.push(element)
        }
        
        XCTAssertEqual(sut.pop(), "3")
    }
    
    func test_queue에pop할요소가없을때() {
        XCTAssertNil(sut.pop())
    }
    
    func test_queue에3_6_9를push하고pop을네번했을때() {
        let elementArray: [String] = ["3", "6", "9"]
        
        for element in elementArray {
            sut.push(element)
        }
        
        var result: String?
        for _ in 0...elementArray.count {
            result = sut.pop()
        }
        
        XCTAssertEqual(result, nil)
    }
    
    func test_queue에1_2_3_4_5를push했을때count값이5인지() {
        let elementArray: [String] = ["1", "2", "3", "4", "5"]
        
        for element in elementArray {
            sut.push(element)
        }
        let result = sut.count
    
        XCTAssertEqual(result, 5)
    }
    
    func test_queue가비어있을때count가0인지() {
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
}
