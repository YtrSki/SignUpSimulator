//
//  SignUpView.swift
//  SignUp
//
//  Created by Yutaro Sakai on 2019/09/20.
//  Copyright © 2019 Yutaro Sakai. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State private var show_modal: Bool = false
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView{
            VStack {
                Image("TopImage")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .overlay(
                            VStack {
                                Text("Smart Pay")
                                    .font(.system(size: 60))
                                    .fontWeight(.black)
                                    .foregroundColor(Color.red)
                                Spacer()

                                Button(action: {
                                    self.show_modal = true
                                }) {
                                    Text("新規登録")
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(5)
                                        .shadow(radius: 20)
                                }.sheet(isPresented: $show_modal) {
                                    FirstSign(show_modal: self.$show_modal)
                                        .environmentObject(self.userData)
                                }

                                NavigationLink(destination: SignInView().environmentObject(self.userData)) {
                                    Text("ログイン")
                                    .bold()
                                    .foregroundColor(Color.red)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .shadow(radius: 20)
                                }

                                Text(" ")
                                    .font(.largeTitle)
                            }
                        )
            }
        }
    }
}

struct FirstSign: View {
    @EnvironmentObject var userData: UserData
    @State var isFilled = false
    @Binding var show_modal: Bool

    var body: some View {
        NavigationView{
            Form{
                Section{
                    VStack{
                        HStack {
                            TextField("姓", text: $userData.familyNameKanji)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("名", text: $userData.firstNameKanji)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack{
                            TextField("セイ", text: $userData.familyNameKatakana)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("メイ", text: $userData.firstNameKatakana)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
                Section{
                    NavigationLink(destination: SecondSign(show_modal: self.$show_modal)){
                        Text("次へ")
                            .foregroundColor(Color.red)
                    }
                }
            }
        .navigationBarTitle("氏名")
        }
    }
}

struct SecondSign: View{
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool

    var body: some View{
        Form{
            Section{
                        VStack{
                            HStack {
                                TextField("西暦", text: $userData.birthYear)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numbersAndPunctuation)
                                Text("年　")
                                TextField("月", text: $userData.birthMonth)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                Text("月　")
                                TextField("日", text: $userData.birthDate)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                Text("日　")
                            }
                        }
                    }
            Section{
                NavigationLink(destination: ThirdSign(show_modal: self.$show_modal)){
                    Text("次へ")
                        .foregroundColor(Color.red)
                }
            }
        }
        .navigationBarTitle("生年月日")
    }
}

struct ThirdSign: View{
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool
    //@State var openAlert: Bool

    var body: some View {
        Form{
            Section{
                VStack{
                    TextField("example@mail.com", text: $userData.mailAdress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }
            }





//            Section{
//                Button("チェック", action: { self.userData.openAlert.toggle() })
//                .alert(isPresented: $userData.openAlert){
//                    Alert(
//                        title: .init("確認"),
//                        message: $userData.Password == $userData.PasswordConfirm && $userData.Password != "" ? .init("パスワードは一致しています。") : .init("パスワードが一致していません。または不正です。"),
//                        dismissButton: Alert.Button.`default`(Text("OK"))
//                    )
//                }
//            }

            Section{
                NavigationLink(destination: FourthSign(show_modal: self.$show_modal)){
                    Text("次へ")
                        .foregroundColor(Color.red)
                }
            }
        }
    .navigationBarTitle("メールアドレス")
    }
}

struct FourthSign: View {
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool

    var body: some View {
        Form{
            Section{
                VStack{
                    HStack {
                        TextField("000", text: $userData.phoneNumber1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        TextField("1234", text: $userData.phoneNumber2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        TextField("5678", text: $userData.phoneNumber3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)

                    }
                }
            }
            Section{
                NavigationLink(destination: FifthSign(show_modal: self.$show_modal)){
                    Text("次へ")
                        .foregroundColor(Color.red)
                }
            }
        }
        .navigationBarTitle("携帯電話番号")
    }
}

struct FifthSign: View {
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool

    var body: some View {
        Form {
            Section{
                VStack{
                    SecureField("6文字以上", text: $userData.Password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("確認のため再度入力", text: $userData.PasswordConfirm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            Section{
                NavigationLink(destination: SixthSign(show_modal: self.$show_modal)){
                    Text("次へ")
                        .foregroundColor(Color.red)
                }
            }
        }
        .navigationBarTitle("パスワード")
    }
}

struct SixthSign: View {
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool

    var body: some View {
        Form{
            Text("入力した内容を確認してください。")
            Section{
                Text("氏名")
                    .fontWeight(.bold)
                Text("\(userData.familyNameKanji) \(userData.firstNameKanji)")
                Text("\(userData.familyNameKatakana) \(userData.firstNameKatakana)")
            }
            Section{
                Text("生年月日")
                    .fontWeight(.bold)
                Text("\(userData.birthYear)年 \(userData.birthMonth)月 \(userData.birthDate)日")
            }
            Section{
                Text("メールアドレス")
                    .fontWeight(.bold)
                Text("\(userData.mailAdress)")
            }
            Section{
                Text("電話番号")
                    .fontWeight(.bold)
                Text("\(userData.phoneNumber1) - \(userData.phoneNumber2) - \(userData.phoneNumber3)")
            }
            Section{
                Text("パスワード")
                    .fontWeight(.bold)
                Text("******")
            }

            Section{
                NavigationLink(destination: SignUpDone(show_modal: self.$show_modal)){
                    Text("次へ")
                        .foregroundColor(Color.red)
                }
            }
        }
    .navigationBarTitle("確認")
    }
}

struct SignUpDone: View{
    @EnvironmentObject var userData: UserData
    @Binding var show_modal: Bool
    
    var body: some View{
        VStack {
            Spacer()
            Text("仮登録完了")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text(" ")
            Text("\"メッセージ\"に登録確認のリンクを")
            Text("送信しました。")
            Text("リンクにアクセスして")
            Text("新規登録を完了してください。")
            Text("「完了」をタップすると終了します。")
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            self.show_modal = false
            self.userData.inputDone = true
        } ) { Text("完了")
        .fontWeight(.bold) })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
        }
    }
}
