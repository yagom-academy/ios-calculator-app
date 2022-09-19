//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Gundy on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue호출시_data가비어있는지() {
        let input = Int.random(in: 1...9)
        
        sut.enqueue(String(input))
        
        XCTAssertFalse(sut.data.isEmpty)
    }
    
    func test_enqueue호출시_3을전달하면_data의마지막값과같은지() {
        let input = 3
        sut.enqueue(String(input))
        
        let result = sut.data[sut.data.count-1]
        
        XCTAssertEqual(result, "3")
    }
    
    func test_enqueue반복호출시_data의마지막값과_전달값7이같은지() {
        for _ in 1...5 {
            sut.enqueue(String(Int.random(in: 0...9)))
        }
        let input = 7
        sut.enqueue(String(input))
        
        let result = sut.data[sut.data.count-1]
        
        XCTAssertEqual(result, "7")
    }
    
    func test_data가있을때_dequeue호출시_반환값이있는지() {
        sut.data = [String(Int.random(in: 0...9))]
        
        let result = sut.dequeue()
        
        XCTAssertNotNil(result)
    }
    
    func test_data가없을때_dequeue호출시_nil을반환하는지() {
        sut.data = []
        
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_data가있을때_dequeue호출시_data의카운트가감소하는지() {
        sut.data = [String(Int.random(in: 0...9))]
        let originCount: Int = sut.data.count
        
        let _ = sut.dequeue()
        let result = sut.data.count
        
        XCTAssert(result < originCount)
    }
    
    func test_data가있을때_peek호출시_반환값이있는지() {
        sut.data = [String(Int.random(in: 0...9))]
        
        let result = sut.peek()
        
        XCTAssertNotNil(result)
    }
    
    func test_data가없을때_peek호출시_nil을반환하는지() {
        sut.data = []
        
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_data가있을때_peek호출시_data의카운트가감소하는지() {
        sut.data = [String(Int.random(in: 0...9))]
        let originCount: Int = sut.data.count
        
        let _ = sut.dequeue()
        let result = sut.data.count
        
        XCTAssert(result < originCount)
    }
    
    func test_data가있을때_clear호출시_data가빈배열인지() {
        sut.data = [String(Int.random(in: 0...9))]
        sut.clear()
        
        let result = sut.data
        
        XCTAssert(result.isEmpty)
    }
    
    func test_data가있을때_count호출시_nil이아닌지() {
        sut.data = [String(Int.random(in: 0...9))]
        
        let result = sut.count
        
        XCTAssertNotNil(result)
    }
    
    func test_data의요소가5개일때_count호출시_5를반환하는지() {
        for _ in 1...5 {
            sut.enqueue(String(Int.random(in: 0...9)))
        }
        
        let result = sut.count
        
        XCTAssertEqual(result, 5)
    }
}
