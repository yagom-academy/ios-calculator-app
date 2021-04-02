// func convert(binaryNumber: Int) -> Int {
//     if binaryNumber < 1000000000 && binaryNumber > 11111111 {
//         //9자리인 경우
//     } else if binaryNumber < 100000000 {
//         //8자리 이하인 경우
//     } else {
//         //10자리 이상인 경우
//     }
// }
 
var a: Int = (521 * 100) + 23
print(a % 100)


var b: Int = (7 * 0b100) + 0b10
print(String(b % 0b100, radix: 2))

// 9자리의 이진수를 제한해주고 싶을 때, 2^10 = 1024
