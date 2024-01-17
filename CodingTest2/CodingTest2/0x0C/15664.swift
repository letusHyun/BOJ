//
//  15664.swift
//  N과M(10)
//
//  Created by SeokHyun on 1/18/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var result = Array(repeating: 0, count: m)
var isVisited = Array(repeating: false, count: n)
func bt(_ at: Int, _ index: Int) {
  if index == m {
    print(result.map{String($0)}.joined(separator: " "))
    return
  }
  
  var prev = 0
  for i in stride(from: at, to: n, by: 1) {
    if !isVisited[i], prev != arr[i] {
      isVisited[i] = true
      result[index] = arr[i]
      prev = arr[i]
      bt(i+1, index+1)
      isVisited[i] = false
    }
  }
}

bt(0, 0)
