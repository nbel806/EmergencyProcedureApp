import SwiftUI
import PDFKit

struct PDFScreen: View {
    let pdfName: String
    let startPage: Int
    let tocItems: [TOCItem]

    @State private var currentTitle: String
    @State private var currentColor: Color
    @State private var currentPageIndex: Int
    
    private let citations: [Int: String] = [
           5: "ANZCOR, 2026, Guideline 2 – Managing an Emergency, accessed 30 January 2026,",
           6: "ANZCOR, 2026, Guideline 2 – Managing an Emergency, accessed 30 January 2026,"
       ]
    
    init(pdfName: String, startPage: Int, tocItems: [TOCItem]) {
        self.pdfName = pdfName
        self.startPage = startPage
        self.tocItems = tocItems

        _currentTitle = State(
            initialValue: PDFScreen.title(forPage: startPage, tocItems: tocItems)
        )
        _currentColor = State(
            initialValue: PDFScreen.color(forPage: startPage, tocItems: tocItems)
        )
        _currentPageIndex = State(initialValue: startPage)
        
    }

    var body: some View {
        VStack(spacing: 0) {
            PDFKitView(
                pdfName: pdfName,
                pageToJump: startPage,
                onPageChange: { pageIndex in
                    withAnimation(.easeInOut(duration: 0.15)) {
                        currentTitle = PDFScreen.title(forPage: pageIndex, tocItems: tocItems)
                        currentColor = PDFScreen.color(forPage: pageIndex, tocItems: tocItems)
                        currentPageIndex = pageIndex
                    }
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // 🔹 Citation footer – only shows when there is a citation for this page
            if let citation = citations[currentPageIndex] {
                Text(citation)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.background)
            }
        }
        .background(Color.background.ignoresSafeArea())
        .navigationTitle(currentTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(currentColor, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)

    }


    static func title(forPage page: Int, tocItems: [TOCItem]) -> String {
        tocItems
            .last(where: { $0.pageIndex <= page })?
            .title ?? "Emergency Procedures"
    }

    static func color(forPage page: Int, tocItems: [TOCItem]) -> Color {
        tocItems
            .last(where: { $0.pageIndex <= page })?
            .colour ?? Color.accentColor
    }
}
