extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: " ").map { String($0) }
    }
}
