//
//  1753.swift
//  최단경로
//
//  Created by SeokHyun on 3/7/24.
//

let ve = readLine()!.split{$0==" "}.map{Int(String($0))!}
let v = ve[0], e = ve[1]
let k = Int(readLine()!)!
var adjList = Array(repeating: [(Int, Int)](), count: v+1) // (인접한 vertex, 가중치)
var visited = Array(repeating: false, count: v+1)
var shortest = Array(repeating: Int.max, count: v+1)
shortest[k] = 0
visited[k] = true
_=(0..<e).map{ _ in
  let uvw = readLine()!.split{$0==" "}.map{Int(String($0))!}
  adjList[uvw[0]].append((uvw[1], uvw[2]))
}

var curVertex = k
while true {
  
  // 방문한 적 없으면서, min인 vertex
  
  // 인접 노드들의 가중치 업데이트
  for (adjVertex, d) in adjList[curVertex] {
    shortest[adjVertex] = min(shortest[curVertex] + d, shortest[adjVertex])
  }
  
  for i in 1..<v+1 {
    for (j, _) in visited.filter {$0 == false}.enumerated() {
      
    }
  }
}
