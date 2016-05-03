
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 1.316722, longitude: 103.940776)
        centerMapOnLocation(initialLocation)
        
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, "http://pickacardbackendv2.cfapps.io/promotions")
            .responseJSON { response in
                print("response data")
                print(response.data)
                print("response request")
                print(response.request)
                print("response result")
                print(response.result)
                print("response response")
                print(response.response)
                
                if let jsonResult = response.result.value {
                    for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                        print(anItem)
                        let promotion = Promotion(name: anItem["name"] as! String, descrip: anItem["description"] as! String, discount: anItem["discount"] as! String, coordinate: CLLocationCoordinate2D(latitude: (anItem["latitude"] as! NSNumber).doubleValue, longitude: (anItem["longitude"] as! NSNumber).doubleValue))
                        self.mapView.addAnnotation(promotion)
                    }
                }
        }
        
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

