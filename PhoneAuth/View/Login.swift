//
//  Login.swift
//  PhoneAuth
//
//  Created by ZISACHMAD on 18/05/21.
//

import SwiftUI

struct Login: View {
    
    @StateObject var loginData = LoginViewModel()
    @State var isSmall = UIScreen.main.bounds.height < 750
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image("logoWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .padding(.top)
                    Text("Login With Your Number")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("You'll get a\n 6 digitCode for Verification")
                        .font(isSmall ? .subheadline : .headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Enter your Number")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
//                            Text("+62 \(loginData.phNo)")
                            Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                        }
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        
                        NavigationLink(destination: Verification(loginData: loginData),isActive: $loginData.gotoVerify) {
                            Text("")
                                .hidden()
                        }
                        Button(action: loginData.sendCode, label: {
                            Text("Go")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.vertical,18)
                                .padding(.horizontal,38)
                                .background(Color("bgButton"))
                                .cornerRadius(20)
                        })
                        .disabled(loginData.phNo == "" ? true: false)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: -5)
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .background(Color("bg"))
                .cornerRadius(20)
                
                // costum nomor pad
                CostumNumberPad(value: $loginData.phNo, isVerify: false)
            }
            .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
            
            if loginData.error {
                AlertView(msg: loginData.errorMsg, show: $loginData.error)
            }
        }
    }
}
