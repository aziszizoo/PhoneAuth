//
//  ContentView.swift
//  PhoneAuth
//
//  Created by ZISACHMAD on 18/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        ZStack {
            if status {
                
                LandingPage()
            }
            else {
                NavigationView {
                    Login()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
