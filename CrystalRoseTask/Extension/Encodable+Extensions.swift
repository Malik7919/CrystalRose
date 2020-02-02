//
//  Encodable+Extensions.swift
//  Axis ERP
//
//  Created by Tech Labs on 11/14/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import Foundation

extension  Encodable {
    func encode() -> Data {
        let data = try! JSONEncoder().encode(self)
        return data
    }
}
