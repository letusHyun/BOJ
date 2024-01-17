//
//  15655.swift
//  N과M(6)
//
//  Created by SeokHyun on 1/16/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var result = Array(repeating: 0, count: m)
var arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
arr.sort()

func bt(_ arrIndex: Int, _ index: Int) {
  if index == m {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  for i in stride(from: arrIndex, to: n, by: 1) {
    result[index] = arr[i]
    bt(i+1, index+1)
  }
}

bt(0, 0)
