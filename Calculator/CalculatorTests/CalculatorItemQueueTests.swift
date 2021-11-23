
import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var queue = CalculatorItemQueue<Double>()
        
    func test_enqueue호출시_배열에값이정상적으로들어가는지() {
        // Given
        let input = 2.0
        
        // When
        queue.enqueue(input)
        
        // Then
        let result = try? queue.dequeue()
        XCTAssertEqual(result, 2)
    }
    
    func test_enqueue를여러번호출시_배열이차례대로들어가는지() {
        // Given
        var input = 2.0
        
        // When
        queue.enqueue(input)
        
        // Given
        input = 3
        
        // When
        queue.enqueue(input)
        
        // Given
        input = 4
        
        // When
        queue.enqueue(input)
        
        // Given
        input = 5
        
        // When
        queue.enqueue(input)
        
        // Then
        var result = try? queue.dequeue()
        XCTAssertEqual(result, 2)
        
        result = try? queue.dequeue()
        XCTAssertEqual(result, 3)
        
        result = try? queue.dequeue()
        XCTAssertEqual(result, 4)
        
        result = try? queue.dequeue()
        XCTAssertEqual(result, 5)
    }
    
    func test_enqueue를호출해값을넣고_dequeue호출시_배열에값이정상적으로빠지는지() {
        // Given
        let input = 2.0
                
        // When
        queue.enqueue(input)
        try? queue.dequeue()
        
        // Then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_outbox가비어있을때_dequeue를호출하면reverse된inbox의첫번째요소가outbox에정상적으로저장되는지() {
        queue.enqueue(2)
        
        let result = try? queue.dequeue()
        
        XCTAssertEqual(result, 2)
    }
    
    func test_dequeue호출시_정상적으로첫번째요소가빠져나오는지() {
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        
        let result = try? queue.dequeue()
            
        XCTAssertEqual(result, 2)
    }
    
    func test_배열이비어있을떄_dequeue호출시_에러가반환되는지() {
        XCTAssertThrowsError(try queue.dequeue())
    }
    
    func test_outbox배열에값이있을때_첫번째요소를반환하는지() {
        queue.enqueue(2)
        queue.enqueue(3)
        try? queue.dequeue()
        
        let result = queue.front
        
        XCTAssertEqual(result, 3)
    }
    
    func test_inbox에값이있고_outbox배열이비어있을때False를반환하는지() {
        queue.enqueue(2)
        let result = queue.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_inbox에값이있고_outbox배열에도값이있을때False를반환하는지() {
        queue.enqueue(2)
        queue.enqueue(2)
        try? queue.dequeue()
        
        let result = queue.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_inbox와outbox둘다비어있을때_True를반환하는지() {
        let result = queue.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue호출후_dequeue호출시_outbox에정상적으로저장되는지() {
        queue.enqueue(2)
        queue.enqueue(2)
        try? queue.dequeue()
        
        XCTAssertEqual(queue.count, 1)
    }
    
    func test_clear호출시_두배열모두초기화되는지() {
        queue.enqueue(2)
        
        queue.clear()
        
        XCTAssertTrue(queue.isEmpty)
    }
}
