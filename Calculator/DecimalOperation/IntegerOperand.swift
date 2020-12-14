class IntegerOperand: DecimalToken {
    let value: Int

    init(value: Int) {
        self.value = value
        super.init(priority: .low)
    }
}
