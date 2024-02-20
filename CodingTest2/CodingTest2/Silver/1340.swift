//
//  1340.swift
//  CodingTest2
//
//  Created by SeokHyun on 2/19/24.
//

let m = ["January", "February", "March", "April", "May", "June",
             "July", "August", "September", "October", "November", "December"]
let input = readLine()!.split{$0==" "}.map{String($0)}
let month = input[0]
let day = Int(input[1].dropLast())!
let year = Int(input[2])!
let hm = input[3].split{$0==":"}.map{Int(String($0))!}
let hour = hm[0], minute = hm[1] // "00"을 Int형변환하면 0이 됨
var months = [31,28,31,30,31,30,31,31,30,31,30,31]
var totalMin: Double = 0
if year%400 == 0 || year%4 == 0 && year%100 != 0 { // 윤년은 366일
  months[1] = 29
  totalMin = 366*24*60
} else {
  totalMin = 365*24*60
}

var curMin: Double = 0
for i in 0..<m.count {
  if m[i] == month {
    for j in stride(from: 0, to: i, by: 1) { // month 이전 달까지 계산
      curMin += Double(months[j]*24*60)
    }
    curMin += Double((day-1)*24*60)
    curMin += Double(hour*60)
    curMin += Double(minute)
    break
  }
}
print(curMin/totalMin*100)

// MARK: - Note
/*
 이전 month까지 더해주고 현재 day를 더해야 한다.
 이전 day까지 더해주고, 현재 hour를 더해야 한다.
 */
