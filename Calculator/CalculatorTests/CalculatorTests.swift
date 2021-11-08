import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_큐에_1을_put하면_1이_남는다() {
        var queue = CalculatorItemQueue<Int>(itemQueue: [])
        queue.putToQueue(1)
        XCTAssertEqual(queue.itemQueue, [1])
    }
        
    func test_1이_있는_큐에_2를_put하면_1과_2가_남는다() {
        var queue = CalculatorItemQueue<Int>(itemQueue: [1])
        queue.putToQueue(2)
        XCTAssertEqual(queue.itemQueue, [1, 2])
    }
    
    func test_1만_있는_큐에_get을_하면_빈_큐가_된다() {
        var queue = CalculatorItemQueue<Int>(itemQueue: [1])
        queue.getFromQueue()
        XCTAssertEqual(queue.itemQueue, [])
    }
    
    func test_1과_2가_있는_큐에_get을_하면_1이_남는다() {
        var queue = CalculatorItemQueue<Int>(itemQueue: [1, 2])
        queue.getFromQueue()
        XCTAssertEqual(queue.itemQueue, [1])
    }

}
