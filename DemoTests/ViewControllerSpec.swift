//
//  ViewControllerSpec.swift
//  DemoTests
//
//  Created by 侯佳男 on 2018/4/19.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import Demo

class ViewControllerSpec: QuickSpec {
    override func spec() {
        describe("fetch data with data provider") {
            let mockProvier = MockDataProvider()
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            viewController.dataProvider = mockProvier
            
            expect(mockProvier.fetchCalled).to(equal(false))
            
            let _ = viewController.view
            
            expect(mockProvier.fetchCalled).to(equal(true))
        }
    }
}

class MockDataProvider: NSObject, DataProviderProtocol {
    
    var fetchCalled = false
    func fetch(callback: @escaping (_ data: String) -> Void) {
        fetchCalled = true
        callback("foobar")
    }
    
}
