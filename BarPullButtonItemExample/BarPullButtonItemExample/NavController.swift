
//
//  NavController.swift
//  BarPullButtonItemExample
//
//  Created by Tatsuya Shirouzu on 2018/07/06.
//  Copyright © 2018年 Tatsuya Shirouzu. All rights reserved.
//

import UIKit

class NavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor.blue
        navigationBar.tintColor = UIColor.white
        navigationBar.barStyle = .black
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
