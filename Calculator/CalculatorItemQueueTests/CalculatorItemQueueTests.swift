import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue함수호출로_값을넣으면_enqueueStack에값이삽입되는함수() {
        // given
        let input: Array<Double> = [11]
        
        // when
        sut.enqueue(element: 11)
        
        // then
        XCTAssertEqual(input, sut.enqueueStack)
    }
    
    func test_처음Queue를생성하고_isEmpty를호출할경우_true를확인하는함수() {
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_모든값을dequeue하고_isEmpty를호출할경우_true를확인하는함수() {
        // given
        sut.enqueue(element: 9)
        sut.enqueue(element: 3)
        
        // when
        sut.dequeue()
        sut.dequeue()
        
        // them
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_clearQueue를호출해서값을다지우고_isEmpty를호출할경우_true를확인하는함수() {
        // given
        sut.enqueue(element: 4)
        sut.enqueue(element: 11)
        
        // when
        sut.clearQueue()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }

    func test_queue에요소가들어있는상태에서_isEmpty를호출할경우_false를확인하는함수() {
        // given
        
        // when
        sut.enqueue(element: 11)
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_dequeue호출시_Queue에값이존재한다면_값중에첫번째값을반환하는지_확인하는함수() {
        // given
        sut.enqueue(element: 9)
        sut.enqueue(element: 3)
        sut.enqueue(element: 4)
        sut.enqueue(element: 11)
        
        // when
        let result = sut.dequeue()
        let firstElement: Double = 9
        
        // then
        XCTAssertEqual(result, firstElement)
    }
    
    func test_dequeue호출시_Queue에값이존재하지않는다면_nil을반환하는지_확인하는함수() {
        // given
        sut.clearQueue()
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}

