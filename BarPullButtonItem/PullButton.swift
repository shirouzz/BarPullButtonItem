//
//  PullButton.swift
//  BarPullButtonItem
//
//  Created by Shirouzu on 2018/07/07.
//  Copyright © 2018年 Shirouzu. All rights reserved.
//

import Foundation
import UIKit

/*
 Covering is Like Refresh Control Behavior.
 */
public class PullButton: BasePullButton {
    
    // MARK: Properties for pressing animation
    private var isHideCover = false
    public var isActAfterAnime = false
    public var animeDuration = 0.2
    
    // MARK:- Scroll Cover
    private var beginCoverY: CGFloat = -10000
    private var releaseY: CGFloat = -10000
    
    public func beginDragging(y: CGFloat){
        isHideCover = false
        if beginCoverY <= y {
            beginCoverY = min(y, initY)
        }
        releaseY = -10000
    }
    
    public func didScroll(y: CGFloat){
        if isHideCover {return}
        if releaseY > beginCoverY{
            cover?.isHidden = true
            beginCoverY = -10000
            return
        }else{
            cover?.isHidden = false
        }

        let distanceDividedByEnterDistance = CGFloat((Double(y)-Double(beginCoverY))/Double(distanceToPress))

        if distanceDividedByEnterDistance <= 1.0 {
            cover?.scrollHollowLayer(rate: distanceDividedByEnterDistance)
            cover?.changeSize(rate: 1.0)
            
        }else{
            cover?.scrollHollowLayer(rate: 1.0)
            if distanceDividedByEnterDistance <= 1.6{
                cover?.changeSize(rate: 1+(distanceDividedByEnterDistance-1)*1/3)
            }else{
                cover?.changeSize(rate: 1.2)
            }
        }
    }

    public func endDragging(y: CGFloat){
        if (cover?.isHidden)! {return}
        
        if y <= beginCoverY+distanceToPress {
            isHideCover = true
            
            if !isActAfterAnime {
                self.sendActions(for: .touchUpInside)
            }
            
            cover?.pressAnimation(duration: animeDuration) {
                if self.isActAfterAnime {
                    self.sendActions(for: .touchUpInside)
                }
            }
            
        }
        releaseY = y
    }
    
    
}

