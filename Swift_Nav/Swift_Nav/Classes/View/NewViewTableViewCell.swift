//
//  NewViewTableViewCell.swift
//  Swift_Nav
//
//  Created by 田彬彬 on 2017/4/26.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit
import Kingfisher



class NewViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconimageV: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var counlb: UILabel!
    @IBOutlet weak var fromlb: UILabel!
    
    
    // 定义模型属性
    var newModel :NewsModel? {
    
      didSet{

        titleLb.text = newModel?.title
        fromlb.text = newModel?.source
        
        // 如果 newModel?.replyCount 为空 那么直接就是0
        counlb.text = "\(newModel?.replyCount ?? 0)"
        
        let iconurl = URL(string: newModel?.imgsrc ?? "")
        iconimageV.kf.setImage(with: iconurl)
        
     }
        
    
    }
}
