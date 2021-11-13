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
    
    func test_enqueue_Int() {
        sut.enqueue(20)
        let result = sut.items.count
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue_Double() {
        sut.enqueue(20.0)
        let result = sut.items.count
        XCTAssertEqual(result, 1)
    }
    
    func test_dequeue_빈배열() {
        let result = sut.dequeue()
        XCTAssertNil(result)
    }
    
    func test_dequeue_and_type_casting() {
        sut.enqueue(20)
        guard let result = sut.dequeue() as? Double else {
            return
        }
        XCTAssertEqual(result, 20)
    }
}

extension CalculatorItemQueueTests {
    func test_empty_LinkedList_init() {
        let list: LinkedList<Int> = LinkedList()
        XCTAssertTrue(list.isEmpty)
    }
    
    func test_empty_LinkedList_makeArray() {
        let list: LinkedList<Int> = LinkedList()
        let result = list.makeArray()
        XCTAssertEqual(result, [])
    }
    
    func test_LinkedList_count_2() {
        var list = LinkedList(value: 1)
        list.append(2)
        let count = list.count
        XCTAssertEqual(count, 2)
    }
    
    func test_LinkedList_append_빈_리스트_생성후_append_두번하고_배열과_비교() {
        var list: LinkedList<Int> = LinkedList()
        list.append(1)
        list.append(2)
        let result: [Int] = list.makeArray()
        XCTAssertEqual(result, [1, 2])
    }
    
    func test_LinkedList_append_빈_리스트_생성후_removeFirst() {
        var list: LinkedList<Int> = LinkedList()
        let result = list.removeFirst()
        XCTAssertNil(result)
    }
    
    func test_LinkedList_append_값이_1개인_리스트_생성후_removeFirst() {
        var list: LinkedList<Int> = LinkedList(value: 1)
        let result = list.removeFirst()
        XCTAssertEqual(result, 1)
    }
}
