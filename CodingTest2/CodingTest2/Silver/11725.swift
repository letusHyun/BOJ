//
//  11725.swift
//  트리의 부모 찾기
//
//  Created by SeokHyun on 1/23/24.
//

let n = Int(readLine()!)!
var adList = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var result = Array(repeating: 0, count: n+1)

for _ in 0..<n-1 { // 인접리스트 구현
  let vertexes = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adList[vertexes[0]].append(vertexes[1])
  adList[vertexes[1]].append(vertexes[0])
}

func dfs(_ n: Int) {
  for elem in adList[n] {
    if !visited[elem] {
      visited[n] = true
      result[elem] = n
      dfs(elem)
    }
  }
}

dfs(1)

for i in 2..<n+1 {
  print(result[i])
}

// MARK: - Note
/*
 1. 인접리스트로 데이터를 구현
 2. 결과 저장하고 DFS
 */
