//
//  15656.swift
//  N과M(7)
//
//  Created by SeokHyun on 1/16/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = readLine()!.split{$0==" "}.map{Int(String($0))!}
arr.sort()
var resultString = ""
var result = [String]()

func bt(_ index: Int) {
  if index == m {
    resultString += result.joined(separator: " ") + "\n"
    return
  }
  
  for i in 0..<n {
    result.append(String(arr[i]))
    bt(index+1)
    result.removeLast()
  }
}

bt(0)
print(resultString)
