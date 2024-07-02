//
//  TestProfileView.swift
//  TrainingApp
//
//  Created by kysel95 on 26/10/2023.
//

import SwiftUI
import PhotosUI
import NavigationTransitions

struct TestProfileView: View {
    var user: User?
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    @State private var primaryColor = Color.white
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
        ScrollView {
            LazyVStack {
                ProfileHeaderView(user: user)
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .center)
                NavigationLink {
                    SoonView(barTitle: .statistics, user: user)
                } label: {
                    HStack(spacing: 20) {
                        ZStack(alignment: .leading) {
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 6)
                            Circle()
                                .trim(from:0, to: 0.75)
                                .stroke(Color.circleBar1, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                                .rotationEffect(.degrees(-90))
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 6)
                                .frame(width:60, height: 42, alignment: .center)
                            Circle()
                                .trim(from:0, to: 0.6)
                                .stroke(Color.circleBar2, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                                .rotationEffect(.degrees(-90))
                                .frame(width:60, height: 42, alignment: .center)
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 6)
                                .frame(width:60, height: 24, alignment: .center)
                            Circle()
                                .trim(from:0, to: 0.7)
                                .stroke(Color.circleBar3, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                                .rotationEffect(.degrees(-90))
                                .frame(width:60, height: 24, alignment: .center)
                        }
                        .frame(width:60, height: 60, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text("Statistics")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Check yor activity and progress")
                                .font(.footnote)
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                        Image(systemName: "arrowshape.right.fill")
                    }
                    .padding(20)
                    .padding([.top,.bottom],5)
                    .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, -10)
                }
                HStack {
                    Text("My progress")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.basicTitle).opacity(0.8)
                    Spacer()
                    HStack {
                        NavigationLink {
                            SoonView(barTitle: .shareProgress, user: user)
                        } label: {
                            HStack(spacing: 5){
                                Image(systemName:"square.and.arrow.up")
                                Text("Share")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                            }
                            .padding(8)
                            .padding([.leading, .trailing], 15)
                            .background(.white.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
                .padding(20)
                .padding(.bottom, -30)
                HStack(spacing: 10) {
                    VStack {
                        Text("0")
                            .font(.title)
                            .fontWeight(.bold)
                        HStack(spacing: 1) {
                            Image(systemName: "flame.fill")
                                .imageScale(.medium)
                                .foregroundColor(Color.circleBar1)
                            Text("KAL.")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    }
                    .padding([.top,.bottom],15)
                    .padding([.leading, .trailing], 32)
                    .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                    VStack {
                        Text("0")
                            .font(.title)
                            .fontWeight(.bold)
                        HStack(spacing: 1) {
                            Image(systemName: "figure.strengthtraining.traditional")
                                .imageScale(.medium)
                                .foregroundColor(Color.circleBar1)
                            Text("WORKOUT")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    }
                    .padding([.top,.bottom],14)
                    .padding([.leading, .trailing], 15)
                    .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                    VStack {
                        Text("0")
                            .font(.title)
                            .fontWeight(.bold)
                        HStack(spacing: 1) {
                            Image(systemName: "alarm.fill")
                                .imageScale(.medium)
                                .foregroundColor(Color.circleBar1)
                            Text("MIN.")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    }
                    .padding([.top,.bottom], 15)
                    .padding([.leading, .trailing], 32)
                    .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                }
                .padding(20)
                .padding(.bottom, -30)
                HStack {
                    Text("Settings")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.basicTitle).opacity(0.8)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, -50)
                List {
                    ForEach(Settings.allCases) { setting in
                        NavigationLink {
                            setting.destination
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: setting.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(setting.imageBackgroundColor)
                                Text(setting.title)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "arrowshape.right.fill")
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.1))
                    .listRowSeparator(.hidden, edges: .top)
                    .listRowSeparatorTint(.black)
                }
                .scrollDisabled(true)
                .padding(0)
                .frame(width: 390, height: 290, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, -50)
                HStack {
                    Text("Instructions")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.basicTitle).opacity(0.8)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, -50)
                List {
                    ForEach(Instructions.allCases) { instruction in
                        NavigationLink {
                            instruction.destination
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: instruction.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(instruction.imageBackgroundColor)
                                Text(instruction.title)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "arrowshape.right.fill")
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.1))
                    .listRowSeparator(.hidden, edges: .top)
                    .listRowSeparatorTint(.black)
                }
                .scrollDisabled(true)
                .padding(0)
                .frame(width: 390, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, -50)
                HStack {
                    Text("We love your feedback!")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.basicTitle).opacity(0.8)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, -50)
                List {
                    ForEach(Feedbacks.allCases) { feedback in
                        NavigationLink {
                            feedback.destination
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: feedback.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(feedback.imageBackgroundColor)
                                Text(feedback.title)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "arrowshape.right.fill")
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.1))
                    .listRowSeparator(.hidden, edges: .top)
                    .listRowSeparatorTint(.black)
                }
                .scrollDisabled(true)
                .padding(0)
                .frame(width: 390, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, -20)
                HStack {
                    Text("Follow us")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.basicTitle).opacity(0.8)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, -50)
                List {
                    ForEach(Followus.allCases) { followus in
                        NavigationLink {
                            followus.destination
                        } label: {
                            HStack(spacing: 10) {
                                Image(followus.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(followus.imageBackgroundColor)
                                Text(followus.title)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "arrowshape.right.fill")
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.1))
                    .listRowSeparator(.hidden, edges: .top)
                    .listRowSeparatorTint(.black)
                }
                .scrollDisabled(true)
                .padding(0)
                .frame(width: 390, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, -20)
                List {
                    ForEach(Logout.allCases) { logout in
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: logout.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(logout.imageBackgroundColor)
                                Text(logout.title)
                                    .font(.body)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "arrowshape.right.fill")
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.1))
                    .listRowSeparator(.hidden, edges: .top)
                    .listRowSeparatorTint(.black)
                }
                .scrollDisabled(true)
                .padding(0)
                .frame(width: 390, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, -50)
                VStack(alignment: .center) {
                    Text("The application was written for a scientific purpose.")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    (Text("It will be gradually updated with new features in the future.") + Text(Image(systemName: "heart.fill"))
                        .foregroundColor(.red))
                        .frame(maxWidth: 250, alignment: .center)
                        .foregroundColor(Color.basicTitle).opacity(0.8)
                        .multilineTextAlignment(.center)
                    Text("Beta Version: 1.0")
                        .padding()
                }
                .padding(20)
            }
        }
        .modifier(BackgroundModifier())
        .foregroundStyle(primaryColor)
    }
    .navigationTransition(.fade(.cross))
    .accentColor(.white)
    }
}

struct TestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TestProfileView(user: dev.user)
        //TestProfileView()
    }
}
