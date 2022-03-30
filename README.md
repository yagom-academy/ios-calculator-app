# 🧮 iOS-calculator-app

> 📅 프로젝트 기간 2022.03.14 ~</br>
🎓 팀원 : [@mmim](https://github.com/JoSH0318) / 👑 리뷰어 : [@엘림](https://github.com/lina0322)

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [UML](#uml)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 3](#step-3)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
    
## 프로젝트 소개 및 기능


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
![ic_Step2_class_diagram](https://user-images.githubusercontent.com/88810018/158505149-f94c95e5-610d-44dd-9814-ffa31814ddba.jpeg)

## [STEP 1]
### 🤔고민한점
- 고민한점 ❓ / 트러블슈팅 ❗️
#### 1️⃣ Queue(Linked Queue vs Double Stack Queue)
- ❓swift는 Queue 형태의 저장 구조를 지원하지 않는다. 따라서 Queue 구현에 있어 고민을 했다. 
- ❓이번 프로젝트에 필요한 기능은 1) 마지막 값에 값을 추가, 2) 첫번째 값을 시간복잡도 O(1)인 제거, 이 두가지로 판단된다.
- ❓첫번째 고려한 방법으로 Linked List를 이용한 Linked Queue: 배열에 노드를 할당함으로써 그 위치를 파악하고 추가/삭제를 해주는 방식이다. 노드에는 값과 그다음 노드의 노드 값이 있다. 하지만 이번 프로젝트는 배열의 마지막에 값추가 + 배열의 첫번째 값을 제거 해주는 Queue의 기능만 필요하다. 따라서 약간의 불필요한 코드가 발생한다 생각했고, 적합하지 않다고 생각했다. 만약 이번 프로젝트에 중간 값을 넣거나 제거해야하는 기능이 필요하다면 적합했을 것 같다.
- ❓두번째 고려한 방법으로 Double Stack을 이용한 Queue: 두개의 stack을 만들어주어 마지막에 값을 넣을 때는 정방향 배열에 삽입, 첫번째 값을 제거할 때는 reverse를 이용하여 역방향 배열을 만들어주고 그것의 마지막 값을 반환한다. reverse 메서드의 시간복잡도가 O(1)이기 때문에 가능한 방법이다.
- ❗️이러한 근거로 Double Stack을 사용한 Queue를 사용하였다.

#### 2️⃣ 접근제어
- ❓처음에는 `var inputStack: [Element]`, `var outputStack: [Element]`만 존재했다. 문제는 테스트할 때 생겼다. 올바른 값이 있는지를 확인하기 위해 배열에 subscript 문법으로 접근했다.
- ❓하지만 private한 두 변수에 접근할 수 없었다. 생각해보니 값이 이 후에 프로젝트를 진행함에 있어 첫번째값과 마지막값의 조건(숫자인가, 연산자인가)에 따라 동작이 나뉠수도 있을 거라는 생각이 들었고, 또한 배열에 직접 접근하는 것이 접근제어에 있어 옳은 방향이 아니라고 판단했다. 
- ❗️array의 first, last, isEmpty, count method와 같은 기능을 만들어서 내부적으로 배열의 상태를 확인해주는 코드를 추가했다.
- ❗️test 코드에서 직접 배열에 접근하지 않고, first, last, isEmpty, count를 이용하여 값을 확인했다.

---
### 📝배운개념
- Queue
- Linked List
- Linked Queue
- Double Stack
- protocol

---
## [STEP 2]
### 🤔고민한점
- ❗️ -> 트러블슈팅 
> ✉️ 엘림과 나눈 이야기의 연장선에서 생각해봤습니다. 의식의 흐름대로...작성했습니다.
#### 1️⃣ split method in extension String
> 일단, 왜 `split(with target: Character) -> [String]`인가에 대해 생각해봤다.
- String 타입 내부에 이미 구현되어 있는 split 메서드가 있다.
- 때문에 `someString.split()`과 같은 문법으로 접근할 것이다.
- 헷갈릴 여지가 있기 때문에 분명 내부 구현을 split 메서드로 할 것이라 예상했다.
    - 하지만 `component` 메서드는 `CharacterSet`을 파라미터로, `[String]`을 반환
    - `CharacterSet`을 받기 때문에 `Character` 타입도 받을 수 있다.
    - ❗️ 따라서 `component` 메서드를 사용하는 것이 효율적일 것이다.
- 그렇다면 왜 `Character` 타입을 파마미터로 받을까?
- 연산자 기준으로 배열을 나눈다면 `Operator`가 가진 4가지 연산자를 모두 받을 수 있는 `CharacterSet`이 더 어울릴텐데...
    - ❗️ 아마 연산자 기준이 아닌 단 하나의 기준이 되는 어떠한 `Character`가 있을 것이다 예상

![](https://i.imgur.com/elLGT8P.png)
- 동작 설명 예시를 보면 연산자와 숫자가 공백으로 나뉜 것을 볼 수 있다.
- ❗️ 만약 버튼을 누를 때마다 값 뒤에 공백이 존재한다면 공백(" ")으로 연산자와 피연산자를 나눌 수 있을 것이라 판단했다.

#### 2️⃣ enum ExpressionParser 구현
- `enum ExpressionParser`를 보면 `String`을 파라미터로 갖기 때문에 viewConroller에서 `String` 값을 던져줄 것이라 예상할 수 있었다.
![](https://i.imgur.com/y91JyUU.png)
- 예시의 `inputString` 값은 "1 + 2 x -2 "이다.
- 위와 같은 예시 형태로 각 Label의 값을 합하여 `String`으로 던져줄 것이라 예상했다.
- `func componentsByOperators(from input: String) -> [String]`에서 반환 타입은 `[String]`이다.
- 나는 지금 피연사자와 연산자들 모두 배열에 순서대로 담길 원한다.
- ❗️ 앞의 상황을 종합적으로 생각해본다면 공백을 기준으로 피연사자와 연산자를 배열에 담는 과정이구나 판단했다.
- ❗️ `parse` 메서드에서는 피연산자, 연산자 배열을 Queue에 타입에 맞춰 enqueue하는 과정이 있겠다고 판단하였고, 엘림이 네이밍이 이것보다 정확할 수 없다고 말한 부분을 완벽히 이해했다.

#### 3️⃣ 연속적인 고차함수의 사용
- 여러번의 고차함수를 사용함으로써 상수가 늘어나고 코드가 길어지는 상황이 생겼다.
- 그러다보니 의미없는 또는 의미가 명확하지 않은 이름의 상수를 사용하게됐다. 
![](https://i.imgur.com/ljdv9oZ.png)
- ❗️ 연속으로 사용해보자.
![](https://i.imgur.com/8qEiHqh.png)
- 모호한 이름을 가진 상수가 사라지니 오히려 가독성이 높아지고 코드가 간결해졌다.

#### 4️⃣ 에러 처리를 위한 NaN(Not A Number) 사용
- UML에 리턴값이 명확히 나와있기 때문에 그에 맞춰 코드를 작성해야한다.
- throws를 사용하거나 optional한 리턴값을 줄 수가 없어 예외처리를 고민해봤다.(의미없는 0과 같은 수를 리턴해버릴 수는 없었다. 🥸)
- 예를 들어 이번 프로젝트에는 0으로 나누려는 경우 문제가 발생하기 때문에 특별한 처리가 필요하다.
- 구동 예시에 나와있는 NaN을 근거로 찾아보았다.

- Double, Float과 같은 FloatingPoint(부동소수점)타입과 같은 경우, 특정 숫자를 나타내는 것 이외에도 숫자가 아닌 값을 가지고있다. -> Infinity, NaN
- ❓ nan을 리턴하기 때문에 아래와 같은 방법으로 테스트해봤지만 에러가 발생한다.
- 같은 nan인데 비교가 안되는 것을 볼 수 있다.
 ![](https://i.imgur.com/g8bYMbp.png)
 ![](https://i.imgur.com/HF3l5Q5.png)
- ❗️ `isNaN` 를 사용하면 비교할 수 있다
 ![](https://i.imgur.com/5qynQ7T.png)
- ❗️ 이 후에 viewController에서도 이를 통해 Label에 적절한 결과를 나타낼 수 있을 것으로 예상한다.

### 📝배운개념
- FloatingPoint, Infinity, NaN, isNaN
- map, compactMap, flatMap
- Enum, static method
- while문
- extension
- protocol
---

## [STEP 3]
### 🤔고민한점
- 고민한점 ❓ / 트러블슈팅 ❗️
#### 1️⃣ stack view의 코드 구현
- ❓입력하는 카운트에 따라 stack view의 수가 정해지기 때문에 스토리보드에 구현할 수 없다.
- ❗️코드로 stack view를 추가해줘야한다고 판단했다.
- 예시로 받은 프로젝트의 기본값을 힌트로 scrollView > stackView > stackView > label2개 형태로 구현하기로 했다.
- ❗️먼저 입력되는 연산자와 피연산자 label의 특성을 설정해주었다. 그리고 그 label을 subStackView에 추가한다. addArrangedSubview 메서드를 사용!
- ❗️그 subStackView를 superStackView에 다시 추가하는 방법으로 구현했다. 마찬가지로 addArrangedSubview 메서드 사용!

#### 2️⃣ scroll view의 구현
- ❓scroll view는 기준점이 top에 있고 이번 프로젝트와는 반대의 움직임이다.
- 따라서 기준점을 내가 원하는 아랫쪽에 위치하도록 변경해야한다.
- ❗️setContentOffset(:animated:)를 이용하면 contents view의 기준점을 바꿀수 있다.
![](https://i.imgur.com/igiAAB1.png)
- contentOffset을 `CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)` 설정해줬다. 
- bounds는 scrollView의 안에 생성되는 view의 고유 좌표계이다. 따라서 좌표가 아닌  `bounds.size.height`로 접근해야했다.
- ❓이렇게 설정을 하고 해당 메서드를 호출했지만 바로바로 업데이트 되지 않고 subStackView가 뒤늦게 올라가는 오류가 생겼다.
- ❗️view는 실시간으로 업데이트 되지 않기 때문에 `layoutIfNeeded()`을 통해 layout을 즉시 업데이트할 수 있도록 해야한다. 

#### 3️⃣ NumberFormatter
- ❓정수 3자리마다 ,를 출력해야된다. 또한 의미없는 0000을 제거한 상태로 수를 기록에 등록해야한다.
- ❗️`NumberFormatter`를 사용해야한다 판단했다.
- ❗️`numberStyle`을 `.decimal`로 설정해주는 것을 통해 해당 문제를 해결할 수 있었다.
- 또한, `roundingMode`과 `maximumFractionDigits`를 통해 반올림과 소수점자릿수 문제를 해결
- ❓이 과정에서 `maximumSignificantDigits`에 대한 오해가 생겼다. 최대 자릿수를 설정해주는 것으로 오해했고, 몇가지 실험을 통해 유효수의 최대값을 설정하는 메서드라는 것을 알게 됐다. 

#### 4️⃣ 소수점 이후 출력 문제
- ❓만약 1이라는 버튼을 4번 클릭하게 된다면 `1,111`처럼 `,`을 포함한 형태가 실시간으로 출력되어야한다.
- ❓따라서 `NumberFormatter`를 거쳐서 Label에 출력해야한다.
- ❓하지만 마지막 입력으로 `.` 을 입력하게 된다면 `NumberFormatter`에 `111.`과 같은 수가 들어가고 `111`이 출력되게된다. 따라서 `.`을 누름과 동시에 Label에는 `.`이 없는 `111`과 같은 형태가 출력된다. 내가 원하는 값은 `111.` 이 그래도 출력되는 것이다.
- ❓또한 `111.0`도 `111` 출력된다.
- ❗️`.`을 기준으로 두 개 요소로 배열에 담고, 정수만 `NumberFormatter`를 거치게하고 소수점 이후는 거치지 않는 형태로 label에 출력하도록 했다.

#### 5️⃣ 수많은 예외와 오류 케이스...
- ❓가장 많은 시간을 소요한 고민이었다. 생각할 경우의 수가 너무 많았고, 테스트할 수록 생각하지 못했던 경우가 계속 생겨나서 어떻게 처리해야하나 고민을 많이 했다.
- ❓예외처리를 할 수록 코드가 길어지고 때로는 쓸모없어진 코드가 발생하기도 했으며, 로직이 꼬여 오류가 발생하는 경우가 빈번했다.

#### 6️⃣ 함수 분리와 컨벤션
- ❓코드가 길어지면서 메서드의 크기?역할?이 커졌다. 한 가지 메서드에서 여러가지 일을 하는 경우가 많아졌고 분리를 해줘야했다. 솔직히 아직까지 어떤 방법 또는 기준으로 분리해줘야하는지 확실하지 않고 계속 고민 중이다.
- ❓컨벤션의 핵심은 가독성이다. 어떠한 코드가 가독성이 좋은지에 대해 고민했다. 프로퍼티/메서드 이름, 들여쓰기, 공백, 파일 분리 등 이전 프로젝트보다 더 많은 고민을 할 수 있었고, 조금씩 발전해가는 것을 느꼈다. 

### 📝배운개념
- FloatingPoint
- NumberFomatter
- Decimal
- ScrollerView
- StackView
- AutoLayOut
- 고차함수

---
## 기술의 장단점

---
## commit 규칙
> 커밋 제목은 최대 50자 입력
> 본문은 한 줄 최대 72자 입력

### **Commit 제목 규칙**
- ✅[chore]: 코드 수정, 내부 파일 수정
- ✨[feat]: 새로운 기능 구현
- 📐[style]: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- ➕[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- 🔨[fix]: 버그, 오류 해결
- ⚰️[del]: 쓸모없는 코드 삭제
- 📝[docs]: README나 WIKI 등의 문서 개정
- 💄[mod]: storyboard 파일,UI 수정한 경우
- ✏️[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- 🚚[move]: 프로젝트 내 파일이나 코드의 이동
- ⏪️[rename]: 파일 이름 변경이 있을 때 사용합니다.
- ⚡️[improve]: 향상이 있을 때 사용합니다.
- ♻️[refactor]: 전면 수정이 있을 때 사용합니다
- 🔀[merge]: 다른브렌치를 merge 할 때 사용합니다.

### **Commit Body 규칙**
- 제목 끝에 마침표(.) 금지
- 한글로 작성

### **브랜치 이름 규칙**
ex) 5_mmim90, STEP2, STEP3, STEP2-dev 

