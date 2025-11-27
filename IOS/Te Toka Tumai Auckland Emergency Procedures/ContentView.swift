//
//  ContentView.swift
//  Te Toka Tumai Auckland Emergency Procedures
//
//  Created by Nathan Bell on 19/11/2025.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let pdfName: String
    var pageToJump: Int? = nil  // NEW

    class Coordinator: NSObject {
        var parent: PDFKitView
        init(parent: PDFKitView) { self.parent = parent }

        @objc func pageChanged(_ notification: Notification) {
            guard let pdfView = notification.object as? PDFView else { return }
            pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit
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
        pdfView.backgroundColor = .black
        pdfView.documentView?.backgroundColor = .black

        if let url = Bundle.main.url(forResource: pdfName, withExtension: "pdf"),
           let doc = PDFDocument(url: url) {
            pdfView.document = doc
        }

        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.pageChanged(_:)),
            name: .PDFViewPageChanged,
            object: pdfView
        )

        DispatchQueue.main.async {
            pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit

            // NEW: jump when first loaded
            if let target = pageToJump {
                if let page = pdfView.document?.page(at: target) {
                    pdfView.go(to: page)
                }
            }
        }

        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit

        // NEW: jump when ContentView changes
        if let target = pageToJump,
           let page = pdfView.document?.page(at: target) {
            pdfView.go(to: page)
        }
    }
}

struct IndexView: View {
    let tocItems: [TOCItem]

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                List {
                    Section {
                        ForEach(tocItems) { item in
                            NavigationLink {
                                PDFKitView(
                                    pdfName: "EmergencyProceduresAucklandHospital",
                                    pageToJump: item.pageIndex
                                )
                            } label: {
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text(item.title)
                                            .font(.headline)
                                    }
                                .padding(.vertical, 1)
                            }
                        }
                    } header: {
                        Text("Emergency Procedures")
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 4)
                    } footer: {
                        Text("Tap a section to jump straight to its page. Swipe left or right to move between pages.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.top, 4)
                    }
                }
                .scrollContentBackground(.hidden)   // let our ZStack background show through
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Quick Access")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


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




