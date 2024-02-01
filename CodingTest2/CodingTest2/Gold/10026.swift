//
//  10026.swift
//  적록색약
//
//  Created by SeokHyun on 1/28/24.
//

enum BlindCheck {
  case blind
  case normal
}

let n = Int(readLine()!)!
var graph = Array(repeating: [String](), count: n)
var blindVisited = Array(repeating: Array(repeating: false, count: n), count: n)
var normalVisited = Array(repeating: Array(repeating: false, count: n), count: n)
let rgb = ["R", "G", "B"]
_=(0..<n).map{ graph[$0]=readLine()!.map{String($0)} }
var result = Array(repeating: 0, count: 2)
let dx = [-1,0,1,0]
let dy = [0, -1, 0, 1]


for k in 0..<rgb.count { // 0:R, 1:G, 2:B
  for i in 0..<n {
    for j in 0..<n {
      // normal
      if !normalVisited[i][j], isSameColor(graph[i][j], rgb[k], type: .normal) {
        result[0] += 1
        bfs(j, i, rgb[k], &normalVisited, type: .normal)
      }
      
      // blind
      if k >= 1 { // G, B
        if !blindVisited[i][j], isSameColor(graph[i][j], rgb[k], type: .blind) {
          result[1] += 1
          bfs(j, i, rgb[k], &blindVisited, type: .blind)
        }
      }
    }
  }
}

print(result.map{String($0)}.joined(separator: " "))

func bfs(_ x: Int, _ y: Int, _ color: String, _ visited: inout [[Bool]], type: BlindCheck) {
  var queue = [(Int, Int)]()
  visited[y][x] = true
  queue.append((x, y))
  
  while !queue.isEmpty {
    let (cx, cy) = queue.removeFirst()
    
    for i in 0..<dx.count {
      let nx = dx[i] + cx
      let ny = dy[i] + cy
      
      if nx >= 0,
         nx < n,
         ny >= 0,
         ny < n,
         !visited[ny][nx],
         isSameColor(graph[ny][nx], color, type: type) {
        queue.append((nx, ny))
        visited[ny][nx] = true
      }
    }
  }
}

func isSameColor(_ graphColor: String, _ searchColor: String, type: BlindCheck) -> Bool {
  switch type {
  case .blind:
    if searchColor == "G" {
      return graphColor == "R" || graphColor == "G" ? true : false
    } else { // searchColor가 "B"인 경우
      return graphColor == searchColor ? true : false
    }
  case .normal:
    return graphColor == searchColor
  }
}

// MARK: - Note
/*
 - 적록색약: R과 G를 동일한 색으로 인식
 - graphColor와 searchColor가 같은지 여부만 다르고, 나머지 로직은 동일하므로, enum을 별도로 만들고, bfs함수 공통으로 사용
 - visited 배열은 각각 생성해야 함
 */
