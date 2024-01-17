//
//  15666.swift
//  N과M(12)
//
//  Created by SeokHyun on 1/18/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var result = Array(repeating: 0, count: m)

func bt(_ arrIndex: Int, _ index: Int) {
  if index == m {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  var prev = 0
  for i in arrIndex..<n {
    if prev != arr[i] {
      result[index] = arr[i]
      prev = arr[i]
      bt(i, index+1)
    }
  }
}

bt(0,0)
