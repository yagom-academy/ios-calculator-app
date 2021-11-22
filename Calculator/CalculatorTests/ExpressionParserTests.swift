

import XCTest

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse호출시_input이연산자1개숫자2개일때_모든Operator가정상적으로분리되는지() {
        // Given
        var input = "12+33"
        
        // When
        var result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 2)
        XCTAssertEqual(result.operators.count, 1)
        
        // Given
        input = "12−33"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 2)
        XCTAssertEqual(result.operators.count, 1)
        
        // Given
        input = "12×33"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 2)
        XCTAssertEqual(result.operators.count, 1)
        
        // Given
        input = "12÷33"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 2)
        XCTAssertEqual(result.operators.count, 1)
    }

    func test_parse호출시_input이연산자2개숫자3개일때_모든Operator가정상적으로분리되는지() {
        // Given
        var input = "12+33-33"
        
        // When
        var result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 3)
        XCTAssertEqual(result.operators.count, 2)
        
        // Given
        input = "12-33/33"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 3)
        XCTAssertEqual(result.operators.count, 2)
        
        // Given
        input = "12×33+33"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 3)
        XCTAssertEqual(result.operators.count, 2)
        
        // Given
        input = "12/33×33"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 3)
        XCTAssertEqual(result.operators.count, 2)
    }
    
    func test_parse호출시_input이연산자3개숫자4개일때_모든Operator가정상적으로분리되는지() {
        // Given
        var input = "12+33-33/13"
        
        // When
        var result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 4)
        XCTAssertEqual(result.operators.count, 3)
        
        // Given
        input = "12-33/33×492"
        
        // When
        result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 4)
        XCTAssertEqual(result.operators.count, 3)
    }
    
    func test_parse호출시_input이연산자4개숫자5개일때_모든Operator가정상적으로분리되는지() {
        // Given
        let input = "12+33-33/13×2322"
        
        // When
        let result = sut.parse(from: input)
        
        // Then
        XCTAssertEqual(result.operands.count, 5)
        XCTAssertEqual(result.operators.count, 4)
    }
}
