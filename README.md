# README 계산기 [STEP 2]

### 1. 프로젝트 소개

- 아래 제시된 UML 구현하기
![](https://i.imgur.com/HPKP0vo.png)



---

### 2. 팀원

|SummerCat|
|------|
|<img width="180px" src="https://i.imgur.com/TVKv7PD.png">|



--- 


### 3. 프로젝트 구조
![](https://i.imgur.com/YqoF34z.png)


---

### 4. 실행 화면


---

### 5. 고민한 내용

#### 5-1 `componentsByOperator(from: )` 메서드의 역할

연산자로 이루어진 배열을 반환하는 메서드인지, 연산자로 구분한 숫자들을 반환하는 메서드인지 헷갈렸다. 후자에 더 가깝다고 생각해서 매개변수로 주어진 문자열을 연산자로 구분해서 문자열 배열로 반환해주는 내용으로 구현했다 (`"1+2+3" -> ["1", "2", "3"]`).

#### 5-2 예외 처리

발생 가능한 예외 상황은 `1. 0으로 나누었을 때`, `2. 음수 입력값을 받는 경우`, `3. 연산자가 두 개 연달아 입력되었을 경우`, `4. 입력값의 맨 첫번째 값이 연산자인 경우`, `5. 입력값의 맨 마지막 값이 연산자일 경우` 정도를 생각했다. 이 중 1 ~ 4번을 model에서 처리하고 5번을 처리하지 못했다가, 3~5번의 경우 view/controller 단에서 처리하는 것이 낫다고 판단해 결과적으로는 model에서는 1~2번만 아래와 같이 처리했다.
- `1. 0으로 나누었을 때`: 처음에는 divisor가 0인 경우 `divisorIsZero`라는 오류를 정의해주고 해당 오류를 반환하도록 했었으나, 과제 요구사항을 다시 읽어본 후 `.nan`을 반환하는 것으로 변경했다.
- `2. 음수 입력값을 받는 경우`: 수식을 입력할 때, 연산기호를 누르면 연산기호 앞뒤로 공백을 같이 입력하는 것으로 가정하고 공백을 기준으로 각 입력값을 구분한 후 연산자를 제거해주어 음수에 붙는 기호 `-`가 연산자로 처리되지 않도록 했다.

---

### 6. 트러블 슈팅

#### 0으로 나누었을 경우의 결과값 확인
0으로 나누었을 경우 결과값이 `.nan`이 제대로 나왔는지 확인하기 위해 처음에는 `XCTAssertEqual(result, .nan)`과 같이 확인 코드를 작성했었는데, 결과값이 계속 `false`가 나왔다. 이유는 `NaN`은 자기 자신을 포함한 어느 값과도 같지 않기 때문에, `==`나 `!=` 연산이 불가능하기 때문이다. 공식문서를 참고해서 `isNaN`이라는 프로퍼티가 값이 `.nan`인지의 여부를 Bool 값으로 알려준다는 것을 알게되어 해결했다.

```swift
func test_result_0으로_나눌경우_nan반환() {
    //given
    sut.operands.enqueue(item: 2)
    sut.operators.enqueue(item: Operator.divide)
    sut.operands.enqueue(item: 0)

    // when
    let result = sut.result()

    // then
    XCTAssertTrue(result.isNaN)
}
```

---

### 7. 참고 링크

[`isNan` 공식문서](https://developer.apple.com/documentation/swift/floatingpoint/isnan)
