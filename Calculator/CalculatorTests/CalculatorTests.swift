

import XCTest

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>(head: Node(data: "0", pointer: nil))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_헤드가_비었는지() {
        let boolean = sut.isEmpty
        
        XCTAssertFalse(boolean)
    }
    
    func test_0만_있는_노드에_1추가() {
        sut.enqueue(in: "1")
        XCTAssertEqual(sut.head?.pointer?.data, Optional("1"))
    }
    
    func test_LinkedList의_새로운_노드_추가() {
        sut.enqueue(in: "2")
        XCTAssertEqual(sut.head?.pointer?.data, Optional("2"))
    }
    func test_첫번째_노드를_Dequeue() {
        sut.dequeue()
        XCTAssertNil(sut.head?.pointer)
    }
    func test_Head만_있는_노드에_하나추가_후_dequeue() {
        sut.enqueue(in: "1")
        XCTAssertNil(sut.head?.pointer?.pointer)
    }
    func test_1과2가_있는_노드에서_dequeue하면_2가남는다() {
        sut = CalculatorItemQueue(head: Node(data: "1", pointer: Node(data: "2", pointer: nil)))
        sut.dequeue()
        XCTAssertEqual(sut.head?.data, Optional("2"))
        XCTAssertNil(sut.head?.pointer)
    }
}
