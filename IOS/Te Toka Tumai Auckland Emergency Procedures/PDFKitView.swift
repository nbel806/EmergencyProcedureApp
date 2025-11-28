import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let pdfName: String
    var pageToJump: Int? = nil
    var onPageChange: ((Int) -> Void)? = nil

    class Coordinator: NSObject {
        var parent: PDFKitView
        init(parent: PDFKitView) { self.parent = parent }

        @objc func pageChanged(_ notification: Notification) {
            guard
                let pdfView = notification.object as? PDFView,
                let doc = pdfView.document,
                let page = pdfView.currentPage
            else { return }


            pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit

            let index = doc.index(for: page)

            // Update SwiftUI state on next runloop tick
            DispatchQueue.main.async {
                self.parent.onPageChange?(index)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()

        pdfView.autoScales = true
        pdfView.displayMode = .singlePage
        pdfView.displayDirection = .horizontal
        pdfView.usePageViewController(true, withViewOptions: [
            "interPageSpacing": 16
        ])
        pdfView.backgroundColor = UIColor(Color.epBgDark)
        pdfView.documentView?.backgroundColor = UIColor(Color.epBgDark)

        if
            let url = Bundle.main.url(forResource: pdfName, withExtension: "pdf"),
            let doc = PDFDocument(url: url)
        {
            pdfView.document = doc
        }

        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.pageChanged(_:)),
            name: .PDFViewPageChanged,
            object: pdfView
        )

        // 🔹 Initial jump ONLY – no state updates here
        DispatchQueue.main.async {
            pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit

            if
                let target = pageToJump,
                let page = pdfView.document?.page(at: target)
            {
                pdfView.go(to: page)
            }
        }

        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: Context) {
        // IMPORTANT: don't call go(to:) here or you'll fight user scrolling.
        // You can keep this empty, or just re-apply scaling if you really want:
        pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit
    }
}
