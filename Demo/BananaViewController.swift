//
//  BananaViewController.swift
//  Demo
//
//  Created by 侯佳男 on 2018/4/19.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import UIKit

class BananaViewController: UIViewController {

    var bananaCountLabel: UILabel = {
        let v = UILabel()
        v.text = "0"
        return v
    }()
    
    var moreButton: UIButton = {
        let v = UIButton()
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-------------")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("-----viewWillDisappear------")
    }
}
