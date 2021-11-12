extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    func hasOnlyNumberOrOperator() -> Bool {
        for character in self {
            if character.isNumber == false
                && ["+","-","/","*"].contains(character) == false {
                return false
            }
        }
        
        return true
    }
    
    func firstAndLastLetterAreNumbers() -> Bool {
        guard let firstLetter = self.first,
              let lastLetter = self.last else {
            return false
        }
        
        return firstLetter.isNumber && lastLetter.isNumber
    }
}
