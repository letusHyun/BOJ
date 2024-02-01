//
//  1987.swift
//  알파벳
//
//  Created by SeokHyun on 1/29/24.
//

let rc = readLine()!.split{$0==" "}.map{Int(String($0))!}
let r = rc[0] // height
let c = rc[1] // width
var graph = Array(repeating: [Int](), count: r)
_=(0..<r).map{
  graph[$0]=readLine()!.map{Int(UnicodeScalar(String($0))!.value)-65}
}
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var result = 0

dfs(0, 0, 1, bit: 1 << graph[0][0])
print(result)

func dfs(_ x: Int, _ y: Int, _ count: Int, bit: Int) {
  result = max(result, count)
  
  for i in 0..<dx.count {
    let nx = dx[i] + x
    let ny = dy[i] + y
    
    if nx>=0, nx<c,
       ny>=0, ny<r {
      let nBit = 1 << graph[ny][nx] // 알파벳을 Int로 환산한 값 만큼 왼쪽으로 shift
      if bit & nBit == 0 { // 다음 순회할 경로에 있는 알파벳을 사용한 적이 없다면
        dfs(nx, ny, count+1, bit: bit | nBit)
      }
    }
  }
}

// MARK: - Note
/*
 - 비트 연산자 사용해서 방문 체크해야 시간초과 나지 않음
    - ex) 1 << 3: 1비트를 왼쪽으로 3번 shift
 - 아스키코드값을 이용해서 그래프에 알파벳을 0~25의 Int로 변환
 - dfs
 
 - bit & nBit == 0
    - 의미: 두 값의 비드 단위가 겹치는 경우가 없다면
 */
