
import XCTest
@testable import Calculator

private class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Double>!
    var testCase1: Double = Double.random(in: (0...100))
    var testCase2: Double = Double.random(in: (0...100))
    var testCase3: Double = Double.random(in: (0...100))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue([])
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_CalculatorItemQueue생성시_빈배열전달하면_isEmpty가true리턴() {
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_queue에_데이터가없고_enqueue를_했을때_enqueueStack에_들어가는지() {
        sut.enqueue(testCase1)
        let result = sut.enqueueStack[0]
        
        XCTAssertEqual(testCase1, result)
    }
    
    func test_queue에_데이터가있고_enqueue를_했을때_enqueueStack의_뒤로_들어가는지() {
        sut.enqueue(testCase1)
        sut.enqueue(testCase2)
        let result = sut.enqueueStack[1]
        
        XCTAssertEqual(testCase2, result)
    }
    
    func test_queue에_데이터가없고_dequeue를_했을떄_nil이_반환되는지() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
    
    
    func test_queue에_데이터가있고_dequeue를_했을때_데이터가_반환되는지() {
        sut.enqueue(testCase1)
        let result = sut.dequeue()
        
        XCTAssertEqual(testCase1, result)
    }

    func test_enqueue를_여러번하고_dequeue를_했을때_앞의_데이터가_반환되는지() {
        sut.enqueue(testCase1)
        sut.enqueue(testCase2)
        sut.enqueue(testCase3)
        let result = sut.dequeue()

        XCTAssertEqual(testCase1, result)
    }

    func test_queue에_데이터가있고_isEmpty를_했을때_true가_리턴되는지() {
        sut.enqueue(testCase1)
        sut.enqueue(testCase2)
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_queue에_데이터가없고_isEmpty를_했을때_false가_리턴되는지() {
        let result = sut.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_queue에_데이터가있고_removeAll을_했을때_queue가_비워지는지() {
        sut.enqueue(testCase1)
        sut.enqueue(testCase2)
        sut.enqueue(testCase3)
        
        sut.removeAll()
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
}
