//
//  secondViewController.swift
//  swiftDemo
//
//  Created by 文智 王 on 16/4/16.
//  Copyright © 2016年 Samu33. All rights reserved.
//

import UIKit
typealias sendValueClosure = (string:String) ->Void

class secondViewController: UIViewController {
    
    var myblock : sendValueClosure?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var btnClick: UIButton!

    @IBAction func btnClick(sender: AnyObject) {
        
        if (myblock != nil){
            myblock!(string: "okok");
        }
        
        let model = dota2HeroModel()
        
        let array : NSArray =  model.getDota2HeroData()
        
        print(array)
    }
    
    func abbb(abb:sendValueClosure){
        myblock = abb;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
