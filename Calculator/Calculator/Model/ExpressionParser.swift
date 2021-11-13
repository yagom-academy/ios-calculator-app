import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitedArray = self.replacingOccurrences(of: target.description, with: " ")
        return [splitedArray]
        
    }
}

enum ExpressionParser {
    //숫자 배열을 가지고 input에서 다시 연산자 거르는애 -> 형식에맞게 둘다 리턴
    static func parse(from input: String) -> [String] {
        //[1,2,3,4]
        let numberResultArray = componentsByOperators(from: input)
        
        //문자열 input를 배열로 변경: [1,+,2,-,3,/,4]
        var inputArray = input.map { String($0) }
        
        //배열을 숫자만있는배열을 이용해 숫자를제거해 연산자만 배열에담음
        inputArray = inputArray.filter {!numberResultArray.contains($0)}
        
        
        return inputArray
    }
    //숫자만 걸러서 리턴하는애
    static func componentsByOperators(from input: String) -> [String] {
        var numberResult = input
        
        Operator.allCases.forEach {
            guard let tempNumberResult = numberResult.split(with: $0.rawValue).first else {return}
            numberResult = tempNumberResult
        }
        
        let numberResultArray = numberResult.components(separatedBy: " ")
        
        return numberResultArray
    }
}
