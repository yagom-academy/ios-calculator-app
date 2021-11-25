import XCTest

class CalculatorTests: XCTestCase {

    func test_빈_큐에_1을_put하면_1이_남는다() {
        let queue = CalculatorItemQueue<Int>()
        queue.insertToQueue(1)
        XCTAssertEqual(queue.linkedList.head?.nodeValue, 1)
        XCTAssertNil(queue.linkedList.head?.pointer)
    }

    func test_1이_있는_큐에_2를_put하면_1과_2가_남는다() {
        let queue = CalculatorItemQueue<Int>()
        queue.linkedList.head = Node(1)
        queue.insertToQueue(2)
        XCTAssertEqual(queue.linkedList.head?.nodeValue, 1)
        XCTAssertEqual(queue.linkedList.head?.pointer?.nodeValue, 2)
        XCTAssertNil(queue.linkedList.head?.pointer?.pointer)
    }

    func test_1만_있는_큐에_get을_하면_빈_큐가_된다() {
        let queue = CalculatorItemQueue<Int>()
        queue.linkedList.head = Node(1)
        try! queue.deleteFromQueue()
        XCTAssertNil(queue.linkedList.head?.nodeValue)
    }
    func test_1과_2가_있는_큐에_get을_하면_2가_남는다() {
        let queue = CalculatorItemQueue<Int>()
        queue.linkedList.head = Node(1)
        queue.linkedList.head?.pointer = Node(2)
        try! queue.deleteFromQueue()
        XCTAssertEqual(queue.linkedList.head?.nodeValue, 2)
        XCTAssertNil(queue.linkedList.head?.pointer)
    }
}
