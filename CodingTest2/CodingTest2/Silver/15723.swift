//
//  15723.swift
//  n단논법
//
//  Created by SeokHyun on 2/15/24.
//

let n = Int(readLine()!)!
var adjList = Array(repeating: [Int](), count: 26)
var visited = Array(repeating: false, count: 26)
_=(0..<n).map{ _ in
  let input = readLine()!
  let first = Int(UnicodeScalar(String(input.first!))!.value)-97
  let second = Int(UnicodeScalar(String(input.last!))!.value)-97
  adjList[first].append(second)
}

let m = Int(readLine()!)!
var isTrue = false
_=(0..<m).map{ _ in
  let output = readLine()!
  let start = Int(UnicodeScalar(String(output.first!))!.value)-97
  let end = Int(UnicodeScalar(String(output.last!))!.value)-97
  dfs(start, end)
  visited[start] = false
  if isTrue {
    print("T")
  } else {
    print("F")
  }
  isTrue = false
}


func dfs(_ startIndex: Int, _ endIndex: Int) {
  visited[startIndex] = true
  if startIndex == endIndex {
    isTrue = true
    return
  }
  for v in adjList[startIndex] {
    if !visited[v] {
      dfs(v, endIndex)
      visited[v] = false
      if isTrue {
        return
      }
    }
  }
}

// MARK: - Note
/*
 - isTrue: dfs 종료 변수
 */
