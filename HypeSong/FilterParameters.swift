//
//  FilterParameters.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/22/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import Foundation
import UIKit

struct FilterParameters {
    var hypeLvl: Int // int ranging from 1-5
    var energy: (min: Float, max: Float, target: Float)
    var danceability: (min: Float, max: Float, target: Float)
    var tempo: (min: Float, max: Float, target: Float)
    
}
