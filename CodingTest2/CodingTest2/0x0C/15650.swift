//
//  15650.swift
//  N과M(2)
//
//  Created by SeokHyun on 1/15/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var result = Array(repeating: 0, count: m)

func bt(_ at: Int, _ index: Int) {
  if index == m {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  for i in stride(from: at, through: n, by: 1) {
    result[index] = i
    bt(i+1, index+1)
  }
}

bt(1, 0)

// MARK: - Note
// 현재 자리 수의 수가 이전 자리 수의 수보다 커야 한다.
// 인자로 at을 넘겨서 재귀 호출 하기 때문에, for문에서 다음 자리수의 수가 이전 자리수의 수보다 큰 값임이 보장되므로, 방문표시를 할 필요가 없다.
