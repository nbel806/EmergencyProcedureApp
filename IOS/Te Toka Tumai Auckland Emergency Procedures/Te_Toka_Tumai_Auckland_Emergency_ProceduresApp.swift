import SwiftUI

@main
struct TeTokaTumaiApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.epPrimary)
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        let backAppearance = UIBarButtonItemAppearance()
        backAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backAppearance

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance


        UINavigationBar.appearance().tintColor = .white

        UITableView.appearance().separatorColor = UIColor(Color.epDivider)
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some Scene {
        WindowGroup {
            IndexView(tocItems: tocItems)
                .tint(Color.epAccent)
        }
    }
}
