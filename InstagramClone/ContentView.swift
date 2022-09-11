//
//  ContentView.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                Divider()
                    .overlay(Color("primary"))
                    .frame(height: 1)
                
                ScrollView{
                    VStack{
                        storyList
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
            .padding(.vertical)
            .padding(.leading, 20)
        }
    }
    
    @ToolbarContentBuilder
    func toolbarHeaderView() -> some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                //TODO: Action button
            } label: {
                Image("camera-Icon")
            }
        }
        
        ToolbarItem(placement: .principal) {
            Image("instagram-logo")
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                Button {
                    //TODO: Action button
                } label: {
                    Image("igtv")
                }
                
                Button {
                    //TODO: Action button
                } label: {
                    Image("messenger")
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
