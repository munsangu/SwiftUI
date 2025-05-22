import SwiftUI

struct ContentView: View {
    @State private var currentWeek: [Date.Day] = Date.currentWeek
    @State private var selectedDate: Date?
    @Namespace private var namespace
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                currentWeek: currentWeek,
                selectedDate: selectedDate,
                onDateSelected: { date in
                    withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
                        selectedDate = date
                    }
                },
                namespace: namespace
            )
            .environment(\.colorScheme, .dark)
            
            GeometryReader {
                let size = $0.size
                
                ScrollView(.vertical) {
                    LazyVStack(
                        spacing: 15,
                        pinnedViews: [.sectionHeaders]
                    ) {
                        ForEach(currentWeek) { day in
                            let date = day.date
                            let isLast = currentWeek.last?.id == day.id
                            Section {
                                VStack(
                                    alignment: .leading,
                                    spacing: 15
                                ) {
                                    TaskRowView()
                                    TaskRowView()
                                }
                                .frame(maxWidth: .infinity)
                                .padding(
                                    .leading,
                                    70
                                )
                                .padding(
                                    .top,
                                    -70
                                )
                                .padding(
                                    .bottom,
                                    10
                                )
                                .frame(
                                    minHeight: isLast ? size.height - 110 : nil,
                                    alignment: .top
                                )
                            } header: {
                                VStack(spacing: 4) {
                                    Text(date.string("EEE"))
                                    
                                    Text(date.string("dd"))
                                        .font(.largeTitle.bold())
                                }
                                .frame(
                                    width: 55,
                                    height: 70
                                )
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(
                    .all,
                    20,
                    for: .scrollContent
                )
                .contentMargins(
                    .vertical,
                    20,
                    for: .scrollIndicators
                )
                .scrollPosition(
                    id: .init(
                        get: {
                                return currentWeek.first(where: { $0.date.isSame(selectedDate) })?.id
                             },
                        set: { newValue in
                    selectedDate = currentWeek.first(where: { $0.id == newValue })?.date }),
                    anchor: .top
                )
                .safeAreaPadding(
                    .bottom,
                    70
                )
                .padding(
                    .bottom,
                    -70
                )
            }
            .background(.background)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 30,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 30,
                    style: .continuous
                )
            )
            .environment(\.colorScheme, .light)
            .ignoresSafeArea(
                .all,
                edges: .bottom
            )
        }
        .background(.mainBackground)
        .onAppear {
            guard selectedDate == nil else { return }
            selectedDate = currentWeek.first(where: { $0.date.isSame(.now) })?.date
        }
    }
}

#Preview {
    ContentView()
}
