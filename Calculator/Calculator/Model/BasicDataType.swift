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
                temporaryString.removeAll()
            }
        }
        
        if !temporaryString.isEmpty {
            splitResult.append(temporaryString)
        }
        
        return splitResult.filter({!$0.isEmpty})
    }
}
