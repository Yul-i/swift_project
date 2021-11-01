import UIKit

//shift+command+Enter
print("플레이그라운드 잘 되나...테스트...")

var shoppingList = ["달걀", "우유"] //String

print(shoppingList)

var shoppingList2 : [String] = []

shoppingList2.append("가방")
shoppingList2.append("볼펜")
shoppingList2.append("마우스")

print(shoppingList2)

shoppingList2[0] = "맥"
print(shoppingList2[0])

print("전체 쇼핑 리스트의 개수는\(shoppingList2.count)개")

//shoppingList2[3] = "물"

shoppingList2.insert("충전기", at: 1)
print(shoppingList2)

shoppingList2.remove(at: 0)
print(shoppingList2)

var count = 0
for x in shoppingList2{
    print("꺼낸 값은", x)
//    if x == "볼펜" {
//        print("컴퓨터 관련된 물건이 아니예요.")
//    }else{
//        print("컴퓨터 관련된 물건이예요.")
//        count = count + 1
//    }
    if x == "볼펜" {
        continue
    }
    count = count+1
}
print("전체 중에서 컴퓨터 관련 물건의 개수는 ", count, "개")

//튜플: 읽기 전용
for (index, value) in shoppingList2.enumerated() {
    print(index, ": ", value)
}

for x in 0..<5{
    print(x)
}

for x2 in 0..<shoppingList2.count{
    print(shoppingList2[x2])
}

//Int 배열 1,3,5,6,7,8를 만들어서
//각 배열의 인덱스와 값을 프린트해보세요.
var array : [Int] = []
array.append(1)
array.append(3)
array.append(5)
array.append(6)
array.append(7)
array.append(8)

for (index, value) in array.enumerated() {
    print(index, ": ", value)
}

//각 배열의 값에 100씩을 더해서 프린트
for (index, value) in array.enumerated() {
    print(value+100)
}
//배열의 값 중 짝수, 홀수의 개수를 더해서 프린트
var even = 0;//짝수
var odd = 0;//홀수

for (index, value) in array.enumerated() {
    if value%2==0 {
        even = even + 1;
    }else{
        odd = odd + 1;
    }
}

print("짝수의 개수 : \(even), 홀수의 개수 : \(odd)")
