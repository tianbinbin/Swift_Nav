//
//  NetWorkTools.swift
//  Swift_Nav
//
//  Created by 田彬彬 on 2017/4/26.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
  
    case get
    case post
}

class NetWorkTools {
    
    class func requestData(URLStrig:String,type:MethodType,parameters:[String:Any]? = nil,finishCallBack:@escaping(_ result:Any)->()){
        
        let method =  type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLStrig, method: method, parameters: parameters).responseJSON { (response) in
            
            // 校验结果
            /*
            if let result = response.result.value {
            
                finishCallBack(result)
            
            }else{
            
                print(response.result.error)
            }
            */
            
            guard let result = response.result.value  else {
            
                 print(response.result.error)
                return
            }
            
            
            //  将结果回调回去
            finishCallBack(result)
            
            
        }
    }

}
