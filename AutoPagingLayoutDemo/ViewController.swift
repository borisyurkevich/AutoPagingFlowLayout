//
//  ViewController.swift
//  AutoPagingLayoutDemo
//
//  Created by hooge on 16/5/20.
//  Copyright © 2016年 hooge. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let demoCell = "DemoCell"
    let matrix:[(rowCount:Int, columnCount:Int)] =
        [(1, 1), (1, 2), (2, 2),(3,3),(4, 4),(2,3),(3,4),(2, 4),(1, 3), (0,0)]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: demoCell)
    }

}


extension ViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matrix.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: demoCell)
        let title = "\(matrix[indexPath.row].rowCount)行\(matrix[indexPath.row].columnCount)列"
        cell?.textLabel?.text = title
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DemoCollectionViewController(matrix: self.matrix[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
