import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    //MARK: - count
    func test_count호출시_dequeue호출전_enqueueList의개수가정상적으로반환되는지() {
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        let result = sut.count
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_count호출시_dequeue호출후_dequeueList의개수가정상적으로반환되는지() {
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        sut.dequeue()
        let result = sut.count
        //then
        XCTAssertEqual(result, 2)
    }
    //MARK: - enqueue()
    func test_enqueue호출시_정상적으로추가가되는지() {
        //given
        let input: Double = 2
        let input2: Double = 4
        let input3: Double = 7
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        //then
        XCTAssertEqual(sut.first, input)
        XCTAssertEqual(sut.last, input3)
        XCTAssertEqual(sut.count, 3)
    }
    //MARK: - dequeue()
    func test_dequeue호출시_FIFO가정상적으로진행되는지() {
        //given
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        
        let firstOut = sut.dequeue()
        let secondOut = sut.dequeue()
        let thirdOut = sut.dequeue()
        //then
        XCTAssertEqual(firstOut, input)
        XCTAssertEqual(secondOut, input2)
        XCTAssertEqual(thirdOut, input3)
    }
    
    func test_dequeue호출시_배열이비어있을때_nil을반환하는지() {
        //when
        let result = sut.dequeue()
        //then
        XCTAssertNil(result)
    }
    //MARK: - removeAll()
    func test_removeAll호출시_전부삭제되는지() {
        //given
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        let preCount = sut.count
        sut.removeAll()
        let result = sut.count
        //then
        XCTAssertEqual(preCount, 3)
        XCTAssertEqual(result, 0)
    }
}
