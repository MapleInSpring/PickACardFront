//
//  VCMapView.swift
//  PickACard
//
//  Created by Yifeng Hou on 29/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation
import MapKit

extension ViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Promotion {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                switch(annotation.cardName)
                {
                    case "OCBC":
                        view.pinTintColor = UIColor.yellowColor()
                    case "UOB":
                        view.pinTintColor = UIColor.greenColor()
                    default:
                        view.pinTintColor = UIColor.redColor()
                }
                
                configureDetailView(view, promotion: annotation)
            }
            return view
        }
        return nil
    }
    
    func configureDetailView(annotationView: MKAnnotationView, promotion: Promotion) {
        let addExpenseView = UIView()
        let views = ["addExpenseView": addExpenseView]
        addExpenseView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[addExpenseView(300)]", options: [], metrics: nil, views: views))
        addExpenseView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[addExpenseView(200)]", options: [], metrics: nil, views: views))
        addExpenseView.backgroundColor = UIColor.blueColor()
        
        let descriptionLabel: UILabel = UILabel()
        descriptionLabel.frame = CGRectMake(25, 5, 200, 25)
        descriptionLabel.backgroundColor=UIColor.whiteColor()
        descriptionLabel.textAlignment = NSTextAlignment.Center
        descriptionLabel.text = promotion.descrip
        addExpenseView.addSubview(descriptionLabel)
        
        let discountLabel: UILabel = UILabel()
        discountLabel.frame = CGRectMake(25, 35, 200, 25)
        discountLabel.backgroundColor=UIColor.whiteColor()
        discountLabel.textAlignment = NSTextAlignment.Center
        discountLabel.text = promotion.discount
        addExpenseView.addSubview(discountLabel)
        
        let minSpendingLabel: UILabel = UILabel()
        minSpendingLabel.frame = CGRectMake(25, 65, 200, 25)
        minSpendingLabel.backgroundColor=UIColor.whiteColor()
        minSpendingLabel.textAlignment = NSTextAlignment.Center
        minSpendingLabel.text = promotion.minSpending
        addExpenseView.addSubview(minSpendingLabel)
        
        let expenseAmount : UITextField = UITextField()
        expenseAmount.frame = CGRectMake(50, 95, 100,25)
        expenseAmount.backgroundColor = UIColor.grayColor()
        expenseAmount.placeholder = "Expense"
        expenseAmount.addTarget(self, action: "expenseAmountChanged:", forControlEvents: UIControlEvents.EditingChanged)
        addExpenseView.addSubview(expenseAmount)
        
        // TODO: can preset location here
        let expenseLocation : UITextField = UITextField()
        expenseLocation.frame = CGRectMake(50, 125, 100,25)
        expenseLocation.backgroundColor = UIColor.grayColor()
        expenseLocation.placeholder = "Location"
        expenseLocation.addTarget(self, action: "expenseLocationChanged:", forControlEvents: UIControlEvents.EditingChanged)
        addExpenseView.addSubview(expenseLocation)
        
        let btn: UIButton = UIButton()
        btn.frame=CGRectMake(50, 155, 150, 30)
        btn.backgroundColor=UIColor.redColor()
        btn.setTitle("Add Expense", forState: UIControlState.Normal)
        btn.addTarget(self, action: "addExpense:", forControlEvents: UIControlEvents.TouchUpInside)
        addExpenseView.addSubview(btn)
        
        annotationView.detailCalloutAccessoryView = addExpenseView
    }
}