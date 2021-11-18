import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var queue: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        queue = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        queue = nil
    }
    
    func test_빈_큐에_1을_enqueue하면_1이_남는다() {
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.scanAllValues(), [1])
    }

    func test_빈_큐에_1과2를_enqueue하면_1과2가_남는다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        XCTAssertEqual(queue.scanAllValues(), [1, 2])
    }
    
    func test_빈_큐를_dequeue하면_그대로_빈_큐이고_Nil을_반환한다() {
        let removedValue = queue.dequeue()
        XCTAssertTrue(queue.scanAllValues().isEmpty)
        XCTAssertNil(removedValue)
    }

    func test_1이_있는_큐를_dequeue하면_빈_큐가되고_제거한값을_반환한다() {
        queue.enqueue(value: 1)
        let removedValue = queue.dequeue()
        XCTAssertTrue(queue.scanAllValues().isEmpty)
        XCTAssertEqual(removedValue, 1)
    }

    func test_1과2가_있는_큐를_dequeue하면_2가_남고_제거한값1을_반환한다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        let removedValue = queue.dequeue()
        XCTAssertEqual(queue.scanAllValues(), [2])
        XCTAssertEqual(removedValue, 1)
    }

    func test_1과2와3이_있는_큐를_dequeue하면_2와3이_남고_제거한값1을_반환한다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        let removedValue = queue.dequeue()
        XCTAssertEqual(queue.scanAllValues(), [2, 3])
        XCTAssertEqual(removedValue, 1)
    }

    func test_빈_큐를_scanAllValues하면_빈_배열을_반환한다() {
        XCTAssertTrue(queue.scanAllValues().isEmpty)
        XCTAssertEqual(queue.scanAllValues(), [])
    }

    func test_1이_있는_큐를_scanAllValues하면_1을_배열에_담아_반환한다() {
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.scanAllValues(), [1])
    }

    func test_1과2가_있는_큐를_scanAllValues하면_1과2를_배열에_담아_반환한다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        XCTAssertEqual(queue.scanAllValues(), [1, 2])
    }
    
    func test_1과2가_있는_큐를_allClear하면_빈_큐가된다() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.allClear()
        XCTAssertTrue(queue.scanAllValues().isEmpty)
    }
}
