

import XCTest

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>(head: Node(data: "0", pointer: nil))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

//    func test_빈_노드에_헤드추가() {
//        sut.enqueue("1")
//        XCTAssertEqual(head.value, ["1"])
//    }
    
    func test_헤드가_비었는지() {
        var boolean: Bool = sut.hasEmpty(head: nil)
        
        XCTAssertTrue(boolean)
    }
}
