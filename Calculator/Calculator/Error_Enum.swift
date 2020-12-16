
enum CalculatorError: String, Error {
    case numStackisEmpty = "저장된 값이 없습니다."
    case operatorStackisEmpty = "연산자를 꺼낼 수 없습니다."
    case etc = "알 수 없는 에러입니다."
}
