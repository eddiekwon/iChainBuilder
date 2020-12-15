//
//  ViewController.swift
//  Chain101
//
//  Created by muzna on 2020/12/11.
//

import UIKit

class ViewController: UIViewController {
    
    // 언더바를 쓰지 않으려면 요렇게 쓰는 수 밖에?
    lazy var orangeLabel = {
        UILabel().chain
            .background(color: .orange)
            .debugBorder()
            .add(to: self.view)
            .autolayout(width: 300, height: 50)
            .autolayout(x: 20, y: 222)
            .origin
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let new = 100.chain
            .add()
            .add()
            .add()
        print("num:\(new.origin)")
        
        addView()
        addLabel()
        
        // 하단 선 추가한 view
        addViewBottomLine()
        
        orangeLabel.text = "gaga"
    }
    
    func addView() {
        let aView = UIView()
        _ = aView.chain
            .add(to: view)
            .autolayoutHalf()
            .background(color: UIColor.green.withAlphaComponent(0.4))
            .cornerRadius(46)
            .debugBorder()
    }
    
    func addViewBottomLine() {
        _ = UIView().chain
            .add(to: view)
            .autolayout(x: 50, y: 50)
            .autolayout(width: 100, height: 40)
            .background(color: UIColor.yellow.withAlphaComponent(0.4))
            .borderBottom(height: 3, color: .black)
    }
    
    func addLabel() {
        let aLabel = UILabel()
        _ = aLabel.chain
            .add(to: view)
            .autolayout(x: 100, y: 100)
            .autolayout(width: 100, height: 20)
            .text("hello")
            .background(color: .blue)
    }
    
    
}
