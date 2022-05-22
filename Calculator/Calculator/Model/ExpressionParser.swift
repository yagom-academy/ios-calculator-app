enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        // Filter 사용
        return Formula()
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let operatorSybols = Operator.allCases.map { $0.rawValue
        }
        var count = 0
        
        let items = input.reduce([String]()) { (result, element) -> [String] in
            if operatorSybols.contains(element) && count > 1 {
                let joinedResult = [result.joined()]
                count = 0
                return joinedResult + [String(element)]
            }

            count += 1
            return result + [String(element)]
        }

        return items
    }
}
