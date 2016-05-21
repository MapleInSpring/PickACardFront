//
//  SavingsTableController.swift
//  PickACard
//
//  Created by Yifeng Hou on 4/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation

class SavingsTableController: UITableViewController {
    @IBOutlet var savingsTableView: UITableView!
    
    var savingsByCard = Dictionary<Int, (cardName:String, savings:Double)>();
    
    override func viewDidLoad() {
        savingsByCard[0] = ("OCBC", 100);
        savingsByCard[1] = ("UOB", 200);
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingsByCard.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = savingsByCard[indexPath.row]!.savings.description;
        cell.detailTextLabel?.text = savingsByCard[indexPath.row]!.cardName;
        
       return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSavingsDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! SavingsDetailViewController
                
                controller.cardNameText = savingsByCard[indexPath.row]!.cardName;
                controller.savingsText = savingsByCard[indexPath.row]!.savings.description;
                
                let backItem = UIBarButtonItem()
                backItem.title = "Something Else"
                controller.navigationItem.backBarButtonItem = backItem
            }
        }
    }
}
