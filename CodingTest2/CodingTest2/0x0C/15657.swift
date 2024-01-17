//
//  15657.swift
//  N과M(8)
//
//  Created by SeokHyun on 1/17/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
arr.sort()
var result = Array(repeating: 0, count: m)

func bt(_ arrIndex: Int, _ index: Int) {
  if m == index {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  for i in stride(from: arrIndex, to: n, by: 1) {
    result[index] = arr[i]
    bt(i, index+1)
  }
}

bt(0, 0)
