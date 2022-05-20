enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let formula = Formula()
        
        return formula
    }
    
    private static func componentByOperators(from input: String) -> [String] {
       var doubledString: [[String]] = [[]]
       var result: [String] = [input]
        
        Operator.allCases.forEach { opr in
            result.forEach {
                doubledString.append($0.split(with: opr.rawValue))
                
            }
           result = doubledString.flatMap { $0 }
           doubledString.removeAll()
       }
        
        return result
    }
}
