//
//  DocumentView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 24.09.2024.
//

import SwiftUI

struct DocumentsView: View {

    var documentType: DocumentType

    var body: some View {
        ScrollView {
            ZStack {
                Text(documentType.text)
            }

        }
        .navigationTitle(documentType == .privacyPolicy ? "Privacy Policy" : "Terms of Use")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    DocumentsView(documentType: .privacyPolicy)
}
