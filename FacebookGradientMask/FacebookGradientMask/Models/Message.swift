import SwiftUI

struct Message: Identifiable {
    var id: UUID = .init()
    var message: String
    var isReplay: Bool = false
}

let messages: [Message] = [
    .init(message: text1),
    .init(message: text2, isReplay: true),
    .init(message: text3),
    .init(message: text4, isReplay: true),
    .init(message: text5),
    .init(message: text6, isReplay: true),
    .init(message: text7),
    .init(message: text1, isReplay: true),
    .init(message: text2),
    .init(message: text3, isReplay: true),
    .init(message: text4),
    .init(message: text5, isReplay: true),
    .init(message: text6),
    .init(message: text7, isReplay: true),
    .init(message: text1),
    .init(message: text2, isReplay: true),
    .init(message: text3),
    .init(message: text4, isReplay: true),
    .init(message: text5),
    .init(message: text6, isReplay: true),
    .init(message: text7)
]

var text1 = "Hey, do you have any plans for this weekend?"
var text2 = "Not really. I was thinking of just staying home. Why?"
var text3 = "I was wondering if you’d like to go hiking or maybe check out that new cafe downtown."
var text4 = "Hmm, hiking sounds fun, but I’m not sure about the weather."
var text5 = "True, it’s supposed to rain on Saturday. How about Sunday instead?"
var text6 = "Sunday works for me. What time were you thinking?"
var text7 = "Let’s meet around 10 AM. I’ll bring snacks!"
