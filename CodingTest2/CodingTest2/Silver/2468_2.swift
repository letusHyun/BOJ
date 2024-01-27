//
//  2468.swift
//  안전 영역
//
//  Created by SeokHyun on 1/27/24.
//

let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
_=(0..<n).map{graph[$0]=readLine()!.split{$0==" "}.map{Int(String($0))!}}
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = [Int]()
let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

for h in 0..<100 {
  var count = 0
  for i in 0..<n {
    for j in 0..<n {
      if !visited[i][j], graph[i][j] > h {
        bfs(j, i, h)
        count += 1
      }
    }
  }
  result.append(count)
  visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(result.max()!)

func bfs(_ x: Int, _ y: Int, _ h: Int) { // bfs는 재귀(stack) 아닌 queue 방식
  var queue = [(Int, Int)]()
  var queueIndex = 0
  queue.append((x, y)) // enqueue
  visited[y][x] = true // 방문처리
  
  while queue.count > queueIndex {
    let (cx, cy) = queue[queueIndex]
    
    for i in 0..<dx.count {
      let nx = dx[i] + cx
      let ny = dy[i] + cy
      
      if 0 <= nx,
         nx < n,
         0 <= ny,
         ny < n,
         !visited[ny][nx],
         graph[ny][nx] > h {
        
        queue.append((nx, ny)) // 큐 삽입
        visited[ny][nx] = true // 방문처리
      }
    }
    queueIndex += 1
  }
}
