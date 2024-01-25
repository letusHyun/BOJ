//
//  16987.swift
//  계란으로 계란치기
//
//  Created by SeokHyun on 1/22/24.
//

/*
 자신의 내구도 - 상대 무게 > 0 이면, 깨지지 않는다.
 자신의 내구도 - 상대 무데 < 0 이면, 깨진다.
 */
let n = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: n) // 0: 내구도, 1: 무게
var result = 0
_=(0..<n).map{ arr[$0] = readLine()!.split{$0==" "}.map{Int(String($0))!}}

// 깨진 계란은 내려놓고 오른쪽
func dfs(_ i: Int, _ count: Int) {
  if i == n {
    result = max(result, count)
    return
  }
  
  if arr[i][0] <= 0 { // 현재 계란이 깨졌다면
    dfs(i+1, count) // 내려놓고 다음 계란으로 이동
  } else { // 현재 계란이 깨지지 않았다면
    
    var flag = false // 한번도 안깨진 경우
    
    for j in 0..<n { // 다른 계란들이랑 부딪히기
      if i == j || arr[j][0] <= 0 { // 내 계란 스스로 깨기 x, 상대방 계란 깨졌으면 다음 계란으로 이동
        continue
      }
      flag = true
      arr[i][0] -= arr[j][1]
      arr[j][0] -= arr[i][1]
      let cnt1 = arr[i][0] <= 0 ? 1 : 0 // 내 계란 깨졌으면 counting
      let cnt2 = arr[j][0] <= 0 ? 1 : 0 // 상대방 계란 깨졌으면 counting
      
      dfs(i+1, count + cnt1 + cnt2)
      // 원상복구
      arr[i][0] += arr[j][1]
      arr[j][0] += arr[i][1]
    }
    
    if !flag { // 한번도 안깨진 경우, 다음으로 넘김
      dfs(i+1, count)
    }
  }
}

dfs(0, 0)
print(result)
