//
//  PDFScreen.swift
//  Te Toka Tumai Auckland Emergency Procedures
//
//  Created by Nathan Bell on 28/11/2025.
//
import SwiftUI
import PDFKit

struct PDFScreen: View {
    let pdfName: String
    let startPage: Int
    let tocItems: [TOCItem]

    @State private var currentTitle: String

    init(pdfName: String, startPage: Int, tocItems: [TOCItem]) {
        self.pdfName = pdfName
        self.startPage = startPage
        self.tocItems = tocItems
        _currentTitle = State(
            initialValue: PDFScreen.title(forPage: startPage, tocItems: tocItems)
        )
    }

    var body: some View {
        PDFKitView(
            pdfName: pdfName,
            pageToJump: startPage,
            onPageChange: { pageIndex in
                withAnimation(.easeInOut(duration: 0.15)) {
                    currentTitle = PDFScreen.title(forPage: pageIndex, tocItems: tocItems)
                }
            }
        )
        .background(Color.epBgDark.ignoresSafeArea())
        .navigationTitle(currentTitle)
        .navigationBarTitleDisplayMode(.inline)
    }

    static func title(forPage page: Int, tocItems: [TOCItem]) -> String {
        tocItems
            .last(where: { $0.pageIndex <= page })?
            .title ?? "Emergency Procedures"
    }
}
