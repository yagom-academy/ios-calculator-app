## iOS 커리어 스타터 캠프

### 계산기 프로젝트

Step1 구현 기간: 2021.11.08 ~ 2021.11.11

Step2 구현 기간: 2021.11.12 ~ 2021.11.16

### 프로그램 가이드

---

[Step 1] 

- TDD를 기반으로 Queue 타입 구현

[Step 2] 

- 사용자가 계산기에 입력한 숫자와 연산자를 1개의 문자열로 받아 처리.

숫자 및 연산자를 각각 Queue에 할당. 

Generic 타입으로 각각 Double/Operator 타입으로 지정하고 각각의 큐 인스턴스를 생성.

연산의 결과는 각각의 큐에서 반환을 하면서 실행.

---
## [STEP 1]

### UML

<img width="375" alt="스크린샷 2021-11-12 오전 2 36 55" src="https://user-images.githubusercontent.com/55880539/142001606-5fe4226c-5cfb-4bf0-9495-4b0bfcdab306.png">



### 구현 내용

- 사용자가 계산기에 입력한 숫자 및 연산자를 Queue에 차례로 저장
- Queue를 구현하기 위해 Array를 활용
- TDD 방식으로 진행

### 고려사항

1. 클래스 or 구조체?
    
    아직 구체적인 명세가 없고, 특별한 상황이 아닐 경우 구조체를 사용하라고 공식문서에 적혀있어서, 구조체를 사용하여 구현하였습니다.
    

1. 배열 or 링크드리스트?
    
    우선 배열과 링크드리스트에 차이가 배열에서 값을 제거할 때의 수행시간때문에 링크드리스트의 효율이 좋다는 것을 배웠습니다. 저는 배열을 선택했는데, 우선적으로 사용이 간편한 배열을 사용하고, 추후에 링크드 리스트로 구현해볼 생각에 배열로 구현을 하였습니다.
    
### 주요 메서드
 - enqueue : 큐에 하나씩 원소를 담는 기능입니다.
 - dequeue : 들어온 순서대로 하나씩 원소를 return 합니다.
 - removeAllItem : 모든 원소를 제거합니다.
 - countAllitem : 모든 원소의 개수를 세서 Int형으로 반환합니다.
 ---
 ## [STEP 2]
 ![calculator_step_2_uml](https://user-images.githubusercontent.com/55880539/142394270-fd5f48ef-bc83-46b0-a928-5dd7deb08515.png)

### 구현 내용

- 숫자 및 연산자로 구성된 문자열 처리를 위해 Extension, Protocol을 활용
- 연산이 불가능한 경우 (ex. 0으로 나누기) 오류 처리
- TDD 방식으로 진행

### 주요 메서드
- Operator 열거형의 calculate : 연산자에 따라 연산을 실행합니다.
- ExpressionParser의 componentsByOperators : 수식을 입력받아 연산자를(+,-,x,/) 공백(" ")으로 변환시키는 역할을 합니다.
- ExpressionParser의 parse : 문자열의 숫자 및 연산자를 구분하여 각각의 Queue (Double/Operator 타입)에 할당하고, 해당 Queue를 Formula 타입으로 반환합니다.
- Formula의 result : Queue의 숫자/연산자를 차례로 꺼내어 사칙연산을 수행하고, 결과값을 반환합니다.


