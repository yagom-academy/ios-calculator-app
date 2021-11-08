//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이아리 on 2021/11/08.
//

import XCTest

struct CalculatorItemQueue<T>: CalculateItem {
    private(set) var items = [T]()
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        }
        return items.removeFirst()
    }
    
    mutating func clear() {
        items.removeAll()
    }
}

class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue<String>()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_enqueue() {
        let input = "37"
        
        sut.enqueue(input)
        
        XCTAssertEqual(sut.items, ["37"])
    }
    
    func test_enqueue_여러개추가하기() {
        sut.enqueue("6")
        sut.enqueue("3.5")
        sut.enqueue("10.8")
        
        XCTAssertEqual(sut.items, ["6","3.5","10.8"])
    }
    
    func test_dequeue_빈큐를dequeue를하면_nil이나온다() {
        let result = sut.dequeue()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_dequeue_enqueue후dequeue하면_값이나온다() {
        sut.enqueue("23")
        let result = sut.dequeue()
        
        XCTAssertEqual(result, "23")
    }
    
    func test_clear() {
        sut.enqueue("45")
        sut.enqueue("54")
        sut.enqueue("2")
        
        sut.clear()
        
        XCTAssertEqual(true, sut.items.isEmpty)
    }

}
