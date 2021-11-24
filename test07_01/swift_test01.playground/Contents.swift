import UIKit

var location = ["강남", "영등포", "서대문", "마포", "종로"]

for (index, value) in location.enumerated(){
    print(index, " : ", value)
}

var bag : [String] = []

bag.append("휴대폰")
bag.append("휴지")
bag.append("볼펜")
bag.append("노트")

for have in bag{
    print("내 가방에 들어있는 물건은", have)
}

var bus = ["100":"강남", "200":"마포", "300":"서대문"]

for (num, busStop) in bus {
    print(num, "->", busStop)
}
