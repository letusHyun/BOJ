//
//  2841.swift
//  외계인의 기타 연주
//
//  Created by SeokHyun on 2/15/24.
//

let np = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = np[0], p = np[1] // n: 음의 수, p: 프렛의 수
var guitar = Array(repeating: [Int](), count: 7)
var count = 0
_=(0..<n).map{ _ in
  let lf = readLine()!.split{$0==" "}.map{Int(String($0))!}
  let line = lf[0], fret = lf[1]
  
  while true {
    if guitar[line].isEmpty { // line이 비어있는 경우
      guitar[line].append(fret)
      count += 1
      return
    } else { // line에 운지를 한 경우
      let last = guitar[line].last!
      if last < fret { // 누르려고 하는 fret이 더 큰 경우
        guitar[line].append(fret)
        count += 1
        return
      } else if last == fret { // 누르려고 하는 fret이 일치하는 경우
        return
      } else { // 누르려고 하는 fret이 더 작은 경우
        guitar[line].removeLast()
        count += 1
      }
    }
  }
}
print(count)

// MARK: - Note
/*
 - 6개의 stack을 정의하고, line에 맞게 stack에서 push pop을 진행하며 counting을 진행
 
 - Grammar
  - map 고차함수의 클로저 내부는 반복문이 아니기 때문에, continue 또는 break 선언이 불가능하다.
  - 코드를 종료하려면 return을 사용해야하는데, return을 사용한다고 해서 클로저가 아예 끝나는 것이 아니라 하나의 클로저만 return된 것이다.
 */
