//
//  7569.swift
//  토마토
//
//  Created by SeokHyun on 3/02/24.
//

import Foundation

let mnh = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = mnh[0], n = mnh[1], h = mnh[2] // m: 가로, n: 세로, h: 높이
// -1: 토마토 없음, 0: 익지 않은 토마토, 1: 익은 토마토
var graph = Array(repeating: Array(repeating: [Int](), count: n), count: h)
let dx = [-1, 0, 1, 0, 0, 0]
let dy = [0, -1, 0, 1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]
//var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: m), count: n), count: h)
var queue = [(Int,Int,Int,Int)]() // x, y, z, count
var maxValue = Int.min
var alreadyRipen = true
for i in 0..<h {
  for j in 0..<n {
    graph[i][j] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    for k in 0..<m {
      if graph[i][j][k] == 1 {
//        visited[i][j][k] = 0
        queue.append((k, j, i, 0))
      } else if graph[i][j][k] == 0 {
        alreadyRipen = false
      }
    }
  }
}

if alreadyRipen {
  print(0)
  exit(0)
}


bfs()

func bfs() {
  var index = 0
  while queue.count > index {
    let (cx, cy, cz, curCount) = queue[index]
    maxValue = max(curCount, maxValue)
//    visited[cz][cy][cx] = curCount
    for i in 0..<dx.count {
      let nx = cx + dx[i]
      let ny = cy + dy[i]
      let nz = cz + dz[i]
      
      if nx >= 0, nx < m,
         ny >= 0, ny < n,
         nz >= 0, nz < h,
         graph[nz][ny][nx] == 0 {
        graph[nz][ny][nx] = 1
        queue.append((nx, ny, nz, curCount+1))
      }
    }
    index += 1
  }
}

var isRipen = true
outerLoop: for i in 0..<h {
  for j in 0..<n {
    for k in 0..<m {
      if graph[i][j][k] == 0 {
        isRipen = false
        break outerLoop
      }
    }
  }
}

if !isRipen {
  print(-1)
} else {
  print(maxValue)
}

// MARK: - Note
/*
 - 초기에 1의 위치를 queue에 enqueue
  - bfs 수행
 */
