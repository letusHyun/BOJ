//
//  2178.swift
//  미로탐색
//
//  Created by SeokHyun on 2/4/24.
//

let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nm[0], m = nm[1] // n: height, m: width
var graph = Array(repeating: [Int](), count: n)
_=(0..<n).map{graph[$0]=readLine()!.map{Int(String($0))!}}
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

 bfs(0, 0)

func bfs(_ x: Int, _ y: Int) {
  var queue = [(Int, Int)]()
  visited[y][x] = 1
  queue.append((x, y))
  
  while !queue.isEmpty {
    let (cx, cy) = queue.removeFirst()
    
    if cx==m-1, cy==n-1 {
      print(visited[cy][cx])
      break
    }
    for i in 0..<dx.count {
      let nx = dx[i] + cx
      let ny = dy[i] + cy
      
      if nx >= 0, nx < m,
         ny >= 0, ny < n,
         visited[ny][nx] == 0, graph[ny][nx] == 1 {
        visited[ny][nx] = visited[cy][cx] + 1
        queue.append((nx, ny))
      }
    }
  }
}

// MARK: - Note
/*
 - dfs는 시간초과
 - 최단경로를 구하기 위해선 BFS가 효율적
 - visited 용도: 방문표시, counting
 */
