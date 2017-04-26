//
//  NewsModel.swift
//  Swift_Nav
//
//  Created by 田彬彬 on 2017/4/26.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

class NewsModel: NSObject {

    var replyCount : Int = 0
    var title : String = ""
    var source : String = ""
    var imgsrc : String = ""
    
    
    // 定义一个字典转模型的狗仔函数
    init(dict: [String:Any]) {
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
