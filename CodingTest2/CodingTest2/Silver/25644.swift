//
//  25644.swift
//  최대상승
//
//  Created by SeokHyun on 2/16/24.
//

let n = Int(readLine()!)!
var money = readLine()!.split{$0==" "}.map{Int(String($0))!}
var result = 0
var minimum = Int.max

for i in 0..<money.count {
  minimum = min(minimum, money[i])
  if money[i] > minimum {
    result = max(result, money[i]-minimum)
  }
}
print(result)

// MARK: - Note
/*
 - 시간복잡도
    - N이 최대 200_000이므로, O(N^2)알고리즘을 사용하면 시간 초과
    
 - minimum
    - for문 순회하면서 계속 확인
 - result
    - money[i]가 minimum보다 큰 경우 money[i] - minimum한 값의 max값
 */
