import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        //Operator의 연산자 함수들을 사용하여 계산결과 도출하기
        return 9
    }
}
