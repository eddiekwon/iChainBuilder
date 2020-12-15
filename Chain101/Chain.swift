//
//  X+Chain.swift
//  Chain101
//
//  Created by muzna on 2020/12/11.
//

import Foundation

class Chain<OriginType> {
    var origin: OriginType
    
    init(origin: OriginType) {
        self.origin = origin
    }
}

protocol Chainable{}
extension Chainable {
    var chain: Chain<Self> { // 타입은 나 자신의 타입, 즉 프로토콜 타입(==Chainable을 뜻함)
        return Chain(origin: self) // 나 자신instance를 넣는다.
    }
}
 
extension Int: Chainable {}

extension Chain where OriginType == Int {
    func add() -> Chain {
        origin += 1
        return self
    }
    func minus() -> Chain {
        origin -= 1
        return self
    }
}
