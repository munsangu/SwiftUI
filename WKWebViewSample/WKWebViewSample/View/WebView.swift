import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlString: String
    var fontSize: Int
    
    class Coordinator: NSObject {
        var parent: WebView
        init(_ parent: WebView) { self.parent = parent }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        webView.loadHTMLString(htmlString, baseURL: nil)

        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let js = "if (typeof updateFontSize === 'function') { updateFontSize(\(fontSize)); if (window.myChart) { window.myChart.update(); } }"
        uiView.evaluateJavaScript(js, completionHandler: nil)
    }
}

extension WebView.Coordinator: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        let initialJS = "if (typeof updateFontSize === 'function') { updateFontSize(\(parent.fontSize)); if (window.myChart) { window.myChart.update(); } }"
        webView.evaluateJavaScript(initialJS, completionHandler: nil)
    }
}

let htmlContent = """
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Chart Example</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
  <style>
    html, body {
      margin: 0;
      padding: 0;
      background-color: white;
      color: black;
    }
    #wrap {
      padding: 20px;
    }
  </style>
</head>
<body>
  <div id="wrap">
    <canvas id="myChart" width="400" height="400"></canvas>
  </div>
  <script>
    const ctx = document.getElementById('myChart').getContext('2d');
    window.myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          label: 'Votes',
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: [
            'rgba(255, 99, 132, 0.5)',
            'rgba(54, 162, 235, 0.5)',
            'rgba(255, 206, 86, 0.5)',
            'rgba(75, 192, 192, 0.5)',
            'rgba(153, 102, 255, 0.5)',
            'rgba(255, 159, 64, 0.5)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        animation: {
          duration: 1500,
          easing: 'easeOutBounce'
        },
        plugins: {
          legend: {
            labels: { font: { size: 16 } }
          }
        },
        scales: {
          x: {
            ticks: { font: { size: 16 } }
          },
          y: {
            beginAtZero: true,
            ticks: { font: { size: 16 } }
          }
        }
      }
    });

    function updateFontSize(newSize) {
      if (window.myChart && window.myChart.options) {
        window.myChart.options.plugins.legend.labels.font.size = newSize;
        window.myChart.options.scales.x.ticks.font.size = newSize;
        window.myChart.options.scales.y.ticks.font.size = newSize;
      }
    }
  </script>
</body>
</html>
"""
