import XCTest
@testable import Calculator

class CalculatorTest: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue_0을추가하면_배열에0이들어가는지(){
        //given
        let input = 0
        let expectation = [0]
        
        // when
        sut.enqueue(element: input)
        let result = sut.queue
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue_0과1을추가하면_0과1이들어간배열로변경하는지(){
        //given
        let firstTnput = 0
        let secondTnput = 1
        let expectation = [0, 1]
        
        // when
        sut.enqueue(element: firstTnput)
        sut.enqueue(element: secondTnput)
        let result = sut.queue
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}
