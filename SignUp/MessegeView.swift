//
//  MessegeView.swift
//  SignUp
//
//  Created by Yutaro Sakai on 2019/09/20.
//  Copyright © 2019 Yutaro Sakai. All rights reserved.
//

import SwiftUI

struct MessegeView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView{
            Form{
                NavigationLink(destination: Messege1()){
                    Text("Smart Payをはじめよう")
                }
                if userData.inputDone {
                    NavigationLink(destination: Messege2().environmentObject(self.userData)){
                        Text("\(userData.familyNameKatakana)様 Smart Pay登録確認")
                    }
                }
                if userData.resetPass {
                    NavigationLink(destination: Messege3()){
                        Text("パスワードの再設定")
                    }
                }
            }
            .navigationBarTitle("メッセージ")
        }
    }
}

struct Messege1: View {
    var body: some View {
        VStack{
            Text("最新のスマートフォン決済アプリ「Smart Pay」を今すぐ利用しよう。13月32日まで還元率100%キャンペーン実施中。")
                .padding()
            Image("topImage")
                .resizable()
                .scaledToFit()
            Spacer()
        }
    .navigationBarTitle("Smart Payをはじめよう")
    }
}

struct Messege2: View {
//    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{
            Text("以下のリンクにアクセスして")
            Text("Smart Payの登録を完了してください。")
            .padding()
            Divider()
            NavigationLink(destination: Messege2_5()){
                Text("アカウントの確認")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(Color.white)
            }
            Divider()
            Text(" ")
            Text("心当たりのない場合はこのメッセージを")
            Text("破棄してください。")
            .padding()
        }
        .navigationBarTitle("Smart Pay登録確認")
    }
}

struct Messege2_5: View {
    var body: some View {
        VStack{
            Spacer()
            Text("アカウントの登録が")
                .font(.largeTitle)
            Text("完了しました！")
                .font(.largeTitle)
            Text("Smart Payアプリでログインしてください。")
                .padding()
            
            Text("▼")
                .font(.system(size: 60))
                .foregroundColor(Color.red)
                .position(x:104, y:200)
        }
    .navigationBarTitle("新規登録完了")
    }
}

struct Messege3: View {
    @State var pass = ""
    @State var passComfirm = ""
    
    var body: some View {
        VStack{
            Text("再設定するパスワードを入力してください。")
                .font(.headline)
                .padding()
            SecureField("６文字以上", text: $pass)
                .padding()
            SecureField("確認のため再度入力", text: $passComfirm)
                .padding()
            NavigationLink(destination: Messege3_5()){
                Text("パスワードの再設定")
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
            }
        }
    .navigationBarTitle("パスワードの再設定")
    }
}

struct Messege3_5: View {
    var body: some View {
        VStack{
            Spacer()
            Text("パスワードの再設定が完了しました。")
                .font(.largeTitle)
                .padding()
            Text("Smart Payアプリでログインしてください。")
                .padding()
            Text("▼")
            .font(.system(size: 60))
            .foregroundColor(Color.red)
            .position(x:104, y:200)
        }
    .navigationBarTitle("完了")
    }
}

struct MessegeView_Previews: PreviewProvider {
    static var previews: some View {
        //MessegeView()
        Messege2_5()
    }
}
