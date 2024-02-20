//
//  11651.swift
//  좌표 정렬하기2
//
//  Created by SeokHyun on 2/20/24.
//

let n = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: n)

_=(0..<n).map { arr[$0] = readLine()!.split{$0==" "}.map{Int(String($0))!}}
arr.sort {
  if $0[1] == $1[1] {
    return $0[0] < $1[0]
  }
  return $0[1] < $1[1]
}
for row in arr {
  let rowStr = row.map{String($0)}.joined(separator: " ")
  print(rowStr)
}

// MARK: - Note
/*
 sorted 응용 문제
 */
