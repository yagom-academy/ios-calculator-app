import Foundation

extension String {
    //연산자를 빈칸으로 바꾼 문자열을 배열에 담아서 리턴 -> 이걸 4번하면 되겠지
    func split(with target: Character) -> [String] {
        let splitedArray = self.replacingOccurrences(of: target.description, with: " ")
        return [splitedArray]
        
    }
}

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula()
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var numberResult = input
        
        Operator.allCases.forEach {
            guard let tempNumberResult = numberResult.split(with: $0.rawValue).first else {return}
            numberResult = tempNumberResult
        }
        return [numberResult]
    }
}
