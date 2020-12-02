//
//  ListDetailView.swift
//  HW_1_1_ Sakhanko
//
//  Created by Pavel Sakhanko on 1.12.20.
//

import SwiftUI

struct ListDetailView: View {
    
    let manufacturer: String
    let description: String

    @State var isDeviceOrientationHorizontal = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height
    @Binding var closeModal: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack {
                Text(manufacturer)
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
            }
            Text(description)
                .foregroundColor(.black)
                .font(.system(size: 20))
            Spacer()
            VStack() {
                if isDeviceOrientationHorizontal {
                    Button(action: {
                        closeModal.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
                isDeviceOrientationHorizontal.toggle()
            }
        })
    }
}
