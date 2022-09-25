//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

enum ExpressionParser {
    // 입력한 수식 전체를 받아서 Formula로 리턴해줌
    // Formula는 피연산자 큐랑 연산자 큐로 구성되어 있음
    // 수식 전체를 -> 피연산자 / 연산자로 구분해서 Formula에 넣어준다
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        
        // input = "1+23+2"
        // ["1", "23", "2"] -> $0를 다 Double로 형변환
        // ["+", "+"] -> init(rawValue)해서 Operator로
        var strArr = componentsByOperators(from: input)
        strArr.forEach {
            guard let number = Double($0) else { return }
            formula.operands.enqueue(item: number)
        }
        
        let operators = Operator.allCases.map { $0.rawValue }
        let operatorQueue = input.map { $0 }.filter { operators.contains($0) }
        operatorQueue.forEach {
            guard let operatorSign = Operator(rawValue: $0) else { return }
            formula.operators.enqueue(item: operatorSign)
        }

        return formula
    }
    
    // 연산자로 나눈다! -> 숫자String들로만 구성된 배열을 반환할것임
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        // split을 기호별로 4번 돌리지 않고도, "1" "+" "2" "-" "3" 형태로 따로 넣어줄 방법은 없을까??? ㄹㅇ?? 없는거같음...
        // 1 + 2 - 3 + 4
        // "1", "2 - 3", "4"
        
        
        // filter를 쓴다면??
        let operators = Operator.allCases.map { $0.rawValue }
        for i in 0..<4 {
            result.forEach {
                result = $0.split(with: operators[i]).flatMap { $0 }
            }
        }
        
        // "11" -> "1" "1"
//        let arr = input.split(with: " ") // [String]
//        result = arr.filter {
//
//            operators.contains($0)
//        }
        
        
        return result
    }
}
