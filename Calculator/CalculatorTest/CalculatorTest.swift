import XCTest
@testable import Calculator

class CalculatorTest: XCTestCase {
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

    func test_enqueue_0을추가하면_배열에0이들어가는지() {
        // Given
        let input: Double = 0
        let expectation: [Double] = [0]
        
        // When
        doubleQueue.enqueue(element: input)
        let result = doubleQueue.calulatorItems
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue_0과1을추가하면_0과1이들어간배열로변경하는지() {
        // Given
        let firstInput: Double = 0
        let secondInput: Double = 1
        let expectation: [Double] = [0, 1]
        
        // When
        doubleQueue.enqueue(element: firstInput)
        doubleQueue.enqueue(element: secondInput)
        let result = doubleQueue.calulatorItems
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_첫번째요소가3일때_3을반환하는지() {
        // Given
        let currentQueue: [Double] = [3, 5]
        let expectation: Double = 3
        
        // When
        doubleQueue.enqueue(element: currentQueue[0])
        doubleQueue.enqueue(element: currentQueue[1])
        let result = doubleQueue.dequeue()
        
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
        doubleQueue.enqueue(element: currentQueue[0])
        doubleQueue.enqueue(element: currentQueue[1])
        var result = doubleQueue.dequeue()
        result = doubleQueue.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_연산자타입을반환하는지() {
        // Given
        let currentQueue: [Operator] = [.plus, .multiply]
        let expectation: Operator = .plus
        
        // When
        operatorQueue.enqueue(element: currentQueue[0])
        operatorQueue.enqueue(element: currentQueue[1])
        let result = operatorQueue.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}
