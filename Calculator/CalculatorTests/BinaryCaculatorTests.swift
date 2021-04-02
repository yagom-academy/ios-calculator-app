import XCTest

class BinaryCalculatorTests: XCTestCase {
    private var binaryCalculatorTest: BinaryCalculator?
    override func setUpWithError() throws {
        binaryCalculatorTest = BinaryCalculator()
    }
    
    override func tearDownWithError() throws {
        binaryCalculatorTest = nil
    }
    
    func test_add() {
        let result1 =  BinaryCalculator.add(firstNumber: "1010", secondNumber: "11")
        XCTAssertEqual(result1, "1101")
        
        // 음수를 더하여 0이 되는 case
        let result2 =  BinaryCalculator.add(firstNumber: "10", secondNumber: "11111110")
        XCTAssertEqual(result2, "0")
        
        // 음수를 덧셈할 경우 음수 결과가 8bit 이진수로 표현됨 (MSB가 Sign-Bit)
        let result3 =  BinaryCalculator.add(firstNumber: "10", secondNumber: "11111101")
        XCTAssertEqual(result3, "11111111")
        
        // 오버플로우 발생시 오버플로우 된 자릿수 버림
        let result4 =  BinaryCalculator.add(firstNumber: "11110000", secondNumber: "10001000")
        XCTAssertEqual(result4, "1111000")
        
        // 오버플로우 발생시
        
        let result5 =  BinaryCalculator.add(firstNumber: "01110000", secondNumber: "01001000")
        XCTAssertEqual(result5, "111000")
    }
    
    func test_subtract() {
        let result1 =  BinaryCalculator.subtract(firstNumber: "1010", secondNumber: "11")
        XCTAssertEqual(result1, "111")
        
        // 음수를 빼서 양수 결과가 나오는 경우
        let result2 =  BinaryCalculator.subtract(firstNumber: "10", secondNumber: "11111110")
        XCTAssertEqual(result2, "100")
        
        // 뺄셈의 결과가 음수인 경우
        let result3 =  BinaryCalculator.subtract(firstNumber: "10", secondNumber: "11")
        XCTAssertEqual(result3, "11111111")
        
        // 언더플로우 발생시 언더플로우 된 자릿수 버림
        let result4 =  BinaryCalculator.subtract(firstNumber: "10000001", secondNumber: "10")
        XCTAssertEqual(result4, "1111111")
    }
    
    func test_AND() {
        let result1 =  BinaryCalculator.AND(firstNumber: "0", secondNumber: "0")
        XCTAssertEqual(result1, "0")
        
        let result2 =  BinaryCalculator.AND(firstNumber: "0", secondNumber: "10")
        XCTAssertEqual(result2, "0")
        
        let result3 =  BinaryCalculator.AND(firstNumber: "10", secondNumber: "0")
        XCTAssertEqual(result3, "0")
        
        let result4 =  BinaryCalculator.AND(firstNumber: "11", secondNumber: "11111111")
        XCTAssertEqual(result4, "11")
    }
    
    func test_NAND() {
        let result1 =  BinaryCalculator.NAND(firstNumber: "0", secondNumber: "0")
        XCTAssertEqual(result1, "11111111")
        
        let result2 =  BinaryCalculator.NAND(firstNumber: "0", secondNumber: "10")
        XCTAssertEqual(result2, "11111111")
        
        let result3 =  BinaryCalculator.NAND(firstNumber: "10", secondNumber: "0")
        XCTAssertEqual(result3, "11111111")
        
        let result4 =  BinaryCalculator.NAND(firstNumber: "11", secondNumber: "11111111")
        XCTAssertEqual(result4, "11111100")
    }
    
    func test_OR() {
        let result1 =  BinaryCalculator.OR(firstNumber: "0", secondNumber: "0")
        XCTAssertEqual(result1, "0")
        
        let result2 =  BinaryCalculator.OR(firstNumber: "0", secondNumber: "10")
        XCTAssertEqual(result2, "10")
        
        let result3 =  BinaryCalculator.OR(firstNumber: "10", secondNumber: "0")
        XCTAssertEqual(result3, "10")
        
        let result4 =  BinaryCalculator.OR(firstNumber: "11", secondNumber: "11111111")
        XCTAssertEqual(result4, "11111111")
    }
    
    func test_NOR() {
        let result1 =  BinaryCalculator.NOR(firstNumber: "0", secondNumber: "0")
        XCTAssertEqual(result1, "11111111")
        
        let result2 =  BinaryCalculator.NOR(firstNumber: "0", secondNumber: "10")
        XCTAssertEqual(result2, "11111101")
        
        let result3 =  BinaryCalculator.NOR(firstNumber: "10", secondNumber: "0")
        XCTAssertEqual(result3, "11111101")
        
        let result4 =  BinaryCalculator.NOR(firstNumber: "11", secondNumber: "11111111")
        XCTAssertEqual(result4, "0")
    }
    
    func test_XOR() {
        let result1 =  BinaryCalculator.XOR(firstNumber: "0", secondNumber: "0")
        XCTAssertEqual(result1, "0")
        
        let result2 =  BinaryCalculator.XOR(firstNumber: "0", secondNumber: "10")
        XCTAssertEqual(result2, "10")
        
        let result3 =  BinaryCalculator.XOR(firstNumber: "10", secondNumber: "0")
        XCTAssertEqual(result3, "10")
        
        let result4 =  BinaryCalculator.XOR(firstNumber: "11", secondNumber: "11111111")
        XCTAssertEqual(result4, "11111100")
    }
    
    func test_NOT() {
        let result1 =  BinaryCalculator.NOT(firstNumber: "00000001")
        XCTAssertEqual(result1, "11111110")
        
        let result2 =  BinaryCalculator.NOT(firstNumber: "11001100")
        XCTAssertEqual(result2, "110011")
    }
    
    func test_shiftLeft() {
        let result1 =  BinaryCalculator.shiftLeft(firstNumber: "11", secondNumber: "10")
        XCTAssertEqual(result1, "1100")
        
        let result2 =  BinaryCalculator.shiftLeft(firstNumber: "10000000", secondNumber: "11")
        XCTAssertEqual(result2, "0")
        
        // secondNumber가 음수면 반대 방향으로 shift
        let result3 =  BinaryCalculator.shiftLeft(firstNumber: "1100", secondNumber: "111111110")
        XCTAssertEqual(result3, "110")
    }
    
    func test_shiftRight() {
        let result1 =  BinaryCalculator.shiftRight(firstNumber: "11", secondNumber: "10")
        XCTAssertEqual(result1, "0")
        
        let result2 =  BinaryCalculator.shiftRight(firstNumber: "10000000", secondNumber: "11")
        XCTAssertEqual(result2, "10000")
        
        // secondNumber가 음수면 반대 방향으로 shift
        let result3 =  BinaryCalculator.shiftRight(firstNumber: "1100", secondNumber: "111111110")
        XCTAssertEqual(result3, "11000")
    }
}
