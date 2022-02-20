//
//  SwiftArmyKnifeApp.swift
//  SwiftArmyKnife
//
//  Created by Paola Warren on 2/16/22.
//

import SwiftUI

@main
struct SwiftArmyKnifeApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
