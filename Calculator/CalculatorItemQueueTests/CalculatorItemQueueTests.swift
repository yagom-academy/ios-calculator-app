import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue = CalculatorItemQueue<Any>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test_enqueue_into_queue() {
        var queue = sut
        queue.enqueue(element: 1)
        XCTAssertEqual(queue.count, 1)
    }
    
    func test_enqueue_and_dequeue() {
        var queue = sut
        queue.enqueue(element: 1)
        
        XCTAssertEqual(queue.dequeue() as! Int, 1)
    }
    
    func test_count_change_after_peek() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.peek()
        XCTAssertEqual(queue.count, 1)
    }
    
    func test_count_change_after_clear() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.clear()
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_queue_is_Empty() {
        var queue = sut
        queue.enqueue(element: 1)
        queue.clear()
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    func test_queue_is_Full() {
        var queue = sut
        queue.capacity = 2
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        XCTAssertEqual(queue.isFull, true)
    }
    
    func test_set_queue_capacity() {
        var queue = sut
        queue.capacity = 5
        XCTAssertEqual(queue.capacity, 5)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
