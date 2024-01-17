//
//  15665.swift
//  N과M(11)
//
//  Created by SeokHyun on 1/18/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var result = Array(repeating: 0, count: m)
func bt(_ index: Int) {
  if m == index {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  var prev = 0
  for i in 0..<n {
    if prev != arr[i] {
      result[index] = arr[i]
      prev = arr[i]
      bt(index+1)
    }
  }
}

bt(0)
