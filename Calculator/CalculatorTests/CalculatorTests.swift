import XCTest

class CalculatorTests: XCTestCase {
    func test_빈_큐에_1을_append하면_1이_남는다() {
        let queue = CalculatorItemQueue<Int>(head: nil)
        queue.append(value: 1)
        XCTAssertEqual(queue.scanAllValue(), [1])
    }
    
    func test_1이_있는_큐에_2를_append하면_1과2가_남는다() {
        let queue = CalculatorItemQueue<Int>(head: Node(value: 1))
        queue.append(value: 2)
        XCTAssertEqual(queue.scanAllValue(), [1, 2])
    }
    
    func test_1이_있는_큐를_removeFirst하면_빈_큐가되고_제거한값을_반환한다() {
        let queue = CalculatorItemQueue<Int>(head: Node(value: 1))
        let removedValue = queue.removeFirst()
        XCTAssertTrue(queue.scanAllValue().isEmpty)
        XCTAssertEqual(removedValue, 1)
    }

    func test_1과2가_있는_큐를_removeFirst하면_2가_남고_제거한값1을_반환한다() {
        let queue = CalculatorItemQueue<Int>(head: Node(value: 1, next: Node(value: 2)))
        let removedValue = queue.removeFirst()
        XCTAssertEqual(queue.scanAllValue(), [2])
        XCTAssertEqual(removedValue, 1)
    }
    
    func test_1과2와3이_있는_큐를_removeFirst하면_2와3이_남고_제거한값1을_반환한다() {
        let queue = CalculatorItemQueue<Int>(head: Node(value: 1, next: Node(value: 2, next: Node(value: 3))))
        let removedValue = queue.removeFirst()
        XCTAssertEqual(queue.scanAllValue(), [2, 3])
        XCTAssertEqual(removedValue, 1)
    }
}
