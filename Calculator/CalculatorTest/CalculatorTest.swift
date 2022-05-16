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
        let result = sut.enqueue(element: input)
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}
