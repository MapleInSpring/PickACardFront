
//
//  SavingsDetailViewController.swift
//  PickACard
//
//  Created by Yifeng Hou on 15/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit

class SavingsDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var savings: UILabel!
    @IBOutlet weak var detailsTableView: UITableView!
    
    var cardNameText:String = "";
    var savingsText:String = "";
    var savingDetails = [SavingDetail]();
    
    func goBack()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardName.text = cardNameText;
        savings.text = savingsText;
        self.detailsTableView.delegate = self
        self.detailsTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.savingDetails.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! SavingDetailCell
        cell.saved.text = self.savingDetails[indexPath.row].savedAmount.description;
        cell.spent.text = self.savingDetails[indexPath.row].expenseAmount.description;
        cell.location.text = self.savingDetails[indexPath.row].location;
        cell.promotion.text = self.savingDetails[indexPath.row].promotionDetails;
        
        return cell;
    }
}
