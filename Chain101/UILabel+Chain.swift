//
//  UILabel+Chain.swift
//  Chain101
//
//  Created by muzna on 2020/12/11.
//

import UIKit

//extension UILabel: Chainable {}

extension Chain where OriginType: UILabel {
    
    func text(_ text: String) -> Chain {
        origin.text = text
        return self
    }
    func textColor(_ color: UIColor) -> Chain {
        origin.textColor = color
        return self
    }
    func numOfLines(_ num: Int = 0) -> Chain {
        origin.numberOfLines = num
        return self
    }
   
}
