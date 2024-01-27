//
//  2606.swift
//  바이러스
//
//  Created by SeokHyun on 1/26/24.
//

let n = Int(readLine()!)!
let pairNum = Int(readLine()!)!

var arr = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var result = 0

for _ in 0..<pairNum {
  let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
  arr[input[0]].append(input[1])
  arr[input[1]].append(input[0])
}

dfs(1)
print(result-1)

func dfs(_ n: Int) {
  result += 1
  visited[n] = true
  
  for elem in arr[n] {
    if !visited[elem] {
      dfs(elem)
    }
  }
}
