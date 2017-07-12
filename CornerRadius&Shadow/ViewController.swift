//
//  ViewController.swift
//  CornerRadius&Shadow
//
//  Created by ju on 2017/7/12.
//  Copyright © 2017年 ju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


/**
  If inherit like:
  CornerShadowView: UIView {}
  set: view.backgroundColor = UIColor.clear
 */

// MARK: - Corner radius and Shadow effect
@IBDesignable
class CornerShadowButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 22 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 3 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 0.9 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = UIColor.black {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    var fillColor: UIColor = UIColor.black {
        didSet {
            layoutIfNeeded()
        }
    }
    
    private var shadowLayer: CAShapeLayer!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.cornerRadius = cornerRadius
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            layer.insertSublayer(shadowLayer, at: 0)
            
        }
        
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowRadius = shadowRadius
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.shadowPath = shadowLayer.path
    }
    
}

