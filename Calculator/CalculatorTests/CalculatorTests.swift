//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이은찬 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: Queue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를안했을때_isEmpty가_참인지확인() {
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_enqueue했을때_isEmpty가_거짓인지확인() {
        sut.enqueue(1)
        let result = sut.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_Enqueue를여러번했을때_count값이_같은지확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(5)
        let result = sut.count
        XCTAssertEqual(result, 3)
    }
    
    func test_enqueue를여러번했을때_dequeue를하면_count가맞는지확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.dequeue()
        let result = sut.count
        XCTAssertEqual(result, 2)
    }
    
    func test_enqueue를여러번했을때_dequeue를하면_반환값이같은지확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let result = sut.dequeue()
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue를하지않았을때_dequeue를하면_nil이나오는지확인() {
        let a = sut.dequeue()
        XCTAssertEqual(nil, a)
    }
    
    func test_값이들어있을때_removeAll을하면_count가0인지확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.removeAll()
        let result = sut.count
        XCTAssertEqual(result, 0)
    }
    
    func test_값이들어있을때_removeAll을하면_isEmpty가참인지확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.removeAll()
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_값이들어있을때_dequeue로queue를비웠을때_count값과nil값이나오는지확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        var result = sut.firstValue
        XCTAssertEqual(result, 1)
        sut.dequeue()
        let result1 = sut.firstValue
        XCTAssertEqual(result1, 2)
        sut.dequeue()
        let result2 = sut.firstValue
        XCTAssertEqual(result2, nil)
        sut.enqueue(5)
        let result3 = sut.firstValue
        XCTAssertEqual(result3, 5)
        sut.dequeue()
        let result4 = sut.firstValue
        XCTAssertEqual(result4, nil)
        let result5 = sut.count
        XCTAssertEqual(result5, 0)
    }
}
