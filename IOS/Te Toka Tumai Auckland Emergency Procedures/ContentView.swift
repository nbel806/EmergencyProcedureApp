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
    let pageIndex: Int
    let colour: Color
}

let tocItems: [TOCItem] = [
    .init(title: "Cover Page", pageIndex: 0, colour:  Color(red: 75/255, green: 81/255, blue: 111/255)),
    .init(title: "Auckland Hospital Map", pageIndex: 1, colour: Color(red: 75/255, green: 81/255, blue: 111/255)),
    .init(title: "Greenlane Clinical Center Map", pageIndex: 2, colour: Color(red: 75/255, green: 81/255, blue: 111/255)),
    .init(title: "Initial Actions", pageIndex: 4, colour: Color(red: 12/255, green: 34/255, blue: 74/255)),
    .init(title: "Colapse / Medical Emergency", pageIndex: 5, colour: Color(red: 0/255, green: 43/255, blue: 169/255)),
    .init(title: "Fire / Smoke", pageIndex: 7, colour:Color(red: 227/255, green: 63/255, blue: 48/255)),
    .init(title: "Loss of Essential Services", pageIndex: 9, colour: Color(red: 255/255, green: 216/255, blue: 0/255)),
    .init(title: "Threat to Personal Safety", pageIndex: 11, colour: Color(red: 30/255, green: 25/255, blue: 26/255)),
    .init(title: "Hospital Evacuation", pageIndex: 13, colour: Color(red: 255/255, green: 128/255, blue: 0/255)),
    .init(title: "Natural Hazards", pageIndex: 15, colour: Color(red: 151/255, green: 74/255, blue: 0/255)),
    .init(title: "Offensive Weapon, Child Abduction and CBRE", pageIndex: 17, colour: Color(red: 129/255, green: 0/255, blue: 129/255)),
    .init(title: "Hazardous Materials", pageIndex: 19, colour: Color(red: 252/255, green: 216/255, blue: 0/255)),
    .init(title: "Missing Patient", pageIndex: 21, colour: Color(red: 0/255, green: 163/255, blue: 174/255)),
    .init(title: "Major Incident Event", pageIndex: 23, colour: Color(red: 215/255, green: 0/255, blue: 88/255)
),
]




