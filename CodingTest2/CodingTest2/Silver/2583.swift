//
//  2583.swift
//  영역 구하기
//
//  Created by SeokHyun on 1/28/24.
//

let mnk = readLine()!.split{$0==" "}.map{Int(String($0))!}
let m = mnk[0] // height
let n = mnk[1] // width
let k = mnk[2] // rect count
// column 0: startX, 1: startY, 2: endX, 3: endY
var coordinate = Array(repeating: [Int](), count: k)
_=(0..<k).map{coordinate[$0] = readLine()!.split{$0==" "}.map{Int(String($0))!}}
var graph = Array(repeating: Array(repeating: 0, count: n), count: m)
var result = [Int]()
var size = 0
let dx = [0,1,0,-1]
let dy = [-1,0,1,0]

for l in 0..<k {
  for i in coordinate[l][1]...(coordinate[l][3]-1) { // startY...(endY-1)
    for j in coordinate[l][0]...(coordinate[l][2]-1) { // startX...(endX-1)
      graph[i][j] = 1
    }
  }
}

for i in 0..<m {
  for j in 0..<n {
    if graph[i][j] == 0 {
      result.append(dfs(j, i))
      size = 0
    }
  }
}

print(result.count)
print(result.sorted().map{String($0)}.joined(separator: " "))

func dfs(_ x: Int, _ y: Int) -> Int {
  graph[y][x] = 1
  size += 1
  
  for i in 0..<dx.count {
    let nx = x+dx[i]
    let ny = y+dy[i]
    if nx >= 0, nx < n, ny >= 0, ny < m, graph[ny][nx] == 0 {
      _=dfs(nx, ny)
    }
  }
  return size
}

// MARK: - Note
/*
 - 먼저 좌표를 이용해 사각형을 그려야 한다.
    - 좌표를 배열의 index로 변환해주었다. 이때 왼쪽 아래 꼭짓점의 x,y는 index로 그대로 사용하고, 오른쪽 위 꼭짓점의 x,y좌표를 각 -1을 해주어서 index로 사용했다. 이렇게 되면 x축 대칭이 되지만, size를 구할땐 문제가 되지 않기 때문에 이렇게 진행했다.
 - 이후 dfs 수행
 */
