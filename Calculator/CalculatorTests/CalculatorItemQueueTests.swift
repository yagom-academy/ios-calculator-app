import XCTest

class CalculatorItemQueueTests: XCTestCase {
    func test_빈_큐에_1을_append하면_1이_남는다() {
        let linkedList = LinkedList<Double>(head: nil)
        linkedList.append(value: 1)
        XCTAssertEqual(linkedList.scanAllValue(), [1])
    }
}
