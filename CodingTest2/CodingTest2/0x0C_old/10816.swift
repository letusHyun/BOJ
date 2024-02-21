//
//  10816.swift
//  숫자 카드2
//
//  Created by SeokHyun on 2/21/24.
//

let n = Int(readLine()!)!
let cardN = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = Int(readLine()!)!
let cardM = readLine()!.split{$0==" "}.map{Int(String($0))!}

var dic = [String: Int]()
for elem in cardN {
  let card = String(elem)
  if dic[card] != nil { // 딕셔너리에 존재한다면
    dic[card] = dic[card]! + 1
  } else { // 딕녀서리에 존재하지 않았다면
    dic[card] = 1
  }
}
var result = ""
for elem in cardM {
  let key = String(elem)
  if dic[key] != nil {
    result += "\(dic[key]!) "
  } else {
    result += "0 "
  }
}

print(result)

// MARK: - Note
/*
 - 딕셔너리 사용
  - 처음 들어온 경우 1로 초기화
  - 중복될때마다 +1 counting
 */
