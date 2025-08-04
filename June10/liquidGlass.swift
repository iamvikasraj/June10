import SwiftUI

struct TabItem: Hashable {
    let title: String
    let icon: String

    static let all: [TabItem] = [
        TabItem(title: "Home", icon: "house.fill"),
        TabItem(title: "Search", icon: "magnifyingglass"),
        TabItem(title: "Wallet", icon: "wallet.pass.fill"),
        TabItem(title: "Profile", icon: "person.crop.circle.fill")
    ]
}

struct LiquidGlassTabBar: View {
    @Binding var selectedTab: TabItem
    let tabs: [TabItem]

    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20))
                            .foregroundColor(selectedTab == tab ? .blue : .gray)
                        Text(tab.title)
                            .font(.caption2)
                            .foregroundColor(selectedTab == tab ? .blue : .gray)
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .padding(.bottom, 20)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding(.horizontal, 16)
        .shadow(radius: 10)
    }
}

struct liquidGlass: View {
    @State private var selectedTab: TabItem = .all[0]

    var body: some View {
        VStack {
            Spacer()
            Text("Current Tab: \(selectedTab.title)")
                .font(.title)
                .padding()

            Spacer()

            LiquidGlassTabBar(selectedTab: $selectedTab, tabs: TabItem.all)
        }
//        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    liquidGlass()
}
