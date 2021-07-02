## 계산기 프로젝트 저장소

![Flow_Chart](https://cdn.discordapp.com/attachments/856388606880645161/856827006695374848/unknown.png)

### 프로젝트 계산기 설명

중위연산을 후위연산으로 바꿔 계산하는 계산기 구현
중위연산을 후위연산으로 변환하는데 사용하는 Stack.swift 파일에  Stack 타입 구현
중위연산을 후위연산으로 변환하는데 필요한 메소드 Calculator.swift 파일에 구현
- concatNumbers
- allClear
- clearEntry
- putInto
- converToPostfixNotation
- checkOperator
- calculatePostfix
- inputOperator
후위연산식을 계산하는데 필요한 메소드 요구사항으로 정의한 Calculatable 프로토콜 구현
후위연산식을 계산하는데 필요한 메소드 Calculatable 프로토콜 확장
후위연산식 계산을 검증하는 Unit Test 메소드 구현(calculate), CalculatorTests.swift 파일 추가

### 배운 키워드
1. Stack 자료구조의 이해와 구현
2. 숫자와 연산자 입력에 스택 활용
3. Unit Test 구현
4. 계산기 UI 연동
