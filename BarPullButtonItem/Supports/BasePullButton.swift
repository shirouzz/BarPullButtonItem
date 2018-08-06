//
//  BasePullButton.swift
//  BarPullButtonItem
//
//  Created by Shirouzu on 2018/07/07.
//  Copyright © 2018年 Shirouzu. All rights reserved.
//

import UIKit

public class BasePullButton: UIButton {
    
    internal var cover: PullCover?
    
    // MARK; Scroll Cover Property
    public var initY = -(UIApplication.shared.statusBarFrame.height+44)
    public var distanceToPress: CGFloat = -60
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required public init(image: UIImage, coverColor: UIColor, coverImageColor: UIColor){
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        
        setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        
        cover = PullCover(image: image, backgroundColor: coverColor, tintColor: coverImageColor)
        addSubview(cover!)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        cover?.center = CGPoint(x: frame.width/2, y: frame.height/2)
    }
    
    
}




