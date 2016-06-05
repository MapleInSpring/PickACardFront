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
    
    var savingsByCard = [Saving]()
    var defaultSavingsByCard = [Saving]()
    
    override func viewDidLoad() {
        SavingsAPI.sharedInstance.getSavings{
            savings in
            self.savingsByCard = savings as! [Saving]
            self.defaultSavingsByCard = savings as! [Saving]
            self.savingsTableView.reloadData();
        }
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        SavingsAPI.sharedInstance.getSavings{
            savings in
            self.defaultSavingsByCard = savings as! [Saving]
        }
        super.viewWillAppear(animated)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savingsByCard.count;
    }
    
    @IBAction func showAddExpenseAlert(sender: AnyObject) {
        let alert = UIAlertController(title: "Add Expense", message:"Add expense and location", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Add", style: .Default) { action -> Void in
            let expense = (alert.textFields?.first as UITextField!).text;
            let location = (alert.textFields?.last as UITextField!).text;
            ExpenseAPI.sharedInstance.addExpense(Expense(expense: Double(expense!)!, location: location!));
            self.savingsTableView.reloadData();
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default) { _ in })
        alert.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Expense"
        }
        alert.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Location"
        }
        self.presentViewController(alert, animated: true){}
    }
    
    @IBAction func showAddCardAlert(sender: AnyObject) {
        let alert = UIAlertController(title: "Add Card", message:"Add a card", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Add", style: .Default) { action -> Void in
            let cardName = (alert.textFields?.first as UITextField!).text;
            let savingForCard = self.defaultSavingsByCard.filter{$0.cardName == cardName}.first
            self.savingsByCard.append(savingForCard!)
            self.savingsTableView.reloadData();
            })
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default) { _ in })
        alert.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Card Name"
        }
        self.presentViewController(alert, animated: true){}
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.detailTextLabel?.text = savingsByCard[indexPath.row].cardName;
        cell.textLabel?.text = savingsByCard[indexPath.row].amount.description;
        
       return cell;
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            savingsByCard.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSavingsDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let controller = segue.destinationViewController as! SavingsDetailViewController
                
                controller.cardNameText = savingsByCard[indexPath.row].cardName;
                controller.savingsText = savingsByCard[indexPath.row].amount.description;
                controller.savingDetails = savingsByCard[indexPath.row].savingDetails;
                
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}
