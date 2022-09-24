enum ExpreesionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        var componentsResult: [String] = []
        var calculateData: String = ""
        
        input.forEach {
            if Operator.init(rawValue: $0) != nil {
                if calculateData == "" {
                    calculateData.append($0)
                } else {
                    componentsResult.append(calculateData)
                    componentsResult.append(String($0))
                    calculateData = ""
                }
            } else {
                calculateData.append($0)
            }
        }
        
        if calculateData != "" {
            componentsResult.append(calculateData)
        }
        
        return componentsResult
    }
}
