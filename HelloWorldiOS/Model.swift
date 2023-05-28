// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

import Foundation

struct Model {

    var isNumberRandom = false
    var hasDifferences = false

    var attributedText: NSAttributedString? {
        try? NSAttributedString(data: Data(HTML.utf8),
                                options: [.documentType: NSAttributedString.DocumentType.html],
                                documentAttributes: nil)
    }

    var number: some UnsignedInteger {
        isNumberRandom ? (arc4random() % (999999 - 100000) + 100000) : 123456
    }

    var clickMeButtonCenterXLayoutValue: CGFloat {
        hasDifferences ? 50 : 0
    }

    var imageName: String {
        hasDifferences ? "bug" : "thumb-up"
    }

}

private extension Model {
    static let colors = ["#ff0000","#ff4000","#ff7f00","#ffbf00","#ffff00","#ffff00",
                         "#00ff80","#00ffff","#0080ff","#0000ff","#4600ff","#8b00ff"]

    var HTML: String {
        #"<font size="26"><center>"#
        +
        zip(hasDifferences ? Self.colors.reversed() : Self.colors, "HELLO WORLD!")
            .map { #"<span style="color:\#($0);">\#($1)</span>"# }
            .joined()
        +
        #"</center></font>"#
    }
}

