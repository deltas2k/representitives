//
//  representative.swift
//  representitives
//
//  Created by Matthew O'Connor on 10/2/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation

struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
