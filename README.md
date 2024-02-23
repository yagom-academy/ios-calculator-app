## 계산기 프로젝트 📱

### 0. 목차
- [1. 소개](#1-소개)
- [2. 팀원](#2-팀원)
- [3. UML](#3-uml)
- [4. 타임라인](#4-타임라인)
- [5. 실행 화면](#5-실행-화면)
- [6. 트러블 슈팅](#6-트러블-슈팅)
- [7. 팀 회고](#7-팀-회고)

### 1. 소개
- 계산기를 통해서 원하는 숫자 계산을 해보세요! 숫자 계산을 도와주는 계산기입니다. 
- 사용하는 계산기 화면의 숫자패드와 기호를 통해 연산식을 작성한 후 결과를 확인할 수 있습니다.

### 2. 팀원
| [Danny](https://github.com/dannykim1215) | [Gama](https://github.com/forseaest/forseaest) |
| --- | --- |
| <img src="https://avatars.githubusercontent.com/u/154333967?v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/96014314?v=4" width="200"> |

### 3. UML
## 시퀀스 다이어그램
![그림1](https://github.com/dannykim1215/ios-calculator-app/assets/154333967/a67aae78-70d1-43ad-a600-6b013920cf2f)

## 클래스다이어그램
![그림1](https://github.com/dannykim1215/ios-calculator-app/assets/154333967/29b5a471-2b2e-490f-ad1f-2164d9d0654e)


### 4. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.02.19(월) | 각자 작성한 계산기I 프로젝트 코드를 팀원에게 설명하는 소개하는 세션 |
| 24.02.20(화) 10:30 | CaculatorItemQueue 타입은 gama 코드 채택(Danny: 배열, gama: DoubleStack) |
| 24.02.20(화) 10:37 | Extension String 타입은 Danny 코드 채택(split 메소드 내부로직부분에서 공백을 기준으로 숫자와 연산자를 String으로 나눠 배열 요소 값으로 할당해서 String 배열로 반환) |
| 24.02.20(화) 10:50 | Operator 열거형 타입은 gama 코드 채택 |
| 24.02.20(화) 10:57 | Extension Double 타입, ExpressionParser 타입은 Danny 코드 채택 |
| 24.02.20(화) 11:04 | ExpressionParser 타입의 parse 메소드 내부의 for문 로직 변경(count-1로 반복문을 제어하는 것이 아닌 배열 데이터를 통해 반복이 되도록 변경)
| 24.02.20(화) 11:17 | Formula 타입은 Danny 코드 채택 |
| 24.02.20(화) 11:49 | CalculateError 열거형 타입 생성 및 케이스 추가, Formula 타입 내부의 result 메소드 내부 로직에 관련 에러 핸들링 진행 |
| 24.02.20(화) 11:55 | 계산기 프로젝트 Swift 파일 목적성에 맞게 폴더 정리 |
| 24.02.20(화) 12:04 | Fromula 타입 내부의 result 메소드 내부에 무한루프 while문 그리고 if문 -> while let 구문으로 변경 |
| 24.02.20(화) | CalculateError 열거형 타입의 케이스 세분화(emptyOperands, incorrectFormula), Formula 타입 내부의 result 메소드에 에러핸들링 진행 |
| 24.02.20(화) | CalculateItemQueue 유닛테스트 gama 코드로 채택 |
| 24.02.20(화) | Operator, Formula, ExpressionParser 유닛테스트 Danny 코드로 채택 |
| 24.02.20(화) | CalculaterItemQueue 내부에 큐 요소를 리턴하는 showQueue 메소드 생성, STEP1 PR 진행 |
| 24.02.21(수) | showQueue() 메소드를 저장프로퍼티로 변경후 Queue라는 네이밍으로 변경 |
| 24.02.21(수) | ExpressionParser 구조체의 parse() 함수에서 사용되는 변수명 변경 |
| 24.02.21(수) | CalculatorItemQueueTests 테스트 파일명과 클래스명 통일 |
| 24.02.21(수) | 유닛 테스트 파일에 개행 변경 및 given-when-then 패턴 주석 추가 |
| 24.02.21(수) | ViewController에 숫자, 사칙연산, 등호, AC 버튼을 눌렀을 때 호출하는 함수 구현 |
| 24.02.21(수) | Formula 유닛테스트 복잡한수식 케이스 추가 |
| 24.02.21(수) | ViewController 타입에 ceButtonTapped 메소드 기능 추가 |
| 24.02.21(수) | ViewConroller 타입에 signButtonTapped 메소드 기능 추가 |
| 24.02.21(수) | ViewController에 소수점 버튼 누를 때 호출하는 함수 dotButtonTapped() 구현 |
| 24.02.21(수) | FormulaTest 파일에 UnitTest 케이스 추가, STEP1 2차 PR 진행 |


### 5. 실행 화면
- 요구사항을 모두 충족하지는 못했으나, 리뷰어분과 상의 후 요구사항을 간략화하고 할 수 있는만큼 UI를 구현했습니다.

| <img src="https://cdn.discordapp.com/attachments/770882747580809258/1210479209986920488/Simulator_Screen_Recording_-_iPhone_15_Pro_Max_-_2024-02-23_at_15.46.57.gif?ex=65eab59d&is=65d8409d&hm=2379eb40f9ec90f7b4bd351cb697d8fb1211afd413ddaa4c464b7cf260335f3b&" width="290" height="640"> | <img src="https://cdn.discordapp.com/attachments/770882747580809258/1210482480579219487/Simulator_Screen_Recording_-_iPhone_15_Pro_Max_-_2024-02-23_at_16.04.41.gif?ex=65eab8a9&is=65d843a9&hm=799ab8172cac78934d937f51e9cd4a6269ec0aeac25165d7a9fb8e9b1c2ea89c&" width="290" height="640"> |
| --- | --- |
| 연산을 입력하고 =를 누르면 연산식이 뜹니다. | 연산을 입력하고 AC를 누르면 연산식이 모두 지워집니다. |
| <img src="https://cdn.discordapp.com/attachments/770882747580809258/1210483987835789372/Simulator_Screen_Recording_-_iPhone_15_Pro_Max_-_2024-02-23_at_16.10.48.gif?ex=65eaba10&is=65d84510&hm=3d39d54c2d41baf370bae6c15b0a21e8f0113de959d0732608200dec3c4ffa19&" width="290" height="640"> | <img src="https://cdn.discordapp.com/attachments/770882747580809258/1210486111298658324/Simulator_Screen_Recording_-_iPhone_15_Pro_Max_-_2024-02-23_at_16.19.19.gif?ex=65eabc0a&is=65d8470a&hm=e3fbe4047958beb7231a6b34c2ef3a952f7d9414308ac5b0d25e7efc4f709f23&" width="290" height="640"> |
| 소수점은 숫자당 1개씩만 쓸 수 있습니다. | +/- 버튼을 누르면 양수/음수를 설정할 수 있습니다. |


### 6. 트러블 슈팅
#### 1. Extension String 타입의 확장 메소드 로직 리팩토링 진행
- **[변경전]**
  - target 매개변수 Operators 데이터가 할당될 것이라고 생각했었기에 아래와 같이 코드 작성하였습니다. 
```Swift
extension String {
    func split(with target: Character) -> [String] {
        var splitString: [String] = []
        var splitOperands: String = ""

        for i in self {
            if i == target {
                splitString.append(String(i))
            } else {
                splitOperands.append(String(i))
            }
        }

        splitString.append(splitOperands)
            
        return splitString
    }
}
```
- **[변경후]**
  - target 매개변수가 " " 공백으로 정의를 하고 split 메소드 활용도를 이해하여 다음과 같이 변경하였습니다.
```Swift
func split(with target: Character) -> [String] {
        var splitString: [String] = []
        var splitOperandsAndOperators: String = ""
        
        for i in self {
            if i == target {
                splitString.append(splitOperandsAndOperators)
                splitOperandsAndOperators = ""
            } else {
                splitOperandsAndOperators.append(String(i))
            }
        }
        
        splitString.append(splitOperandsAndOperators)
            
        return splitString
    }
```
#### 2. Formula 구조체 타입의 result 메소드 내부 로직 중 while 무한반복문과 if 조건문 사용을 while let 구문으로 대체하면서 불필요한 코드 삭제 및 코드 가독성 증가
- **[변경전]**
	- Operands와 Operators 큐에 들어있는 내부 요소를 뽑아내는 로직을 무한루프 while문과 if 조건문을 사용하였습니다
```swift=
while operands.isEmpty == false {
	if operators.isEmpty == false {
		var elementOfOperators = operators.dequeue()
		valueOfResult = elementOfOperators?.calculate(lhs: valueOfResult, rhs: operands.dequeue() ?? Constant.zero) ?? Constant.zero
	} else {
		throw CalculatorError.overTheOperands
		guard let elementOfOperators = operators.dequeue() else {
			throw CalculatorError.unExpectedError
		}
		try valueOfResult = elementOfOperators.calculate(lhs: valueOfResult, rhs: operands.dequeue() ?? Constant.zero)
	}
}
```

- **[변경후]**
	- 해당 로직을 while let 구문으로 변경하였습니다.
```swift=
while let elementOfOperators = operators.pop(), let elementOfOperands = operands.pop() {
	if elementOfOperators == Operator.divide && elementOfOperands == 0 {
		throw CalculatorError.divideByZero
	}

	valueOfResult = elementOfOperators.calculate(lhs: valueOfResult, rhs: elementOfOperands)
}
```

### 7. 팀 회고
#### 우리팀이 잘한 점 😍
- Danny
  - 계산기 프로젝트 STEP PR 요청 및 개선하고자 하였습니다.
  - Error Handling을 사용해보고자 시도하였습니다.
  - UnitTest를 사용했습니다.
- Gama 🥷🏿
  - 계산기 1에서 한 코드를 합치기 위해, 각자 코드를 리뷰하면서 코드를 작성한 타당한 이유 등에 대해 팀원이 충분히 이해되도록 자세히 설명했다. 의사소통과 논의를 세세하고 활발하게 하면서 리팩토링도 동시에 진행할 수 있었고, 보다 수월하게 합칠 수 있었다.
  - 진행사항이 서로 다른만큼 코드를 각자 보완하면서 진행했다.

#### 우리팀 개선할 점 🥲
- Danny
  - 고차함수 사용을 못한 점은 아쉬운 부분으로 느껴집니다. 고차함수로 변경이 가능한 부분은 변경해보는 연습이 필요할 것 같습니다. 
  - 각각의 Step PR 일정이 계속 미뤄지고 있는 부분을 개선해야 할 부분인 것 같습니다.
  - STEP2에서 TDD 진행을 못 했던 부분은 아쉬운 부분입니다.
  - CalculatorItemQueue 타입 내부의 리스트 관련 로직을 구성해보는 경험도 필요할 것 같습니다. (Double Stack, LinkedList)
- Gama 🥷🏿
  - UI 작업이 미숙하여 요구사항을 모두 충족시키지 못했다. 다음 프로젝트 전까지 연마해야 하는 부분! 여러 상황에 대해서 대응하지 못하는 UI, ScrollView를 활용하지 못한 점 등이 아쉽다.
  - 에러 케이스들이 부족하다. 
