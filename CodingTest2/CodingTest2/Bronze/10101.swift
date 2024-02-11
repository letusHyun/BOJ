//
//  10101.swift
//  삼각형외우기
//
//  Created by SeokHyun on 2/11/24.
//

var arr = Array(repeating: 0, count: 3)
for i in 0..<arr.count {
  arr[i] = Int(readLine()!)!
}
var count = 0
if arr[0] == 60, arr[1] == 60, arr[2] == 60 {
  print("Equilateral")
} else if arr[0] + arr[1] + arr[2] == 180 {
  for i in 0..<arr.count-1 { // 탐색
    for j in i+1..<arr.count {
      if arr[i] == arr[j] {
        count += 1
      }
    }
  }
  if count == 1 { // 두각만 같은 경우
    print("Isosceles")
  } else if count == 0 { // 각이 전부 다른 경우
    print("Scalene")
  }
} else {
  print("Error")
}
