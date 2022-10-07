# 계산기2

## 1. ✏️ 프로젝트 소개

두 명이 UML기반으로 각각 계산기의 코드를 구현한 후 통합해 본 계산기입니다.

-  사칙연산 (+, -, ÷, X)이 가능합니다.
-  연산자 우선순위는 무시합니다.
-  계산결과는 Double타입을 사용합니다.


---

## 2. 🤝 팀원 

| SunnyCookie |   Stone    |
| ----------- | ---------- |
| <img width="180" src="https://i.imgur.com/z4FjnKX.png"> | <img width="180px" src="https://avatars.githubusercontent.com/u/74972815?v=4"> |

---

## 3. 🔍 프로젝트 구성과 실행예시
- Class Diagram
<img width = 1000, src = "https://i.imgur.com/lnjKDxO.png">


| 정상 연산 | 연산 후 `=` 버튼 비활성화 | 0이하 소숫점 | 
| ----- | ----- | ----- | 
| ![](https://i.imgur.com/HcKP2Ca.gif)|![](https://i.imgur.com/o9kiG5I.gif)|![](https://i.imgur.com/eFLcU9M.gif)| 
| **AC버튼** | **CE 버튼** |**연산후 CE버튼**| 
|![](https://i.imgur.com/dd4uQx3.gif)|![](https://i.imgur.com/77wappw.gif)|![](https://i.imgur.com/a4Zn4Eg.gif)| 
| **0일때 0,00입력**|**0으로 나눴을시 NaN**|**0일때 연산자 변경**| 
|![](https://i.imgur.com/tFlsrTM.gif)|![](https://i.imgur.com/23EMmdK.gif)|![](https://i.imgur.com/sPOSMCD.gif)| 

---

 
## 4. ⚒️ 구현 내용 - 코드 합치기

☑️ **Queue에 이용되는 자료구조 선택 (Array 와 LinkedList)**
 - 스톤이 구현한 array는 Head를 옮겨주는 방식으로 array의 오버헤드의 단점을 보완했었기 때문에 LinkedList와 사이에서 어떤 방식을 채택할까 고민했습니다.
 - Step2에서 핵심경험으로 '제네릭을 활용하여 범용적인 타입 구현'이 선택사항으로 있어서 제네릭타입인 Node와 Linked List를 채택했습니다

☑️ **`componentsByOperator()` 를 이용한 String을 쪼갠 return값**
 - 써니쿠키는 이 메서드를 이용해 계산식이 숫자만 걸러서 나오도록, 예를들어 "1+245x67" -> ["1", "245", "67"] 이 나오도도록 구현했고,
    스톤은 띄어쓰기를 기준으로 split하여 숫자와 연산자를 모두 구분해주는, 예를들어 "1 + 245 x 67" -> ["1", "+", "245", "X", "67"] 이 나오도록 구현한 컨셉이 둘이 달랐고, 스톤의 컨셉을 채택했습니다.
 - 이유는 extension String에서 구현한 `split()` 의 사용이 더 깔끔했고, `componentsByOperator()`메서드가 사용되는 `parse()`와 연관지어 생각했을때 숫자와 연산자를 모두 구분지어주는 것이 `componentsByOperator()`메서드의 역할에 더 알맞다고 생각했습니다.

☑️ **Formula구조체의 `result()` 계산 방법**
 - 써니쿠키는 '1+245x67' 을 계산 할 때, ViewController에서 제일 앞에 +를 추가해주도록 처리해 +1+245x67으로 계산되게 했었고, 스톤은 '1+245x67'식을 그대로 받아 계산할 수 있었습니다. ViewController에서 추가적인 처리해주지 않을 수 있는 스톤 방식을 채택했습니다.

☑️ **ViewController에서 함수 기능분리 여부**
 - 스톤은 메서드의 여러곳에서 반복 사용하는 부분을 하나의 메서드로 만들어 반복사용했었습니다. 재사용하는 부분은 함수로 구현해놓는게 맞다고 판단되어 `resetInputNumber()`,`resetOperatorLabel()`,`resetRawFormula()`를 메서드로 만들어 함수 기능을 분리한 스톤의 방식을 채택했습니다. 
 - 그리고, 스톤은 IBAction 외의 메서드들을 extension ViewController로 분리했었습니다. 구분이 가독성에 도움이 된다 생각하여 채택했습니다.

☑️ **rawFormula의 타입 (Array와 String)**
- 위에 작성한 `componentsByOperator()`메서드의 컨셉이 바뀌면서 split()을 띄어쓰기를 기준으로 String을 쪼개줘야 하는데, array상태에서 joined()메서드를 이용해 사이사이 띄어쓰기를 한번에 넣어주는 방법이 있었고, rawFormula를 String타입으로 유지하려면 연산자(+,-,/,x) 를 추가할 때 앞 뒤로 띄어쓰기를 추가하는 방법이 있었습니다. 둘 중 한번에 추가해 주는 방법이 깔끔하다 생각해 rawFormula를 array로 사용한 스톤의 방식을 채택했습니다.

☑️ **stackView 연산프로퍼티와 addStackView 함수 분리**
- 써니쿠키는 각각의 label을 만드는 함수 두개와 stackView를 만들어 scrollView의 하위 스택뷰에 스택뷰를 추가해주는 함수 한개로 총 세가지의 함수를 사용하여 피연산자와 연산자를 scrollView에 추가해주는 로직이였고
- 스톤은 각각의 label과 stackView에 연산프로퍼티로 속성에 접근할 때 마다 label과 stackView를 반환해주는 로직과, scrollView의 하위 스택뷰에 스택뷰를 추가해주는 함수 한개로 구현하였습니다.
- 연산프로퍼티를 사용하는 것이 가독성이 좋고 직관적이여서 채택했습니다.

☑️ **isClaculated 프로퍼티의 Bool타입으로 코드진행 여부 결정** 
- 기존의 코드에서 label의 값으로 연산이 됐는지, 안됐는지를 판별하는 조건식을 가지고 있었는데, 조금 더 명확하게 플래그 변수를 사용하여 조건식을 판별할 수 있도록 선언하였습니다.

☑️ **operatorLabel, inputNumber 초기화 함수 분리**
- `CalculatorViewController` 내부에서 피연산자 값과, 연산자의 값을 초기화하는 부분이 반복되어 함수를 분리했습니다.

☑️ **UIStackView extension 구현**
- stackView의 하위 요소들을 제거하는 로직을 extension을 활용하여 removeSubViewAll메서드로 구현했습니다.

☑️ **String extension 구현**
- `ExpressionParser` enum타입의 parse메서드 내부에서 `String` 값이 `Double`형으로 형변환이 되는 값인지 확인하기 위해 `isDouble`을 구현했습니다.


---

## 5. ✅ 프로젝트 수행 중 경험하고 배운 것
-  UML을 기반으로 한 코드병합 </br>
     ☑️ 같은 UML로 두명이 각자 작성했던 코드 통합하기   </br>
- 스토리보드 병합 </br>
     ☑️ 코드로 작성한 두명의 스토리보드를 통합하기 </br>
- 기존 코드의 리팩터링 </br>
     ☑️ 코드 통합 후 네이밍, 컨벤션을 통일하는 리팩토링하기 </br>
- Unit test를 통해 리팩터링 과정의 코드 오류를 최소화 </br>
     ☑️ 코드 통합 전 작성해 두었던 unit test를 이용해 통합과정에서의 오류줄이기 </br>
     ☑️ unit test로 코드 통합 후 정상작동 확인하기 </br>
- 제네릭을 활용하여 범용적인 타입 구현(선택) </br>
     ☑️ 제네릭타입을 활용한 Node, LinkedList를 이용한 Queue 구현하기 </br>
  
---

## 6. 🔥 트러블 슈팅

### 1️⃣ 아무것도 안누른상태에서 “00” 누르면 찍히는 오류
- `userInput`속성의 초기값이 "0"이 아닌 ""값으로 설정되어 발생한 오류였습니다.
    - 초기값을 0으로 변경하여 해결할 수 있었습니다.

| before | after |
| ------ |----- |
|<img width = 150, src ="https://i.imgur.com/qjk54WE.gif">|<img width = 150, src ="https://i.imgur.com/6FFD9GE.gif">|
 
### 2️⃣ dot이 한개 찍히도록 / 아무것도 안누른상태에서 dot 누르면 0. 으로 입력되도록 (0이 붙도록)
- dot에 대한 case문이 없어 발생하는 오류였습니다.
    - 키패드를 눌렀을때 호출되는 메서드에서 case조건문을 추가하여 dot이 있을 경우 return하는 조건문을 통하여 dot이 한개이상 찍히지 않도록 수정했습니다.
- `userInput` 속성의 초기값이 빈값("")으로 설정되어서 발생한 오류였습니다.
    - `userInput`속성의 초기값을 0으로 설정 함으로써 `아무것도 안누른상태에서 dot 누르면 0. 으로 입력되도록 (0이 붙도록)`해당 버그를 수정했습니다.

| before | after |
| ------ |----- |
|<img width = 150, src ="https://i.imgur.com/uVblD3c.gif">|<img width = 150, src ="https://i.imgur.com/wrYtia2.gif">|

### 3️⃣ 콤마찍히는 긴 연산자일 때 오류
- rawFormulas 배열에 "1000" 이상의 수가 들어가게 되면 "1,000" 형식으로 저장되어서 "," 로 인해 발생하는 오류였습니다. 
    - `addFormula` 함수에서 append하는 과정에 ","문자를 필터링하여 저장하도록 수정했습니다.

### 4️⃣ 초기상태에서 연산자 변경이 안되도록 수정
- 연산자가 눌렸을때 호출되는 메서드에서 식이 비어있고, 입력된 값이 "0" = 초기값 일때 변경이 일어나지 않도록 return 하는 조건식을 추가했습니다.

| before | after |
| ------ |----- |
|<img width = 150, src ="https://i.imgur.com/71houWV.gif">|<img width = 150, src ="https://i.imgur.com/MWjyXzU.gif">|


### 5️⃣ 기본상태에서 입력할 때, numberfomatter를 사용하여 3자리 수마다 "," 처리
- 유저의 입력값이 변경될때 호출되는 속성감시자 내부의 메서드에서 numberformatter를 적용했습니다.

| before | after |
| ------ |----- |
|<img width = 150, src ="https://i.imgur.com/sqZoouA.gif">|<img width = 150, src ="https://i.imgur.com/OcFKZil.gif">|


### 6️⃣ 계산 끝나고 숫자누르면 재시작 stackView reset
- 계산이 끝난 상태에서, 숫자를 입력하게 되면 stackView는 그대로 남는 버그가 있었습니다.
    - 계산이 끝나고 연산자를 눌러 연산을 이어갈 수는 있지만, 계산이 끝난 후에 숫자를 누르게 된다면 계산을 다시시작 하는 방향으로 수정했습니다.

| before | after |
| ------ |----- |
|<img width = 150, src ="https://i.imgur.com/R5TldHT.gif">|<img width = 150, src ="https://i.imgur.com/OtfKkSD.gif">|

