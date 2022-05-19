import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    // MARK: Setting
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: Test_result()
    func test_operands와_operators의_값을_하나씩_가져올_있는지() {
        // given
        // when
        // then
    }
}
