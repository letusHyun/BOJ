//
//  9663.swift
//  N-Queen
//
//  Created by SeokHyun on 1/18/24.
//

let n = Int(readLine()!)!

var cols = Array(repeating: false, count: n)
var rightUpper = Array(repeating: false, count: 2*n-1)
var rightUnder = Array(repeating: false, count: 2*n-1)
var result = 0

func bt(_ i: Int) {
  if i == n {
    result += 1
    return
  }
  
  for j in 0..<n { // column 순회
    if !cols[j], !rightUpper[i+j], !rightUnder[j-i+n-1] {
      cols[j] = true
      rightUpper[i+j] = true
      rightUnder[j-i+n-1] = true
      bt(i+1) // row 순회
      cols[j] = false
      rightUpper[i+j] = false
      rightUnder[j-i+n-1] = false
    }
  }
}

bt(0)
print(result)

/*
 - 체스판의 행을 전부 순회했다는 것은 N개의 퀸을 제대로 배치했다는 의미
 - 퀸을 다음 column으로 옮길 때는 기존의 방문처리 해제해야한다.
 */
