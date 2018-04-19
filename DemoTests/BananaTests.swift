//
//  BananaTests.swift
//  DemoTests
//
//  Created by 侯佳男 on 2018/4/19.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import XCTest
@testable import Demo
// 注意，我们为每个 if 条件单独写了一个测试。在我们写测试时，确保每个条件都能被测试，是一个好的模式。
class BananaTests: XCTestCase {
    
    var banana = Banana()
    var peelBanana = BananaHelpers().createNewPeeledBanana()
    
    func testPeel_makesTheBananaEdible() {
        let banana = Banana()
        banana.peel()
        
        XCTAssertTrue(banana.isEdible)
    }
    
    func testOffer_whenTheBananaIsPeeled_offersTheBanana() {
        
        let message = offer(banana: peelBanana)
        
        XCTAssertEqual(message, "Hey, want a banana?")
    }
    
    func testOffer_whenTheBananaIsntPeeled_offersToPeelTheBanana() {
        let message = offer(banana: banana)
        
        XCTAssertEqual(message, "Hey, want me to peel this banana for you?")
    }
    
    func aa() {
        
    }
}

class BananaHelpers: Banana {
    internal func createNewPeeledBanana() -> Banana {
        let banana = Banana()
        banana.peel()
        return banana
    }
}
