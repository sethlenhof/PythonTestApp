//
//  ContentView.swift
//  PythonTestApp
//
//  Created by Seth Lenhof on 3/8/24.
//

import SwiftUI
import CoreData
import AVKit

struct ContentView: View {
    @State var showResult: Bool = false
    @State private var showVideoPlayer = false
    
    private var videoURL: URL? {
            Bundle.main.url(forResource: "gymvid9_v1", withExtension: "mov")
        }
    
    var body: some View{
        VStack{
            if let videoURL = videoURL{
                Button("CHEST DAY") {
                    showVideoPlayer = true
                }
                .sheet(isPresented: $showVideoPlayer){
                    VideoPlayerView(url: videoURL)
                }
            }
            
            Text("What's up silly. Push the fucking button")
            Button(action: {
                RunPython()
                showResult.toggle()
            }) {
                Text("Run Python Script")
            }
            if showResult{
                Text(String("\(RunPython())"))
            }
        }
    }
}
