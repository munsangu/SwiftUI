import Foundation

extension String {
    func group(
        _ character: Character,
        count: Int
    ) -> String {
        var modifiedString = self.replacingOccurrences(
            of: String(character),
            with: ""
        )
        
        for index in 0..<modifiedString.count {
            if index % count == 0 && index != 0 {
                let groupCharacterCount = modifiedString.count(where: { $0 == character })
                let stringInedx = modifiedString
                    .index(
                        modifiedString.startIndex,
                        offsetBy: index + groupCharacterCount
                    )
                modifiedString.insert(
                    character,
                    at: stringInedx
                )
            }
        }
        
        return modifiedString
    }
    
    func dummyText(
        _ character: Character,
        count: Int
    ) -> String {
        var tempText = self.replacingOccurrences(
            of: String(character),
            with: ""
        )
        let remaining = min(
            max(
                count - tempText.count,
                0
            ),
            count
        )
        
        if remaining > 0 {
            tempText.append(
                String(
                    repeating: character,
                    count: remaining
                )
            )
        }
        
        return tempText
    }
    
    func count(where condition: (Character) -> Bool) -> Int {
        return self.reduce(0) { count, character in
            condition(character) ? count + 1 : count
        }
    }
}
