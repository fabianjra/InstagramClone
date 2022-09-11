//
//  ViewModel.swift
//  InstagramClone
//
//  Created by z419617 on 7/9/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var timelineList = [TimelineModel]()
    @Published var storyList = [StoryModel]()
    
    init() {
        self.timelineList = TimelineModel.getPost()
        self.storyList = StoryModel.getStories()
    }
}
