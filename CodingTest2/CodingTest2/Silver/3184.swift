//
//  3184.swift
//  양
//
//  Created by SeokHyun on 2/2/24.
//

let rc = readLine()!.split{$0==" "}.map{Int(String($0))!}
let r = rc[0], c = rc[1] // r: height, c: width
var graph = Array(repeating: [String](), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
_=(0..<r).map{graph[$0]=readLine()!.map{String($0)}}
var swArr = [(Int, Int)]()
for i in 0..<r {
  for j in 0..<c {
    if !visited[i][j], graph[i][j] != "#" {
      visited[i][j] = true
      var sw = dfs(j, i)
      
      if sw.0 > sw.1 { // 양이 더 많으면 늑대 0
        sw.1 = 0
      } else {
        sw.0 = 0
      }
      swArr.append(sw)
    }
  }
}

func dfs(_ x: Int, _ y: Int) -> (Int, Int) {
  var sw = (0, 0)
  
  if graph[y][x] == "o" {
    sw.0 += 1
  } else if graph[y][x] == "v" {
    sw.1 += 1
  }
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if nx >= 0, nx < c,
       ny >= 0, ny < r,
       !visited[ny][nx], graph[ny][nx] != "#" {
      visited[ny][nx] = true
      let newSw = dfs(nx, ny)
      sw.0 += newSw.0
      sw.1 += newSw.1
    }
  }
  
  return sw
}

var result = Array(repeating: 0, count: 2)
for (s, w) in swArr {
  result[0] += s
  result[1] += w
}

print(result.map{String($0)}.joined(separator: " "))

// MARK: - Note
/*
 - 울타리 내부 탐색
    - 늑대, 양 개수 세고, 늑대와 양의 최종 개수 결정
 */
