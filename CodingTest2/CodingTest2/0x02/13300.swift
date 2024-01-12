//
//  13300.swift
//  CodingTest2
//
//  Created by SeokHyun on 1/10/24.
//

let nk = readLine()!.split {$0==" "}.map{Int(String($0))!}
let n = nk[0] // row 개수
let k = nk[1] // 최대 인원 수
var student = Array(repeating: Array(repeating: 0, count: 2), count: 6)
var result = 0

for _ in 0..<n {
  let sy = readLine()!.split {$0==" "}.map{Int(String($0))!}
  let s = sy[0]
  let y = sy[1]
  student[y-1][s] += 1
}

for grade in student {
  for sex in grade {
    result += sex / k
    if sex % k != 0 { // 최대로 명 수 채웠는데도 인원 남으면 room 추가
      result += 1
    }
  }
}

print(result)
