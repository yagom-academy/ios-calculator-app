import Foundation

extension String {
    //연산자 기준으로 나눈 String을 배열에 append해줌
    func split(with target: Character) -> [String] {
        let splitedArray = self.components(separatedBy: target.description)
        return splitedArray
    }
}

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula()
    }
    
    func componentsByOperators(from input: String) -> [String] {
        return ["aa"]
    }
}

