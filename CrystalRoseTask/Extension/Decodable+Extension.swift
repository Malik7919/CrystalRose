//
//  Decodable+Extension.swift
//  Axis ERP
//
//  Created by Tech Labs on 11/14/19.
//  Copyright © 2019 Tech Labs. All rights reserved.
//

import Foundation


struct FailableDecodable<Base : Decodable> : Decodable {
    
    let base: Base?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
