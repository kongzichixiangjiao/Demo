//
//  ViewController.swift
//  Demo
//
//  Created by 侯佳男 on 2018/4/19.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabel: UILabel = {
        let v = UILabel()
        return v
    }()
    
    var dataProvider: DataProviderProtocol?
    
    // MARK: View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider = dataProvider ?? DataProvider()
        
        dataProvider?.fetch(callback: { [unowned self] (data) -> Void in
            DispatchQueue.main.async {
                print(data)
                self.resultLabel.text = data
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func randomLessThanTen() -> Int {
        return Int(arc4random() % 10)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.navigationController?.pushViewController(BananaViewController(), animated: true)
    }
}


protocol DataProviderProtocol: class {
    func fetch(callback: @escaping (_ data: String) -> Void)
}

class DataProvider: NSObject, DataProviderProtocol {
    func fetch(callback: @escaping (String) -> Void) {
        let url = URL(string: "http://example.com/")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url, completionHandler: {
            (data, resp, err) in
            let string = String(data:Data(), encoding:String.Encoding.utf8)
            callback(string!)
        })
        task.resume()
    }
}

/** A delicious banana. Tastes better if you peel it first. */
public class Banana {
    private var isPeeled = false
    
    /** Peels the banana. */
    public func peel() {
        isPeeled = true
    }
    
    /** You shouldn't eat a banana unless it's been peeled. */
    public var isEdible: Bool {
        return isPeeled
    }
}

public func offer(banana: Banana) -> String {
    if banana.isEdible {
        return "Hey, want a banana?"
    } else {
        return "Hey, want me to peel this banana for you?"
    }
}
