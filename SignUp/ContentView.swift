//
//  ContentView.swift
//  SignUp
//
//  Created by Yutaro Sakai on 2019/09/20.
//  Copyright © 2019 Yutaro Sakai. All rights reserved.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var familyNameKanji = ""
    @Published var firstNameKanji = ""
    @Published var familyNameKatakana = ""
    @Published var firstNameKatakana = ""
    @Published var mailAdress = ""
    @Published var phoneNumber1 = ""
    @Published var phoneNumber2 = ""
    @Published var phoneNumber3 = ""
    @Published var birthYear = ""
    @Published var birthMonth = ""
    @Published var birthDate = ""
    @Published var Password = ""
    @Published var PasswordConfirm = ""
    
    @Published var inputDone = false
    @Published var resetPass = false
}

struct ContentView: View {
    @ObservedObject var userData = UserData()
    @State var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            //登録・ログイン画面
            SignUpView()
                .environmentObject(userData)
                //タブ１
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("ログイン")
                    }
                }
                .tag(0)
            
            //メッセージ画面
            MessegeView()
                .environmentObject(userData)
                //タブ２
                .tabItem {
                    VStack {
                        Image(systemName: "message.fill")
                        Text("メッセージ")
                    }
                }
                .tag(1)
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
