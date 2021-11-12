//
//  SplitTests.swift
//  CalculatorTests
//
//  Created by 임지성 on 2021/11/12.
//

import XCTest

class SplitTests: XCTestCase {
    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = String()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_split호출시_연산자1개피연산자2개가_Operator로_정상적으로분리되는지() {
        // Given
        sut = "1+1"
        
        //When
        var result = sut.split(with: "+")
        
        // Then
        XCTAssertEqual(result, ["1","1"])
        
        // Given
        sut = "1-1"
        
        //When
        result = sut.split(with: "-")
        
        // Then
        XCTAssertEqual(result, ["1","1"])
        
        // Given
        sut = "1×1"
        
        //When
        result = sut.split(with: "×")
        
        // Then
        XCTAssertEqual(result, ["1","1"])
        
        // Given
        sut = "1/1"
        
        //When
        result = sut.split(with: "/")
        
        // Then
        XCTAssertEqual(result, ["1","1"])
    }
    
    func test_split호출시_연산자2개피연산자3개가_Operator로_정상적으로분리되는지() {
        // Given
        sut = "1+2+3"
        
        //When
        var result = sut.split(with: "+")
        
        // Then
        XCTAssertEqual(result, ["1","2","3"])
        
        // Given
        sut = "1-2-3"
        
        //When
        result = sut.split(with: "-")
        
        // Then
        XCTAssertEqual(result, ["1","2","3"])
        
        // Given
        sut = "1×2×3"
        
        //When
        result = sut.split(with: "×")
        
        // Then
        XCTAssertEqual(result, ["1","2","3"])
        
        // Given
        sut = "1/2/3"
        
        //When
        result = sut.split(with: "/")
        
        // Then
        XCTAssertEqual(result, ["1","2","3"])
    }
    
    func test_split호출시_피연산자에소수점이있을때_연산자2개피연산자3개가_Operator로_정상적으로분리되는지() {
        // Given
        sut = "1.0+2.0+3.0"
        
        //When
        var result = sut.split(with: "+")
        
        // Then
        XCTAssertEqual(result, ["1.0","2.0","3.0"])
        
        // Given
        sut = "1.0-2.0-3.0"
        
        //When
        result = sut.split(with: "-")
        
        // Then
        XCTAssertEqual(result, ["1.0","2.0","3.0"])
        
        // Given
        sut = "1.0×2.0×3.0"
        
        //When
        result = sut.split(with: "×")
        
        // Then
        XCTAssertEqual(result, ["1.0","2.0","3.0"])
        
        // Given
        sut = "1.0/2.0/3.0"
        
        //When
        result = sut.split(with: "/")
        
        // Then
        XCTAssertEqual(result, ["1.0","2.0","3.0"])
    }
}
