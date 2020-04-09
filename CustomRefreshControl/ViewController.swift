//
//  ViewController.swift
//  CustomRefreshControl
//
//  Created by 李贺 on 2020/4/7.
//  Copyright © 2020 Heli. All rights reserved.
//

import UIKit

private let CELLID: String = "CELL_ID"

class ViewController: UIViewController {

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // 添加刷新控件
        tableView.addSubview(refreshControl)
        // 监听刷新事件
        refreshControl.addTarget(self, action: #selector(refreshAction), for: UIControl.Event.valueChanged)
    }
    
    @objc private func refreshAction() {
        // 模仿网络请求数据
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 3) {
            // 数据请求结束, 结束刷新动画
            self.refreshControl.endRefreshing()
        }
    }

    // MARK: 懒加载列表页面
    private lazy var tableView: UITableView = {
        let tab = UITableView()
        tab.dataSource = self
        tab.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CELLID)
        return tab
    }()
    
    // MARK: 懒加载自定义刷新控件
    private lazy var refreshControl: RefreshControl = RefreshControl()
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELLID, for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
}
