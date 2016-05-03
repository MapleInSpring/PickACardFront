//
//  MapViewController.swift
//  PickACard
//
//  Created by Yifeng Hou on 3/5/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    let locationManager = CLLocationManager()
//    let dataProvider = GoogleDataProvider()
    let searchRadius: Double = 1000

}