//
//  Episode.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import Foundation

class Episode {
    let title: String
    let issueDate: Date
    weak var season: Season?
    
    init(title: String, issueDate: Date) {
        self.title = title
        self.issueDate = issueDate
    }
}
