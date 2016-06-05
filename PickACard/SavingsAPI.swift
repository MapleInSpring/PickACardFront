//
//  SavingsAPI.swift
//  PickACard
//
//  Created by Yifeng Hou on 29/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit
import Alamofire

class SavingsAPI: NSObject {
    
    class var sharedInstance: SavingsAPI {
        struct Singleton {
            static let instance = SavingsAPI()
        }
        return Singleton.instance
    }
    
    func getSavings(completionHandler: (savings: NSArray) -> ()) {
        var savings = [Saving]()
//        Alamofire.request(.GET, "http://pickacardbackendv2.cfapps.io/savings")
        Alamofire.request(.GET, "http://localhost:3000/savings")
            .responseJSON { response in
                print(response.result.value)
                if let jsonResult = response.result.value {
                    for aItem in jsonResult as! [Dictionary<String, AnyObject>] {
                        let saving =
                            Saving(
                                amount: Double(aItem["amount"] as! String)!,
                                cardName: aItem["cardName"] as! String
                              
                            )
                        for bItem in aItem["savings"] as! [Dictionary<String, AnyObject>] {
                            let savingDetail =
                                SavingDetail(
                                    expenseAmount: Double(bItem["expenseAmount"] as! String)!,
                                    savedAmount: Double(bItem["savedAmount"] as! String)!,
                                    location: bItem["location"] as! String,
                                    postalcode: (bItem["postalcode"] as! NSNumber).integerValue,
                                    promotionDetails: bItem["promotion_details"] as! String)
                            saving.savingDetails.append(savingDetail)
                        }
                        savings.append(saving)
                    }
                }
                completionHandler(savings: savings)
            };
    }
}
