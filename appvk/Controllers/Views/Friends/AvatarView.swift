//
//  AvatarView.swift
//  appvk
//
//  Created by Дарья Шимко on 11.10.2020.
//

import UIKit

class AvatarView: UIView {

    var shadowRadius: CGFloat = 10 {
        didSet {
            self.configure()
            
        }
    }
    
    var shadowColor: CGColor = UIColor.black.cgColor {
        didSet {
            self.configure()
        }
    }
    
    var shadowOpacity: Float = 0.8 {
        
        didSet {
            self.configure()
        }
    }
    
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    func configure() {
        
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = .zero
        layer.shadowRadius  = 10
        
    }
  
}
