//
//  SignInView.swift
//  SignUp
//
//  Created by Yutaro Sakai on 2019/09/20.
//  Copyright © 2019 Yutaro Sakai. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State var signInMail = ""
    @State var signInPass = ""
    @State var show_modal = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            Ellipse()
                .frame(width: 750.0, height: 750.0)
                .position(x: 207, y: 100)
                .foregroundColor(Color(red: 1.0, green: 0.3, blue: 0.3, opacity: 1.0))
                .overlay(
                    VStack{
                        Text("Smart Pay")
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                            .position(x: 207, y: -10)
                        Text("ログイン")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .position(x: 207, y: -20)
                    }
                )
            TextField("メールアドレス または 電話番号", text: $signInMail)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .position(x: 207, y: -30)
            SecureField("パスワード", text: $signInPass)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .position(x: 207, y: -105)
            NavigationLink(destination: SignInDone()) {
                Text("ログイン")
                    .cornerRadius(10)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
            }
            .position(x: 207, y: -170)
            
             Button(action: {
                 self.show_modal = true
             }) {
                 Text("パスワードをお忘れの場合")
                 .padding()
                 .foregroundColor(Color.white)
             }.sheet(isPresented: self.$show_modal) {
                AccountReset(show_modal: self.$show_modal).environmentObject(self.userData)
             }
             .position(x: 207, y: -250)
        }
    }
}

struct SignInDone: View {
    var body: some View {
        VStack {
            Image("appView")
            .resizable()
            .scaledToFill()
        }
    }
}

struct SignInFailed: View {
    var body: some View {
        VStack {
            Text("メールアドレスや電話番号、または")
            Text("パスワードが異なります。")
        }
    }
}

struct AccountReset: View {
    @State var mailToReset = ""
    @Binding var show_modal: Bool
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView{
            VStack {
                Text(" ")
                Text("登録したメールアドレスまたは電話番号を")
                Text("入力してください。")
                TextField("メールアドレスまたは電話番号", text: $mailToReset)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: AccountReset2(show_modal: self.$show_modal).environmentObject(self.userData)){
                    Text("送信")
                        .cornerRadius(10)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
            }
        .navigationBarTitle("パスワード再設定")
        }
    }
}

struct AccountReset2: View {
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool
    
    var body: some View {
        VStack{
            Group {
                Text("パスワード再設定の")
                Text("リンクを送信しました。")
            }
            .font(.title)
            Group {
                Text("\"メッセージ\"を確認してパスワードを再設定してください。")
                Text("「完了」をタップすると終了します。")
            }
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            self.show_modal = false
            self.userData.resetPass = true
        } ) { Text("完了")
        .fontWeight(.bold) })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInDone()
        
    }
}
