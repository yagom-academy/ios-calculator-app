import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue() {
        sut.enqueue(item: NumberItem(20))
        let result = sut.items.count
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue_and_type_casting() {
        sut.enqueue(item: NumberItem(20))
        guard let result = sut.dequeue() as? NumberItem else {
            return
        }
        XCTAssertEqual(result, 20)
    }
}

extension CalculatorItemQueueTests {
    func test_node_init() {
        let node = Node(1)
        node.next = Node(2)
        XCTAssertEqual(node.next?.value, 2)
    }
    
    func test_node_deinit() {
        var node: Node? = Node(1)
        node?.next = Node(2)
        weak var result = node?.next
        node = nil
        XCTAssertNil(result)
    }
    
    func test_empty_LinkedList_init() {
        let list: LinkedList<Int> = LinkedList()
        XCTAssertTrue(list.isEmpty)
    }
}
