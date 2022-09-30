## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

목차
1. [제목](#제목)
2. [소개](#소개)
3. [앱실행화면](#앱-실행-화면)
4. [타임라인](#타임라인)
5. [트러블 슈팅](#트러블-슈팅)
6. [참고 링크](#참고-링크)
 
# 제목
계산기
## 소개
계산기를 구현하는 프로젝트 입니다.
|![CCF2339F-606F-4EE9-97EC-88620DE7174A (1) (1)](https://user-images.githubusercontent.com/71054048/188081997-a9ac5789-ddd6-4682-abb1-90d2722cf998.jpg)|
|:---:|
|인호|

## 🗒 타임라인
시간 순으로 프로젝트의 주요 진행 척도를 표시
| 날짜 | 중요 진행 상황 | 코드 관련 사항
|---|---|---|
|9/20| `STEP1` 시작, 계산기에 필요한 리스트와 큐 구현 | 리스트 형식의 `CalculatorItemQueue`구현, 큐의 `enqueue`,`dequeue`,`removeAll`메서드와 `head`프로퍼티 구현, 리스트의 요소인`Node`타입 구현
|9/21| 추가 기능 및 코드 수정| `CalculatorItemQueue`에 `last`,`isEmpty`프로퍼티 추가, `removeAll`메서드 리팩토링
|9/22| `STEP2` 시작, UML을 바탕으로 타입 구성 | `Formula`, `ExpressionParser`,`Operator`타입 생성 및 내부 메서드 생성, `Extension` 구현
|9/23| 각 타입의 메서드 기능 수정 | `split`메서드 구현, `componentsByOperators`메서드 수정, 부호랑 연산자 구분하도록 수정
|9/27|`STEP2` 수정 및 테스트 케이스 추가 | 0으로 나눈 경우에 대한 에러 처리, `Formula`,`ExpressionParser`의 유닛 테스트 작성
|9/28|`STEP3` 시작 | 버튼과 레이블의 아웃렛 추가, 피연산자 누를때의 `CurrentEntry` 입력 구현, `CE`버튼 기능 구현, `부호변환`버튼 기능 구현


## 📱 앱 실행 화면

 추가 예정 
<!-- |:---:|
|입력이 0일때 |
 -->
## 트러블 슈팅
<!-- <details>
<summary id="Step1"><h4>Step1</h4></summary>
<div markdown="1">
#### 큐를 구현하는 방법

</div>
</details>
 -->
### 1️⃣ Step1
#### `CalculatorItemQueue` 구현 방법
계산기의 연산과정을 고민했을때, 단계적으로 계산을 할때마다 `dequeue`를 하게 될텐데, 해당 부분을 배열로 구현하면 매번 인덱스이 이동이 일어나야해서 리스트가 더 효율적일 것이라고 생각하여 단방향 연결 리스트를 이용했다.
(리스트를 공부하기 위함도 있었다.)

### 2️⃣ Step2
#### 계산기에서 전달받을 `input`
- 처음에는 입력이 `1+3-6*3%9-1`과 같이 전달될 것이라고 생각하고 프로젝트를 진행했는데, 다른 캠퍼들과 얘기하다 보니 부호 변환 부분이 문제였다. 기존의 코드대로면 부호를 변환기호도 음수 연산자로 분류되는 상황이었다.
- 어떻게 문제를 해결할까 고민하면서 계산기 앱의 구동 화면을 보고 입력이 `1 + 3 + -6 * 3 % -9 - 1`과 같이 연산자와 피연산자 사이에 공백이 있는 상태로 들어올 수 있겠다는 생각을 했고, 이를 기준으로 다시 작성했다.

#### `split(with target:) -> [String] `메서드
- UML에 작성되어 있던 위 메서드를 어떻게 해결할지 몰라 공백으로 남겨두었는데, 위에서 말한 입력의 공백을 지우는데 사용했다.
```swift
func split(with target: Character) -> [String] {
    let result = self.components(separatedBy: String(target))
    return result
}

let separatedInput = input.split(with: " ")
//1 + 3 + -6 * 3 % 9 -> [1, +, 3, +, -6, *, 3, %, 9]반환
```

#### `componentsByOperators(from input:) -> [String]`메서드의 역할
- 위 메서드이 역할이 가장 헷갈리는 부분이었다. 역할을 고려해서 연산자, 피연산자를 나누어서 하나의 배열로 리턴할까 하다가 네이밍과 맞지 않다고 생각했고,
네이밍으로 해석했을땐 처음에는 "Operators로 이루어진 요소들"이라고 해석하여 연산자를 리턴할까 하다가
최종적으로는 "Operators 옆에있는 요소들"이라는 해석이 적절하다고 판단했다. 입력받은 문자열을 보면 연산자 양옆에 피연산자들이 있는 구조이므로 근거있는 해석이라고 생각했다.
- 그래서 위 메서드는 숫자를 포함하고 있는 피연산자들을 배열로 리턴한다.
```swift
private static func componentsByOperators(from input: String) -> [String] {
    let separatedInput = input.split(with: " ")
    let components = separatedInput.filter({ $0.filter({ $0.isNumber }).count != 0 })
        
    return components
}
```
#### `parse(from input:) -> Formula`메서드의 역할
- `input`에서 연산자, 피연산자를 분리하여 `operandsInInput`,`operatorsInInput`에 담고, `forEach`를 이용하여 각 큐에 담는다.(`enqueue`)

#### `input`을 원하는 형태로 변경하는 방법
> 변수보다는 상수를, 반복문 조건문 보다는 고차함수를 더 활용하도록 노력해보세요.

- 과제의 요구사항대로 고차함수를 활용하려 고민했는데 `filter`메서드를 활용하고, `compactMap`함수를 이해하고 사용해봤다. 
```swift
let components = separatedInput.filter({ $0.filter({ $0.isNumber }).count != 0 })
let operandsInInput = componentsByOperators(from: input).compactMap { Double($0) }
```

### 3️⃣ Step3
#### `updateEntry()`메서드에서 두가지 조건을 확인하는 방법
- 함수를 종료하고 싶은 조건은 현재 입력이 `.(소수점)` 이면서 이전 입력이 소수점을 이미 포함하고 있는 상황이다. 
- 조건문을 이용한다면 `if input == "." && currentEntry.contains(".") { return }`과 같이 작성할 수 있는데, 빠른 탈출을 위해서 `guard`문을 이용하고자 했다.
```swift
func updateEntry(using input: String) {
    ...
    guard input != "." || !currentEntry.contains(input) else { return }
    ...
}
```
- `guard`문의 조건을 해석해 보면 `input`이 소수점이 아니거나, 현재 입력이 `input`을 포함하고 있지 않아야 하고, `else`로 걸리는 조건은 두가지 모두 `true`인 경우가 된다. (처음에는 `&&`연산자가 와야된다고 생각해서 헷갈렸다.)



## 참고 링크
추가 예정
