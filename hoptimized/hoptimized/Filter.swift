//
//  Filter.swift
//  hoptimized
//
//  Created by Darshan Nagarajappa on 8/9/16.
//  Copyright © 2016 darshanproject. All rights reserved.
//

import UIKit

class Filter {
    // MARK: Properties
    
    var filterName: String
    var filterRank: String
    
    // MART: Initialization
    init?(filterName: String, filterRank: String){
        
        self.filterName = filterName
        self.filterRank = filterRank
        
        if filterName.isEmpty || filterRank.isEmpty {
            return nil
        }
    }
}

