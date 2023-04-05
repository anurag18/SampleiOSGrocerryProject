//
//  OrderData.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 16/03/23.
//

import Foundation

struct TrackingResponse: Codable {
    let trackData: TrackData
}

struct TrackData: Codable {
    let id: String
    let steps: StepData
}

struct StepData: Codable {
    let raised,accepted,cancelled,dispatched,delivered: Bool
}
