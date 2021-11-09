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
}
