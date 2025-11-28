//
//  IndexView.swift
//  Te Toka Tumai Auckland Emergency Procedures
//
//  Created by Nathan Bell on 28/11/2025.
//

import SwiftUI

struct IndexView: View {
    let tocItems: [TOCItem]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.epBg
                    .ignoresSafeArea()

                List {
                    Section {
                        ForEach(tocItems) { item in
                            NavigationLink {
                                PDFScreen(
                                    pdfName: "EmergencyProcedures",
                                    startPage: item.pageIndex,
                                    tocItems: tocItems
                                )
                            } label: {
                                Text(item.title)
                                    .font(.headline)
                                    .foregroundColor(.epTextPrimary)
                                    .padding(.vertical, 2)
                            }
                        }
                    } header: {
                        Text("Emergency Procedures")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(.epTextMuted)
                            .padding(.bottom, 4)
                            .textCase(nil) // keep normal case
                    } footer: {
                        Text("Tap a section to jump straight to its page. Swipe left or right to move between pages.")
                            .font(.footnote)
                            .foregroundColor(.epTextSecondary)
                            .padding(.top, 4)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Quick Access")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


