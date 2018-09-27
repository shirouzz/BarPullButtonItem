//
//  PullCover.swift
//  BarPullButtonItem
//
//  Created by Shirouzu on 2018/07/07.
//  Copyright © 2018年 Shirouzu. All rights reserved.
//

import Foundation
import UIKit

public class PullCover: UIImageView {
    
    private let initSize = CGSize(width: 30, height: 30)
    
    //MARK:- イニシャライザ
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required public init(image: UIImage, backgroundColor: UIColor, tintColor: UIColor){
        super.init(frame: CGRect(origin: CGPoint.zero, size: initSize))
        
        isHidden = true
        
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.image = image.withRenderingMode(.alwaysTemplate)
        
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
        layer.mask = hollowLayer
    }
    
    private lazy var hollowLayer = { () -> CAShapeLayer in
        let lay = CAShapeLayer()
        lay.bounds.size = initSize
        
        let path =  UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: initSize.width, height: initSize.height), cornerRadius: 0)
        path.append(UIBezierPath(rect: (lay.bounds)))
        lay.path = path.cgPath
        
        lay.position = CGPoint(
            x: initSize.width/2,
            y: initSize.height/2
        )
        lay.fillRule = kCAFillRuleEvenOdd
        
        return lay
    }()
    
    internal func changeSize(rate: CGFloat){
        if rate == 1.0{
            layer.mask = hollowLayer
        }else{
            layer.mask = nil
        }
        frame.size = CGSize(width: initSize.width*rate, height: initSize.height*rate)
        layer.cornerRadius = frame.height/2
    }
    
    
    internal func scrollHollowLayer(rate: CGFloat){
        let he = initSize.height * (1-rate)
        let path =  UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: initSize.width, height: he), cornerRadius: 0)
        path.append(UIBezierPath(rect: (hollowLayer.bounds)))
        hollowLayer.path = path.cgPath
    }
    
    
    internal func pressAnimation(duration: Double, completion: (() -> Void)?){
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
            let trans = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.transform = trans
            
        }) { (_) in
            self.isHidden = true
            self.alpha = 1
            let trans = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.transform = trans
            self.changeSize(rate: 1.0)
            self.scrollHollowLayer(rate: 0.0)
            completion?()
        }
    }
    
    
}

