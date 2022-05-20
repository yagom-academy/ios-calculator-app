extension String {
    func split(with target: Character) -> [String] {
        var element = ""
        var result: [String] = []
              
        guard self != "" else { return [""] }
        
        self.forEach {
            if $0 != target {
                element += String($0)
            } else {
                result.append(element)
                result.append(String($0))
                element = ""
            }
        }
            
        if element != "" {
            result.append(element)
        }
        
        return result
    }
}


