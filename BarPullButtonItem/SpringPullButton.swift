//
//  SecondPullButton.swift
//  BarPullButtonItem
//
//  Created by Shirouzu on 2018/07/07.
//  Copyright © 2018年 Shirouzu. All rights reserved.
//

import Foundation
import UIKit

/*
 Covering 1/3 distance when scrolling without dragging. 
 Users easier to aware to select button than PullButton.
 But, this might the eyesore.
 */
public class SpringPullButton: BasePullButton {
    
    private var isScrollResist = false
    
    public func beginDragging(y: CGFloat){
        isStopCovering = false
        isScrollResist = false
    }
    
    public func didScroll(y: CGFloat){
        if isStopCovering {return}
        cover?.isHidden = y > initY
        if (cover?.isHidden)! {return}
        
        let distanceDividedByEnterDistance = CGFloat((Double(y)-Double(initY))/Double(distanceToPress))
        
        if isScrollResist == true{
            cover?.scrollHollowLayer(rate: distanceDividedByEnterDistance/3)
            cover?.changeSize(rate: 1.0)
            return
        }
        
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
        if isScrollResist{return}
        
        if y <= initY+distanceToPress {
            isStopCovering = true
            
            if !actionAfterAnimation {
                self.sendActions(for: .touchUpInside)
            }
            
            cover?.pressAnimation(duration: animationDuration) {
                if self.actionAfterAnimation {
                    self.sendActions(for: .touchUpInside)
                }
            }
        }
        isScrollResist = y > initY
    }
    
    
}





