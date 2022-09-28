//
//  ContentView.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    //Permite que la apareciencia del navigationBar (Header), customice su apariencia.
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "tabBar-bg")
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                Divider()
                    .overlay(Color("primary"))
                    .frame(height: 1)
                
                ScrollView{
                    VStack{
                        storyList
                        
                        Divider()
                            .overlay(Color("primary"))
                            .frame(height: 1)
                        
                        ForEach(viewModel.timelineList) { timeline in
                            TimelineView(timeline: timeline)
                        }
                        
                        //Corrige el problema de que el Scroll, queda escondido detras del TabView.
                        Color.clear.padding(.bottom, 20)
                    }
                    .toolbar {
                        toolbarHeaderView()
                    }
                }
            }.navigationBarTitleDisplayMode(.inline) //Quita el espacio donde iria el titulo del navigation.
        }
    }//END: Body
    
    var storyList: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(viewModel.storyList) { story in
                    StoryView(story: story)
                }
            }
            .padding(.leading, 10)
            .padding(.vertical, 8)
        }
    }
    
    @ToolbarContentBuilder
    func toolbarHeaderView() -> some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                //TODO: Action button
            } label: {
                Image("camera-Icon")
                    .renderingMode(.template) //Permite cambiar el color dependiendo de si es DarkMode
                    .foregroundColor(Color("primary"))
            }
        }
        
        ToolbarItem(placement: .principal) {
            Image("instagram-logo")
                .renderingMode(.template) //Permite cambiar el color dependiendo de si es DarkMode
                .foregroundColor(Color("primary"))
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                Button {
                    //TODO: Action button
                } label: {
                    Image("igtv")
                        .renderingMode(.template) //Permite cambiar el color dependiendo de si es DarkMode
                        .foregroundColor(Color("primary"))
                }
                
                Button {
                    //TODO: Action button
                } label: {
                    Image("messenger")
                        .renderingMode(.template) //Permite cambiar el color dependiendo de si es DarkMode
                        .foregroundColor(Color("primary"))
                }
            }
        }
    }
    
}//END: ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
