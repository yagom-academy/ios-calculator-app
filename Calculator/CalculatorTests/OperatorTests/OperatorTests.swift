//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 임지성 on 2021/11/11.
//

import XCTest

class OperatorTests: XCTestCase {
    var sut: Operator!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_calculate호출시_값을정상적으로반환하는지() {
        // Given
        let input = 0.0
        
        // When
        let result = sut.calculate(lhs: input, rhs: input)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_Operator를add로한후_calculate호출시_add가호출되어_반환값이있는지() {
        // Given
        sut = .add
        
        // When
        let result = sut.calculate(lhs: 0.0, rhs: 0.0)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_Operator를substract로한후_calculate호출시_substract가호출되어_반환값이있는지() {
        // Given
        sut = .substract
        
        // When
        let result = sut.calculate(lhs: 0.0, rhs: 0.0)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_Operator를multiply로한후_calculate호출시_multiply가호출되어_반환값이있는지() {
        // Given
        sut = .substract
        
        // When
        let result = sut.calculate(lhs: 0.0, rhs: 0.0)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_Operator를divide로한후_calculate호출시_divide가호출되어_반환값이있는지() {
        // Given
        sut = .divide
        
        // When
        let result = sut.calculate(lhs: 0.0, rhs: 0.0)
        
        // Then
        XCTAssertNotNil(result)
    }
}
