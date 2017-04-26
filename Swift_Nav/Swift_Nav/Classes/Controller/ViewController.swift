//
//  ViewController.swift
//  Swift_Nav
//
//  Created by 田彬彬 on 2017/4/26.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit
import Alamofire

private let kViewHomeCell = "kViewHomeCell"

class ViewController: UIViewController {

    // mark 懒加载属性
    fileprivate lazy var newsModels:[NewsModel] = [NewsModel]()
    
    fileprivate lazy var tableview :UITableView = {[unowned self] in
    
        let tableview = UITableView()
        
        tableview.frame = self.view.bounds
        tableview.dataSource = self
        tableview.rowHeight = 100

        tableview.register(UINib(nibName: "NewViewTableViewCell", bundle: nil), forCellReuseIdentifier: kViewHomeCell)
        
        
        
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNavgationbar()
        
        view.addSubview(tableview)
        
        loadData()
       
    }
    

    
}

// 设置ui 界面
extension ViewController {

   fileprivate  func setUpNavgationbar(){
        
        // 设置背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: .default)
        
        // 设置标题
        navigationItem.titleView = UIImageView(image: UIImage(named: ""))
        
        // 设置搜索按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: ""), style: .plain, target: self, action: #selector(searchItemClick))
    
    
    }
    
}

// 时间的监听
extension ViewController{

    // @objc --> 为了保留oc 的特性
    @objc fileprivate func searchItemClick() {
        
        print("点击了搜索")
        
    }
}

// 网络数据请求
extension ViewController{

    fileprivate func loadData(){
    
        NetWorkTools.requestData(URLStrig: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (reslut:Any) in
            
            print(reslut)
            
           // 将any 转换成 字典
           guard let resultDict = reslut as? [String:Any] else {return}
            
        // 根据T1348649079062 key 取出响应的内容
           guard let dataArrary = resultDict["T1348649079062"] as? [[String:Any]] else {return}
           
          // 遍历字典转换成模型对象
            for dict in dataArrary{
            
                self.newsModels.append(NewsModel(dict: dict))
            
            }
            
            // 刷新表格
            self.tableview.reloadData()
        }
    
    }

}

// 实现数据源
extension ViewController:UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell =  tableview.dequeueReusableCell(withIdentifier: kViewHomeCell, for: indexPath) as! NewViewTableViewCell
        
        // 赋值
        cell.newModel = newsModels[indexPath.row]
        
        return cell
    }


}
