//
//  dota2Model.swift
//  swiftDemo
//
//  Created by 文智 王 on 16/4/16.
//  Copyright © 2016年 Samu33. All rights reserved.
//

import Foundation


class dota2Model : NSObject {
    
    
    var account_id : NSString!;
    
    var hero_id :NSNumber!;
    
    var kills :NSString!;
    
    var deaths : NSString!;
    
    var assists :NSString!;
    
    var asdasd: NSString!;
    
    
    func instance(dic :NSDictionary){
        
        
        self.setValuesForKeysWithDictionary(dic as! [String : AnyObject]);
        
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}