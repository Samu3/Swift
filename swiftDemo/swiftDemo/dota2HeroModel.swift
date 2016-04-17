//
//  dota2HeroModel.swift
//  swiftDemo
//
//  Created by 文智 王 on 16/4/17.
//  Copyright © 2016年 Samu33. All rights reserved.
//

import UIKit

class dota2HeroModel: NSObject {
    
    
    var localized_name :String!
    var id :NSNumber!
    
    var url_small_portrait:String!
    
    var url_large_portrait:String!

    var name:String!

    var url_full_portrait:String!

    var url_vertical_portrait:String!

    
    let dota2Array : NSMutableArray = NSMutableArray()
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == id{
            self.id = value as! NSNumber
        }
    }
    
    func instance(dic:NSDictionary){
        
        self.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
    }
    
    func getDota2HeroData() -> NSArray{
        
        
        let path :String! = NSBundle.mainBundle().pathForResource("heroes", ofType: "json")
        
        let data:NSData = NSData(contentsOfFile: path)!
        
        
        do {
            let json: AnyObject! = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            
            let jsonDic : NSDictionary = json as! NSDictionary
            
            let jsonArr : NSArray = jsonDic["heroes"] as! NSArray
            
            for dic in jsonArr{
                
                let model :dota2HeroModel = dota2HeroModel()
                
                model.instance(dic as! NSDictionary)
                
                dota2Array.addObject(model)
                
            }
            
            

        } catch {
            print("error")
        }
        
        return dota2Array


    }

}
