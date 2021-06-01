//
//  LoginViewModel.swift
//  PhoneAuth
//
//  Created by ZISACHMAD on 18/05/21.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    
    @Published var phNo = ""
    @Published var code = ""
    @Published var errorMsg = ""
    @Published var error = false
    @Published var CODE = ""
    @Published var gotoVerify = false
    @AppStorage("log_Status") var status = false
    @Published var loading = false
    
    func getCountryCode() -> String {
        
        let regionCode = Locale.current.regionCode ?? ""
        
        return countries[regionCode] ?? ""
    }
    
    // sending code ke user
    func sendCode() {
        
//        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let number = "+\(getCountryCode())\(phNo)"
        
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (CODE, err) in
            
            if let error = err {
                
                self.errorMsg = error.localizedDescription
                withAnimation{self.error.toggle()}
                return
            }
            
            self.CODE = CODE ?? ""
            self.gotoVerify = true
        }
    }
    
    func verifyCode() {
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)
        
        loading = true
        
        Auth.auth().signIn(with: credential) { (result, err) in
            
            self.loading = false
            
            if let error = err {
                self.errorMsg = error.localizedDescription
                withAnimation{self.error.toggle()}
                return
            }
            
            withAnimation{self.status = true}
        }
    }
    
    func requestCode() {
        
        sendCode()
        
        withAnimation {
            self.errorMsg = "Code Sent"
            self.error.toggle()
        }
    }
}
