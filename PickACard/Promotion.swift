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
    let cardName: String
    let descrip: String
    let discount: String
    let minSpending: String
    let postalcode: String
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(name: String, descrip: String, discount: String, minSpending: String, postalcode: String, coordinate: CLLocationCoordinate2D, cardName: String) {
        self.name = name
        self.descrip = descrip
        self.discount = discount
        self.minSpending = minSpending
        self.postalcode = postalcode
        self.coordinate = coordinate
        self.title = name
        self.subtitle = descrip
        self.cardName = cardName
        super.init()
    }
}
