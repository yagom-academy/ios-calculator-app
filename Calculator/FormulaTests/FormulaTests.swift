import XCTest

final class FormulaTests: XCTestCase {
    
    var sut: Formula!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
