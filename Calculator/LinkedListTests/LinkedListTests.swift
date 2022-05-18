import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var doubleList: LinkedList<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        doubleList = LinkedList<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        doubleList = nil
    }
    
    func test_isEmpty_아무노드를넣지않았을때_True를반환하는지() {
        // when
        let result = doubleList.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
