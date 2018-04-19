//
//  DemoTests.swift
//  DemoTests
//
//  Created by 侯佳男 on 2018/4/19.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import XCTest
@testable import Demo
// 1、Xcode 中具体操作方法：选中你的项目，选择 "Build Settings" 选项列表，选中 "Defines Modules" 行，修改其值为 "Yes"。
// 2、在单元测试中添加 @testable import YourAppModuleName。这会把所有 public 和 internal (默认访问修饰符) 修饰符暴露给测试代码。但 private 修饰符仍旧保持私有。
class DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            for i in 0..<10000 {
                print(i)
            }
        }
    }
    
    func testAsyncFunction() {
        let expectation = self.expectation(description: "Just a demo expectation,should pass")
        DispatchQueue.global().async {
            sleep(1)
            print("Async test")
            XCTAssert(true, "should pass")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10) { (error) in
            print(error ?? "")
        }
    }
    
    func testModelFunc_randomLessThanTen() {
        let vc = ViewController()
        let num = vc.randomLessThanTen()
        XCTAssert(num < 10, "num should less than 10")
    }
    
}
