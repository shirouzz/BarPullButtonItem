//
//  ViewController.swift
//  BarPullButtonItemExample
//
//  Created by Tatsuya Shirouzu on 2018/07/06.
//  Copyright © 2018年 Tatsuya Shirouzu. All rights reserved.
//

import UIKit
import BarPullButtonItem

class ViewController: UITableViewController {
    
    let pullButton = PullButton(image: UIImage(named: "stop")!, coverColor: UIColor.white, coverImageColor: UIColor.blue)
    let pullButton2 = SpringPullButton(image: UIImage(named: "stop")!, coverColor: UIColor.white, coverImageColor: UIColor.blue)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BarPullButtonItem"
        
        pullButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        let pullItem = UIBarButtonItem(customView: pullButton)
        let pullItem2 = UIBarButtonItem(customView: pullButton2)
        
        navigationItem.leftBarButtonItem = pullItem
        navigationItem.rightBarButtonItem = pullItem2
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: Scroll View
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        pullButton.beginDragging(y: scrollView.contentOffset.y)
        pullButton2.beginDragging(y: scrollView.contentOffset.y)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pullButton.didScroll(y: scrollView.contentOffset.y)
        pullButton2.didScroll(y: scrollView.contentOffset.y)
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        pullButton.endDragging(y: scrollView.contentOffset.y)
        pullButton2.endDragging(y: scrollView.contentOffset.y)
    }
    
    
    
    // MARK: Table View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    
    // MARK: action
    @objc func action(){
        let sheet = UIAlertController(title: String(describing: "Action"),
                                      message: nil,
                                      preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(cancel)
        present(sheet, animated: true, completion: nil)
    }

}

