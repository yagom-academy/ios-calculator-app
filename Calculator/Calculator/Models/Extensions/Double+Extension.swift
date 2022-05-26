extension Double: CalculateItem {
    func removeTrailingZero() -> String {
        return String(format: "%.20g", self)
    }
}
