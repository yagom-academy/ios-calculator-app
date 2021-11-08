import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_큐에_1을_put하면_1이_남는다() {
        let queue = CalculatorItemQueue<Int>(head: nil)
        queue.putToQueue(1)
        XCTAssertEqual(queue.head?.value, Optional(1))
        XCTAssertNil(queue.head?.pointer)
    }
        
    func test_1이_있는_큐에_2를_put하면_1과_2가_남는다() {
        let queue = CalculatorItemQueue<Int>(head: Node(value: 1))
        queue.putToQueue(2)
        XCTAssertEqual(queue.head?.value, Optional(1))
        XCTAssertEqual(queue.head?.pointer?.value, Optional(2))
        XCTAssertNil(queue.head?.pointer?.pointer)
    }

    func test_1만_있는_큐에_get을_하면_빈_큐가_된다() {
        var queue = CalculatorItemQueue<Int>(head: Node(value: 1))
        queue.getFromQueue()
        XCTAssertNil(queue.head?.value)
    }

    func test_1과_2가_있는_큐에_get을_하면_2가_남는다() {
        var queue = CalculatorItemQueue<Int>(head: Node(value: 1, pointer: Node(value: 2)))
        queue.getFromQueue()
        XCTAssertEqual(queue.head?.value, Optional(2))
        XCTAssertNil(queue.head?.pointer)
    }

    func test_비어있는_큐에는_getFromQueue_함수를_쓰더라도_아무변화가_없다() {
        var queue = CalculatorItemQueue<Int>(head: nil)
        queue.getFromQueue()
        XCTAssertNil(queue.head?.value)
    }

}
