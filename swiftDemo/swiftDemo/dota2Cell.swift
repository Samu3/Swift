//
//  dota2Cell.swift
//  swiftDemo
//
//  Created by 文智 王 on 16/4/16.
//  Copyright © 2016年 Samu33. All rights reserved.
//

import UIKit
import SDWebImage


class dota2Cell: UITableViewCell {
    @IBOutlet weak var accound_id: UILabel?
    @IBOutlet weak var hero_id: UILabel!
    @IBOutlet weak var kills: UILabel!
    @IBOutlet weak var deaths: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!

    @IBOutlet weak var assistant: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        

        
        // Initialization code
    }
    
    func setupWithModel(model:dota2Model){
        
        
        self.accound_id!.text = String(model.account_id);
        
        self.hero_id!.text = String(model.hero_id);
        
        self.kills!.text = String(model.kills);
        
        self.deaths!.text = String(model.deaths);
        
        self.assistant!.text = String(model.assists);
        
        let tupe = self.searchHeroNameWithID(model.hero_id as Int)
        
        self.hero_id!.text = String(tupe.1)
        
        let url : NSURL = NSURL(string: tupe.0)!
                
        self.imageView!.sd_setImageWithURL(url)
        

    }
    
    func searchHeroNameWithID(id:Int) -> (String,String){
        
        let dota2Model : dota2HeroModel = dota2HeroModel()
        
        let dota2HeroArray : NSArray = dota2Model.getDota2HeroData()
        
        let model : dota2HeroModel = dota2HeroArray.objectAtIndex(id-1) as! dota2HeroModel;
        
        return (model.url_small_portrait,model.localized_name);
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
