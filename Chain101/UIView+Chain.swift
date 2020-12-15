//
//  UIView+Chain.swift
//  Chain101
//
//  Created by muzna on 2020/12/11.
//

import UIKit

enum Autolayout {
    case full
    case half
}
extension UIView: Chainable{}
extension Chain where OriginType: UIView {

    // MARK: 색상, 외곽선 설정

    func background(color: UIColor) -> Chain {
        origin.backgroundColor = color
        return self
    }
    
    func cornerRadius(_ r: CGFloat) -> Chain {
        origin.layer.cornerRadius = r
        origin.clipsToBounds = true
        return self
    }
   
    func border(_ color: UIColor = .black, width: CGFloat = 1.0) -> Chain {
        origin.layer.borderWidth = width
        origin.layer.borderColor = color.cgColor
        return self
    }
    
    // MARK: 하단 라인 그리기.
    func borderBottom(height: CGFloat = 1, color: UIColor = .black) -> Chain {
        //MARK: Setup Bottom-Border
        origin.translatesAutoresizingMaskIntoConstraints = false
        let bottomBorder = UIView(frame: .zero)
        bottomBorder.backgroundColor = color
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        origin.addSubview(bottomBorder)
        
        //Mark: Setup Anchors
        bottomBorder.bottomAnchor.constraint(equalTo: origin.bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: origin.rightAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: height).isActive = true

        return self
    }
    
    // only for debug
    func debugBorder(_ color: UIColor = .red) -> Chain {
        origin.layer.borderWidth = 0.5
        origin.layer.borderColor = color.cgColor
        return self
    }
     
    // MARK: 오토레이아웃
    
    func add(to parent: UIView) -> Chain {
        parent.addSubview(origin)
        return self
    }
    
    func autolayoutFull() -> Chain {
        
        guard let superView = origin.superview else {
            fatalError("add to superview first")
        }
        origin.translatesAutoresizingMaskIntoConstraints = false
        
        let edges: [NSLayoutConstraint] = [
            origin.topAnchor.constraint(equalTo: superView.topAnchor),
            origin.leftAnchor.constraint(equalTo: superView.leftAnchor),
            origin.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            origin.rightAnchor.constraint(equalTo: superView.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(edges)
        return self
    }
    
    func autolayoutHalf() -> Chain {
        
        guard let superView = origin.superview else {
            fatalError("add to superview first") 
        }
        origin.translatesAutoresizingMaskIntoConstraints = false
        
        let edges: [NSLayoutConstraint] = [
            origin.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: 0.5),
            origin.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: 0.5),
            origin.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            origin.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(edges)
        return self
    }
    
    func autolayout(x: CGFloat, y: CGFloat) -> Chain {
        
        guard let superView = origin.superview else {
            fatalError("add to superview first")
        }
        origin.translatesAutoresizingMaskIntoConstraints = false
        
        let edges: [NSLayoutConstraint] = [
            origin.topAnchor.constraint(equalTo: superView.topAnchor, constant: x),
            origin.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: y)
             
        ]
        
        NSLayoutConstraint.activate(edges)
        return self
    }
    
    func autolayout(width: CGFloat, height: CGFloat) -> Chain {
        
        guard origin.superview != nil else {
            fatalError("add to superview first")
        }
        origin.translatesAutoresizingMaskIntoConstraints = false
        
        let edges: [NSLayoutConstraint] = [
            origin.widthAnchor.constraint(equalToConstant: width),
            origin.heightAnchor.constraint(equalToConstant: height)
        ]
        
        NSLayoutConstraint.activate(edges)
        return self
    }
}
