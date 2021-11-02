import UIKit

//딕셔너리를 만들 때 처음에 값들을 알고 있는 경우
var family : [String : String] = ["dad" : "홍길동", "mom" : "홍길순"]

print(family)

for x in family{
    print(x.key, x.value)
}

//딕셔너리를 만들 때 처음에 값들을 모르고 있다가 나중에 넣는 경우
var hobby : [Int : String] = [ : ]

hobby.updateValue("달리기", forKey: 1)
hobby.updateValue("독서", forKey: 2)
hobby.updateValue("동산", forKey: 3)
print(hobby)

hobby[3] = "수영"
print(hobby)
for(key, value) in hobby{
    print(key, value)
}

hobby.removeValue(forKey: 3)
print(hobby)

var food : String?
print(food)

var food2 : String? = "우동"
food2 = nil
print(food2)

food2 = "떡볶이"
print(food2)
print(food2! + "를 먹었어요.!")

var count : Int? = 100
//100에다가 100을 더한 것
print(count!)

var result = count! + 100
//++result // result = result + 1

//print("내가 가진 개수는 " + result) //둘다 String 이여야 + 을 사용 할 수 있다.
print("내가 가진 개수는 " + String(result))

var today : Character = "화"
switch today {
case "토", "일" :
    print("주말입니다.")
case "월", "화" :
    print("주중입니다.")
    fallthrough//브레이크 안걸리게 넘겨줌
default:
    print("놀자..놀자...")
}

// 튜플로 리턴하는 프로그램
func startEnd(array: [Int])-> (start: Int, end : Int) {
    var s = array[0]
    var e = array[array.count-1]
    return (s, e)
}

var arr = [1000, 2000, 3000]
print(startEnd(array: arr))
var (result1, result2) = startEnd(array: arr)
//var (_, result2) = startEnd(array: arr)
print(result1)
print(result2)

var names = ["홍길동", "홍길순", "홍길정", "홍길장"]
//제일 친한 친구이름과 세번째로 친한 이름, 마지막으로 제일 친한 이름 함수 정의
//함수 호출해서 튜플을 변수에 넣어보세요
//세번째 친구 이름은 변수에 저장하지 말아보세요
//제일 친한 친구이름, 마지막으로 제일 친한 이름만 프린트

//파라메터의 의미를 더 강조하기 위해서 별명을 지을 수 있다.
//별명 사용법 : 별명 파라메터명 : 데이터 타입
//파라메터명을 생략하고자 하는 경우 : _(omit)
func getNames(arr2 : [String]) -> (f1:String, f3:String, f4:String){
    return (arr2[0], arr2[2], arr2[arr2.count - 1])
}

var (n1, _, n3) = getNames(arr2: names)
print("첫번째 친한 친구 이름은 ", n1)
print("두번째 친한 친구 이름은 ", n3)

//default value 설정 가능
func setLevel(_ name : String, _ level : String = "보통등급"){
    print(name + "님의 등급은 " + level + "입니다.")
}

setLevel("홍길동")
setLevel("홍길순", "VIP등급")

//입력값 여러종류 넣고싶다 ...
func hobby(_ fields: String...){
    print(fields)
}

hobby("운동", "헬스", "달리기")
hobby("뜨개질", "바느질")

