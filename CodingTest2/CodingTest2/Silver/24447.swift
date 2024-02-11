//
//  24447.swift
//  알고리즘수업-너비우선탐색4
//
//  Created by SeokHyun on 2/11/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작정점
var visited = Array(repeating: false, count: n+1)
var orders = Array(repeating: 0, count: n+1) // 순서 저장
var depths = Array(repeating: -1, count: n+1) // 깊이 저장
var adjList = Array(repeating: [Int](), count: n+1)
_=(0..<m).map { _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}


bfs(r)
var result = 0
for i in 1..<n+1 {
  result += orders[i] * depths[i] // t * d
}
print(result)

func bfs(_ startIndex: Int) {
  var queue = [(Int, Int)]()
  var orderCount = 1
  orders[startIndex] = orderCount
  visited[startIndex] = true
  queue.append((startIndex, 0)) // 시작 노드의 depth는 0
  var index = 0
  
  while queue.count > index {
    let (dequeueVertex, dequeueDepth) = queue[index] // dequeue
    depths[dequeueVertex] = dequeueDepth // 깊이 저장
    
    for v in adjList[dequeueVertex].sorted(by: <) { // bfs 오름차순 순회
      if !visited[v] { // 방문한 적 없다면
        visited[v] = true // 방문 처리
        orderCount += 1
        orders[v] = orderCount // 순서 저장
        queue.append((v, dequeueDepth+1)) // enqueue
      }
    }
    index += 1 // next dequeue를 위한 index counting
  }
}
// MARK: - Note
/*
 - t: 노드의 방문 순서
 - d: 노드의 깊이
 */
