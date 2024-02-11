//
//  24445.swift
//  알고리즘수업 - 너비우선탐색2
//
//  Created by SeokHyun on 2/11/24.
//

let nmr = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nmr[0], m = nmr[1], r = nmr[2] // n: 정점 수, m: 간선 수, r: 시작 정점
var visited = Array(repeating: 0, count: n+1) // 방문여부 && 방문 순서 저장
var adjList = Array(repeating: [Int](), count: n+1)
_=(0..<m).map{ _ in
  let uv = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uv[0]].append(uv[1])
  adjList[uv[1]].append(uv[0])
}
var orderCount = 1
bfs(r)
print(visited.map{String($0)}.dropFirst().joined(separator: "\n"))

func bfs(_ startIndex: Int) {
  visited[startIndex] = orderCount
  var queue = [Int]()
  queue.append(startIndex)
  var index = 0
  
  while queue.count > index {
    let dequeue = queue[index]
    
    for v in adjList[dequeue].sorted(by: >) {
      if visited[v] == 0 { // 방문한 적 없다면
        orderCount += 1
        visited[v] = orderCount // 방문 표시 && 방문 순서 저장
        queue.append(v)
      }
    }
    index += 1
  }
}
