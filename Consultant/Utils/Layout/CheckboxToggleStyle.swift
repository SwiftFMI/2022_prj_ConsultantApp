//
//  CheckboxToggleStyle.swift
//  Consultant
//
//  Created by Delyana Raykova on 11.02.23.
//

import SwiftUI

struct CheckboxToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
