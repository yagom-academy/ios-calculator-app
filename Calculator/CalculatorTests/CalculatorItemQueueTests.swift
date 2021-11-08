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

}
