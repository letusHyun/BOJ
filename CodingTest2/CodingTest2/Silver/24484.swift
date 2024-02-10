//
//  24484.swift
//  알고리즘수업-깊이우선탐색6
//
//  Created by SeokHyun on 2/10/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작정점
var visited = Array(repeating: -1, count: n+1) // 방문탐색 && depth
var adjList = Array(repeating: [Int](), count: n+1)
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}
var order = Array(repeating: 0, count: n+1)
var orderCount = 1
dfs(r, 0)

func dfs(_ startIndex: Int, _ depth: Int) {
  visited[startIndex] = depth
  order[startIndex] = orderCount
  for v in adjList[startIndex].sorted(by: >) { // 내림차순 순회
    if visited[v] == -1 { // 방문한 적 없다면
      orderCount += 1
      dfs(v, depth + 1)
    }
  }
}

var result = 0
for i in 1..<n+1 {
  result += visited[i] * order[i] // d * t
}
print(result)

// MARK: - Note
/*
 d: 노드의 depth
 t: 노드의 방문 순서
 */
