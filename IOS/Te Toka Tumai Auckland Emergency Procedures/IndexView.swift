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
                Color.background
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
                                HStack(spacing: 4) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }

                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white.opacity(0.9))
                                }
                                .padding(.vertical, 14)
                                .padding(.horizontal, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .fill(item.colour)
                                        .shadow(
                                            color: .black.opacity(0.12),
                                            radius: 4,
                                            x: 0,
                                            y: 2
                                        )
                                )
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                            .navigationLinkIndicatorVisibility(.hidden)
                            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                    } footer: {
                        Text("Tap a section to jump straight to its page. Swipe left or right to move between pages.")
                            .font(.footnote)
                            .foregroundColor(.textSecondary)
                            .padding(.horizontal, 16)
                            .padding(.top, 4)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
                .listSectionSpacing(8)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Quick Access")
        }
    }
}
