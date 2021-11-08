import XCTest

@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func testSumCase() {
        var testQueue = CalculatorItemQueue()
        
        for iterator in (1...10) {
            testQueue.enqueue(Adder(value: Double(iterator)))
        }
        
        XCTAssertEqual(testQueue.calculate(), 55)
    }
    
    func testSubtractCase() {
        var testQueue = CalculatorItemQueue()
        
        for iterator in (1...10) {
            testQueue.enqueue(Subtractor(value: Double(iterator)))
        }
        
        XCTAssertEqual(testQueue.calculate(), -55)
    }
    
    func testMultiplyCase() {
        var testQueue = CalculatorItemQueue()
        
        testQueue.enqueue(Adder(value: 100))
        for iterator in (1...3) {
            testQueue.enqueue(Multiplier(value: Double(iterator)))
        }
        
        XCTAssertEqual(testQueue.calculate(), 600)
    }
    
    func testDivideCase() {
        var testQueue = CalculatorItemQueue()
        
        testQueue.enqueue(Adder(value: 60))
        for iterator in (1...3) {
            testQueue.enqueue(Divider(value: Double(iterator)))
        }
        
        XCTAssertEqual(testQueue.calculate(), 10)
    }
    
    func testClearCase() {
        var testQueue = CalculatorItemQueue()
        
        testQueue.enqueue(Adder(value: 10))
        testQueue.enqueue(Divider(value: 5))
        testQueue.enqueue(Multiplier(value: 20))
        testQueue.enqueue(Divider(value: 2))
        
        testQueue.allClear()
        
        XCTAssertEqual(testQueue.calculate(), 0)
    }
}
