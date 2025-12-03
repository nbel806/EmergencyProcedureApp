import SwiftUI

@main
struct TeTokaTumaiApp: App {
    init() {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "NavBackground")
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "NavTitle") ?? .label
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "NavTitle") ?? .label
        ]

        let backAppearance = UIBarButtonItemAppearance()
        backAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backAppearance


        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor(Color.accent)

        // TableView background + separators (for List)
        UITableView.appearance().backgroundColor = UIColor(Color.backgroundDark)
        UITableView.appearance().separatorColor = UIColor(Color.textMuted)
    }


    var body: some Scene {
        WindowGroup {
            IndexView(tocItems: tocItems)
                .tint(Color.accent)
        }
    }
}
