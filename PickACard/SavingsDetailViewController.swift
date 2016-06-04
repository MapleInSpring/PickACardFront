//
//  SavingsDetailViewController.swift
//  PickACard
//
//  Created by Yifeng Hou on 15/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit

class SavingsDetailViewController: UIViewController {
    

    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var savings: UILabel!
    
    var cardNameText:String = "";
    var savingsText:String = "";
    
    func goBack()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardName.text = cardNameText;
        savings.text = savingsText;
    }
}
