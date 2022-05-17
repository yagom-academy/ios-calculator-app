import XCTest

class CalculatorItemQueueTDD: XCTestCase {
    // TODO: First in first out 형태의 자료구조인 'Queue'를 만들기
    var intQueue: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        intQueue = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        intQueue = nil
    }
    
    // MARK: - First in fisrt out Tests

    

}
