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
                configureDetailView(view)
            }
            return view
        }
        return nil
    }
    
    func configureDetailView(annotationView: MKAnnotationView) {
        let addExpenseView = UIView()
        let views = ["addExpenseView": addExpenseView]
        addExpenseView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[addExpenseView(300)]", options: [], metrics: nil, views: views))
        addExpenseView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[addExpenseView(200)]", options: [], metrics: nil, views: views))
        addExpenseView.backgroundColor = UIColor.blueColor()
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(25, 5, 200, 25)
        label.backgroundColor=UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = "Add Expense"
        addExpenseView.addSubview(label)
        
        let expenseAmount : UITextField = UITextField()
        expenseAmount.frame = CGRectMake(50, 35, 100,25)
        expenseAmount.backgroundColor = UIColor.grayColor()
        expenseAmount.addTarget(self, action: "expenseAmountChanged:", forControlEvents: UIControlEvents.EditingChanged)
        addExpenseView.addSubview(expenseAmount)
        
        let expenseLocation : UITextField = UITextField()
        expenseLocation.frame = CGRectMake(50, 65, 100,25)
        expenseLocation.backgroundColor = UIColor.grayColor()
        expenseLocation.addTarget(self, action: "expenseLocationChanged:", forControlEvents: UIControlEvents.EditingChanged)
        addExpenseView.addSubview(expenseLocation)
        
        let btn: UIButton = UIButton()
        btn.frame=CGRectMake(50, 95, 100, 30)
        btn.backgroundColor=UIColor.redColor()
        btn.setTitle("submit", forState: UIControlState.Normal)
        btn.addTarget(self, action: "addExpense:", forControlEvents: UIControlEvents.TouchUpInside)
        addExpenseView.addSubview(btn)
        
        annotationView.detailCalloutAccessoryView = addExpenseView
    }
}