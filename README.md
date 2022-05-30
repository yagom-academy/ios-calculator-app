## 🤟 Step 3

### 고민한 점 🤔

#### 1. 키패드 버튼에 대한 고민
계산기의 키패드에서 어떤 버튼이 눌렸는지 확인하기 위해 총 3개가지 방식을 생각해 보았습니다.

      1️⃣ 모든 키패드버튼을 아울렛으로 가져와서, switch-case를 사용한다.
      2️⃣ 키패드 버튼을 아울렛 컬렉션으로 가져와서, 아울렛 컬렉션의 인덱스를 활용한다.
      3️⃣ UIButton.titleLabel.text를 사용한다.

- **첫번째 방법**은 다른 두가지 방법에 비해 안전하지만, 총 11개의 키패드를 switch case로 만들어줘야해서 하드코딩같은 느낌을 받았습니다.
- **두번째 방법**은 아울렛 컬렉션에 0부터 순서대로 넣어서 숫자와 동일하게 인덱스 값을 가지게 한 다음, enum의 연관값을 활용하여 각 인데스가 어떤 의미를 가지는지 확인해주는 방식입니다. 이 방식은 enum 파일을 만들어줌으로써 한 파일의 코드가 길어지는 것을 방지할 수 있었습니다.
(자세한 코드는 commit **9b0e883**에서 확인하실 수 있습니다.)
- **세번째 방법** 위에 두 방법보다 에러 발생 확률이 높다고 생각했지만, 최종적으로 이 방법을 사용하였습니다.

두번째에서 세번째 방법으로 바꾼 가장 큰 이유는 가독성이었습니다.
title값이 변경되어 에러가 발생하는 것과 인덱스 순서가 잘못되어 에러가 발생하는 것 중에 뭐가 더 큰 문제를 발생시키는 에러인지 모르겠습니다🥲
둘 다 에러가 발생할 수 있는 환경이라면, 가독성이 더 나은 걸 선택하는게 좋지 않을까 생각했습니다..!
그래서 최종적으로 PR을 보낼 땐 titleLabel을 사용하는 걸로 구현했습니다.

<br>

### 조언받고 싶은 점 😯
1. 키패드 버튼 처리에 대한 부분
- 제가 생각한 세 가지 방식보다 더 좋은 방향이 있을 것 같은데, 어떤 걸 사용하여 구현해야되는지 감이 안옵니다..😥
어떤 개념을 활용 해야 유지보수도 용이한 좋은 코드가 될 수 있는지 궁금합니다😯

<br>
<br>

## 코드 설명 🥸

### ViewController 파일
#### [프로퍼티]
    
 `private var inputNumber = ""`
 - 사용자가 누른 피연산자를 담아두는 변수 입니다.

 `private var inputOperator = ""`
 - 사용자가 누른 연산자를 담아두는 변수 입니다.
 
 `private var arithmetic = ""`
 - 피연산자와 연산자를 담고 있는 변수 입니다.
 
 `private var isPositiveNumber = true`
 - 양수인지 음수인지 판별해주는 변수 입니다.

<br>


#### [메서드]

`@IBAction private func tapAllClearButton(_ sender: UIButton)`
 - AC 버튼을 눌렀을 때 발생하는 메서드 입니다.
  
`@IBAction private func tapClearEntryButton(_ sender: UIButton)`
- CE 버튼을 눌렀을 때 발생하는 메서드 입니다.

`private func resetCalculator()` 
- 모든 레이블과 변수값을 초기화 시켜주고, 서브뷰를 없애주는 메서드 입니다.
 
 `private func updateStackView()`
 - 피연산자와 연산자의 값을 스택뷰에 반영시켜주는 메서드 입니다.
  
`@IBAction private func tapKeypadButton(_ sender: UIButton)`
- 키패드 버튼을 눌렀을 때 발생하는 메서드 입니다.
  
    
`@IBAction private func tapOperatorsButton(_ sender: UIButton)`
- 연산자 버튼을 눌렀을 때 발생하는 메서드 입니다.

`@IBAction private func tapResultButton()`
- arithmetic에 담겨있던 연산을 구해주는 메서드입니다.
    
`@IBAction private func tapToChangeSignButton(_ sender: UIButton)`
- 부호를 바꿔주는 버튼을 눌렀을 때 발생하는 메서드 입니다.
    

`private func checkInputNumber(number: String)`
- inputNumber로 올 수 없는 경우를 확인하고 값을 넣어주는 메서드 입니다.

<br>

#### [extension]

`func removeAllArrangedSubview` 
- UIStackView에 모든 서브뷰를 지워주는 메서드 입니다. 

<br>
