//
//  ContentView.swift
//  Te Toka Tumai Auckland Emergency Procedures
//
//  Created by Nathan Bell on 19/11/2025.
//

import SwiftUI
import PDFKit


struct TOCItem: Identifiable {
    let id = UUID()
    let title: String
    let pageIndex: Int   // 0-based
}

let tocItems: [TOCItem] = [
    .init(title: "Cover Page", pageIndex: 0),
    .init(title: "Auckland Hospital Map", pageIndex: 1),
    .init(title: "Greenlane Clinical Center Map", pageIndex: 2),
    .init(title: "Initial Actions", pageIndex: 4),
    .init(title: "Fire & R.A.C.E", pageIndex: 7),
    .init(title: "Loss of Essential Services", pageIndex: 9),
    .init(title: "Threat to Personal Safety", pageIndex: 11),
    .init(title: "Hospital Evacuation", pageIndex: 13),
    .init(title: "Natural Hazards", pageIndex: 15),
    .init(title: "Bomb, Chemical Threat and Suspicious Objects", pageIndex: 17),
    .init(title: "Hazardous Materials", pageIndex: 19),
    .init(title: "Missing Patient", pageIndex: 21),
    .init(title: "Major Incident Event", pageIndex: 23),
]




