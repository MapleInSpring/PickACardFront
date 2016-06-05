
//
//  ViewController.swift
//  PickACard
//
//  Created by Yifeng Hou on 5/4/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addCardName: UITextField!
    @IBOutlet weak var removeCardName: UITextField!
    
    var newExpense : String = ""
    var newLocation : String = ""
    var promotions : [Promotion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 1.316722, longitude: 103.940776)
        centerMapOnLocation(initialLocation)
        
        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire.request(.GET, "http://pickacardbackendv2.cfapps.io/promotions")
        Alamofire.request(.GET, "http://localhost:3000/promotions")
            .responseJSON { response in
                print(response.result.value)
                if let jsonResult = response.result.value {
                    print(jsonResult)
                    for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                        let name = anItem["name"] as! String
                        let description = anItem["description"] as! String
                        let discount = anItem["discount"] as! Int
                        let postalcode = (anItem["postal_code"] as! NSNumber).description
                        let latitude = Double(anItem["latitude"] as! String)!
                        let longitude = Double(anItem["longitude"] as! String)!
                        let cardName = anItem["card_name"] as! String
                        let promotion =
                        Promotion(
                            name: name,
                            descrip: description,
                            discount:  "\(discount)% off",
                            postalcode: postalcode,
                            coordinate: CLLocationCoordinate2D(
                                latitude: latitude,
                                longitude: longitude),
                            cardName:cardName)
                        
                        self.promotions.append(promotion)
                        self.mapView.addAnnotation(promotion)
                    }
                }
        }
        
        mapView.delegate = self
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func addCard(sender: AnyObject) {
        let addCardName = self.addCardName.text
        self.mapView.addAnnotations(self.promotions.filter{$0.cardName == addCardName})
        self.addCardName.text = ""
    }
    
    @IBAction func removeCard(sender: AnyObject) {
        let removeCardName = self.removeCardName.text
        self.mapView.removeAnnotations(self.promotions.filter{$0.cardName == removeCardName})
        self.removeCardName.text = ""
    }
    
    // selector methods
    func expenseAmountChanged(textField: UITextField) {
        self.newExpense = textField.text!
    }
    
    // selector methods
    func expenseLocationChanged(textField: UITextField) {
        self.newLocation = textField.text!
    }
    
    func addExpense(sender:UIButton)
    {
        print("hello in ViewController " + self.newExpense + " " + self.newLocation)
        ExpenseAPI.sharedInstance.addExpense(Expense(expense: Double(self.newExpense)!, location: self.newLocation))
    }
}



