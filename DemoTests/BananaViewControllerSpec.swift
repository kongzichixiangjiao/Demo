//
//  BananaViewControllerSpec.swift
//  DemoTests
//
//  Created by 侯佳男 on 2018/4/19.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import Demo

class BananaViewControllerSpec: QuickSpec {
    
    override func spec() {
        var viewController: BananaViewController!
        beforeEach {
            viewController = BananaViewController()
        }
        
        describe(".viewDidLoad()") {
            beforeEach {
                // Method #1: Access the view to trigger BananaViewController.viewDidLoad().
                let _ =  viewController.view
            }
            
            it("sets the banana count label to zero") {
                // Since the label is only initialized when the view is loaded, this
                // would fail if we didn't access the view in the `beforeEach` above.
                expect(viewController.bananaCountLabel.text).to(equal("0"))
            }
        }
        
        describe("the view") {
            beforeEach {
                // Method #2: Triggers .viewDidLoad(), .viewWillAppear(), and .viewDidAppear() events.
                viewController.beginAppearanceTransition(true, animated: false)
                viewController.endAppearanceTransition()
            }
        }
        
        describe(".viewWillDisappear()") {
            beforeEach {
                // Method #3: Directly call the lifecycle event.
                viewController.viewWillDisappear(true)
            }
            afterEach {
                
            }
        }
        
        describe("the 'morr bananas' button") {
            it("increments the banana count label when tapped", closure: {
                viewController.moreButton.sendActions(for: .touchUpInside)
                expect(viewController.bananaCountLabel.text).to(equal("1"))
            })
        }
    }
}

