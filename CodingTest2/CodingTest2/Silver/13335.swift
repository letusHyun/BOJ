//
//  13335.swift
//  트럭
//
//  Created by SeokHyun on 1/25/24.
//

let nwl = readLine()!.split{$0==" "}.map{Int(String($0))!}
let n = nwl[0]
let w = nwl[1] // 다리 길이
let l = nwl[2] // 최대 하중

var trucks = readLine()!.split{$0==" "}.map{Int(String($0))!}
var sum = 0
var queue = [(Int, Int)]() // 트럭 무게, 다리 진입한 시각
var time = 0

repeat {
  if let queueFirst = queue.first {
    if time - w == queueFirst.1 {
      sum -= queue.removeFirst().0
    }
  }
  
  if let trucksFirst = trucks.first {
    if sum + trucksFirst <= l, queue.count < w {
      sum += trucksFirst
      queue.append((trucks.removeFirst(), time))
    }
  }
  time += 1
} while !queue.isEmpty

print(time)

/*
 최대하중을 넘으면, enqueue 불가능
 enqueue는 언제 가능? -> 최대하중을 넘지않을 때 && enqueue 최대개수 넘지 않을 때
 dequeue는 언제? -> 다리를 빠져나갈 때 -> 들어오고, 트럭이 들어오고 나서 다리의 길이 초를 넘기면
 
 if 현재초 - 다리길이 = 해당 트럭이 다리에 들어왔을때의 시간: dequeue
 */
