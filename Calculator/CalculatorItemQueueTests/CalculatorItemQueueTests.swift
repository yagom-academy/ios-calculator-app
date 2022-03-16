import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue = CalculatorItemQueue<Int>()

    func test_dequeue_value_is_equal_to_inserted_value() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        queue.enqueue(element: 3)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
    }
    
    func test_count_is_correct() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        queue.enqueue(element: 3)
        queue.enqueue(element: 4)
        queue.enqueue(element: 5)
        
        XCTAssertEqual(queue.count, 5)
    }
    
    func test_clear_method_is_working_well() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        queue.enqueue(element: 3)
        queue.enqueue(element: 4)
        queue.enqueue(element: 5)
        
        queue.clear()
        
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_peek_is_working_well() {
        var queue = sut
        queue.enqueue(element: 1)
        
        XCTAssertEqual(queue.peek(), 1)
        XCTAssertEqual(queue.count, 1)
    }
    
    func test_insert_is_working_well() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        queue.enqueue(element: 3)
        
        queue.insert(4, at: 1)
        
        XCTAssertEqual(queue.count, 4)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 4)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
    }
    
    func test_remove_is_working_well() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        queue.enqueue(element: 3)
        queue.enqueue(element: 4)
        queue.enqueue(element: 5)
        
        queue.removeAtIndex(3)
        
        XCTAssertEqual(queue.count, 4)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.dequeue(), 5)
    }
}
