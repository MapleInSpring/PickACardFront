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
    
//    var savingsByCard = Dictionary<Int, (cardName:String, savings:Double)>();
    var savingsByCard = [Expense]() // should be savings, change later
    
    override func viewDidLoad() {
        savingsByCard = ExpenseAPI.sharedInstance.getExpenses()
        print("enter view did load")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        savingsByCard = ExpenseAPI.sharedInstance.getExpenses()
        self.savingsTableView.reloadData();
        print("enter savings table controller view will appear")
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
            self.savingsByCard[self.savingsByCard.count] = Expense(expense: Double(expense!)!, location: location!);
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
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
//        cell.detailTextLabel?.text = savingsByCard[indexPath.row]!.cardName;
        cell.detailTextLabel?.text = savingsByCard[indexPath.row].location;
        cell.textLabel?.text = savingsByCard[indexPath.row].expense.description;
        
       return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSavingsDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! SavingsDetailViewController
                
//                controller.cardNameText = savingsByCard[indexPath.row]!.cardName;
//                controller.savingsText = savingsByCard[indexPath.row]!.savings.description;
                controller.cardNameText = savingsByCard[indexPath.row].location;
                controller.savingsText = savingsByCard[indexPath.row].expense.description;
            }
        }
    }
}
