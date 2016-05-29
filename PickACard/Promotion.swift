//
//  Promotion.swift
//  PickACard
//
//  Created by Yifeng Hou on 6/4/16.
//  Copyright © 2016 GraceHou. All rights reserved.
//

import Foundation
import MapKit

class Promotion: NSObject, MKAnnotation {
    let name: String
    let descrip: String
    let discount: String
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(name: String, descrip: String, discount: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.descrip = descrip
        self.discount = discount
        self.coordinate = coordinate
        self.title = name
        self.subtitle = descrip
        super.init()
    }
}
