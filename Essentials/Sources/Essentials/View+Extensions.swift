//
//  View+Extensions.swift
//  
//
//  Created by Cédric Bahirwe on 06/05/2023.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
#if DEBUG
    /// Preview UI in supported languages in debug mode
    @available(iOS 13.0.0, *)
    func previewIn(_ language: LanguagePreview.Language) -> some View {
       ModifiedContent(content: self, modifier: LanguagePreview(language))
    }
#endif
    
    /// Dismiss keyboard
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#if DEBUG
@available(iOS 13.0.0, *)
struct LanguagePreview: ViewModifier {
    init(_ language: Language) {
        self.language = language
    }

    let language: Language
    enum Language: String {
        case en, fr, kin
    }
    func body(content: Content) -> some View {
        content
            .environment(\.locale, .init(identifier: language.rawValue))
    }
}
#endif
