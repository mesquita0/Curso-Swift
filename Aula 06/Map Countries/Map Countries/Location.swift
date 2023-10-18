//
//  Location.swift
//  Map Countries
//
//  Created by Student13 on 18/10/23.
//

import Foundation
import MapKit

struct Location : Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var span: MKCoordinateSpan
    var flag: String
    var description: String
}
