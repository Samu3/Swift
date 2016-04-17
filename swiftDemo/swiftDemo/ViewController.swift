//
//  ViewController.swift
//  swiftDemo
//
//  Created by 文智 王 on 16/4/16.
//  Copyright © 2016年 Samu33. All rights reserved.
//

import UIKit
import AFNetworking
import ReactiveCocoa

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    let dota2Array : NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var tableView: UITableView!
    
    var id :String!
    
    
    let searchBar :UITextField = UITextField(frame: CGRectMake(10, 0, UIScreen.mainScreen().bounds.size.width-20, 40));

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "dota2Cell", bundle: nil), forCellReuseIdentifier: "cell");
        
        tableView.rowHeight = 138;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        tableView.tableHeaderView = searchBar
        
        searchBar.layer.masksToBounds = true;
        
        searchBar.layer.borderWidth = 2;
        
        searchBar.text! = "2283370726";
        
        self.view.addSubview(tableView);
       
        
        searchBar.rac_textSignal().subscribeNext { (text) -> Void in
            print(text);
            
            self.id = text as! String
        }
        
    
    
    }
    
    @IBAction func btnCLick(sender: AnyObject) {
        
        loadNewData(id);
    }
    
    func loadNewData(match_id:String){
//        
//        let url : String = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=0903D83D7BEC7F5B9F12313BAF8B37FE&match_id=2283370726";
    
        let url : String = String(format: "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=0903D83D7BEC7F5B9F12313BAF8B37FE&match_id=\(match_id)")
    
        
        print(url)
        
        let manager : AFHTTPSessionManager = AFHTTPSessionManager();
        
        manager.GET(url, parameters: nil, progress: { (progress) -> Void in
            
            }, success: { (task, objec) -> Void in
                
                
                
               self.dota2Array .removeAllObjects()
                
                let dic :NSDictionary = objec as! NSDictionary
            
                
                let dict : NSDictionary = dic["result"]as! NSDictionary;
                
                
                let error : String? = dict["error"] as? String
                
                if error == nil{
                    
                    
                    let dotaArray : NSArray = dict["players"] as! NSArray;
                    
                    for item :NSDictionary in dotaArray as! Array{
                        
                        let model : dota2Model = dota2Model()
                        
                        model.instance(item)
                        
                        self.dota2Array.addObject(model);
                        
                        
                    }
                    self.tableView.reloadData();

                }else{
                    print("no find");

                }
                
            }) { (task, error) -> Void in
                
        }

        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dota2Array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : dota2Cell = tableView .dequeueReusableCellWithIdentifier("cell") as! dota2Cell;
        
    
        
        let model = dota2Array[indexPath.row] as! dota2Model;

        
        cell.setupWithModel(model);
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    @IBOutlet weak var secondBtnClick: UIButton!

    @IBAction func btnCLock(sender: AnyObject) {
        
        
        let sedonVC : secondViewController = secondViewController();
        
        sedonVC.abbb { (string) -> Void in
            print(string);
        }
        
        self.navigationController?.pushViewController(sedonVC, animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

