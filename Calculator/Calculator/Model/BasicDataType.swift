extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        var temporaryString: String = ""
        var splitResult: [String] = []
        
        self.forEach {
            if $0 != target {
                temporaryString.append($0)
            } else {
                splitResult.append(temporaryString)
                splitResult.append(String($0))
                temporaryString.removeAll()
            }
        }
        
        if !temporaryString.isEmpty {
            splitResult.append(temporaryString)
        }
        
        return splitResult
    }
}
