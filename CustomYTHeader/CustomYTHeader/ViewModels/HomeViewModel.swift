import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var videos: [Video] = []
    
    @Published var scrollOffset: CGFloat = 0
    @Published var previousScrollOffset: CGFloat = 0
    @Published var headerOffset: CGFloat = 0
    @Published var headerVisible: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadVideos()
    }
    
    func loadVideos() {
        self.videos = Video.mockVideos()
    }
    
    func updateHeaderPosition(newScrollOffset: CGFloat, headerHeight: CGFloat) {
        let isScrollingDown = newScrollOffset > previousScrollOffset
        let scrollDelta = abs(newScrollOffset - previousScrollOffset)
        
        if scrollDelta > 5 {
            if newScrollOffset <= 0 {
                withAnimation(.spring(response: 0.3)) {
                    headerOffset = 0
                }
            }
            else if isScrollingDown && newScrollOffset > headerHeight {
                withAnimation(.spring(response: 0.3)) {
                    headerOffset = min(headerOffset + scrollDelta * 0.3, headerHeight)
                }
            }
            else if !isScrollingDown {
                withAnimation(.spring(response: 0.3)) {
                    headerOffset = max(headerOffset - scrollDelta * 0.3, 0)
                }
            }
        }
        
        previousScrollOffset = newScrollOffset
        scrollOffset = newScrollOffset
    }
    
    func handleScrollPhaseChange(isScrolling: Bool, headerHeight: CGFloat) {
        if !isScrolling {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                if headerOffset > headerHeight * 0.5 && scrollOffset > headerHeight {
                    headerOffset = headerHeight
                }
                else {
                    headerOffset = 0
                }
            }
        }
    }
}
