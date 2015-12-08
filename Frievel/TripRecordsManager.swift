//
//  TripRecordsManager.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import Foundation

class TripRecordsManager {
    static let sharedInstance = TripRecordsManager()
    private init() {}
    
    private (set) var records = [TripRecord]()
    
    func addRecord(record: TripRecord) {
        records.append(record)
    }
    
    func addRecord(records: [TripRecord]) {
        self.records.appendContentsOf(records)
    }
}