import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var doubleQueue: CalculatorItemQueue<Double>!
    var operatorQueue: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        doubleQueue = CalculatorItemQueue()
        operatorQueue = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        doubleQueue = nil
        operatorQueue = nil
    }

    func test_enqueue_0을추가하면_0이들어가는지() {
        // Given
        let input: Double = 0
        let expectation: Double = 0
        
        // When
        doubleQueue.enqueue(input)
        let result = doubleQueue.lastValue
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue_0과1을추가하면_0과1이들어간배열로변경하는지() {
        // Given
        let firstInput: Double = 0
        let secondInput: Double = 1
        let expectation: Double = 1
        
        // When
        doubleQueue.enqueue(firstInput)
        doubleQueue.enqueue(secondInput)
        let result = doubleQueue.lastValue
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_빈배열일때_nil을반환하는지() {
        // When
        let result = doubleQueue.dequeue()
        
        // Then
        XCTAssertNil(result)
    }
    
    func test_dequeue_연속으로dequeue하면_두번째요소가반환되는지() {
        // Given
        let currentQueue: [Double] = [3, 5]
        let expectation: Double = 5
        
        // When
        doubleQueue.enqueue(currentQueue[0])
        doubleQueue.enqueue(currentQueue[1])
        var result = doubleQueue.dequeue()
        result = doubleQueue.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_연산자타입을반환하는지() {
        // Given
        let currentQueue: [Operator] = [.add, .multiply]
        let expectation: Operator = .add
        
        // When
        operatorQueue.enqueue(currentQueue[0])
        operatorQueue.enqueue(currentQueue[1])
        let result = operatorQueue.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_isEmpty_calulatorItems이비었을때_True를반환하는지() {
        // When
        let result = doubleQueue.isEmpty
        
        // Then
        XCTAssertTrue(result)
    }
    
    func test_enqueue_dequeue_넣고빼는것을반복했을경우() {
        // Given
        let input: [Double] = [3, 5, 1]
        let expectation: Double = 5
        
        // When
        doubleQueue.enqueue(input[0])
        doubleQueue.enqueue(input[1])
        _ = doubleQueue.dequeue()
        doubleQueue.enqueue(input[2])
        let result = doubleQueue.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}
