//
//  ContentView.swift
//  UI-636
//
//  Created by nyannyan0328 on 2022/08/07.
//

import SwiftUI

struct ContentView: View {
    @State var mainStack : [NavigationType] = []
    var body: some View {
        NavigationStack(path:$mainStack) {
            
            VStack(spacing:0){
                
                
                
                
                Home()
            }
            .navigationTitle("INSTAGRAM")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
               
                ToolbarItem(placement:.navigationBarTrailing){
                    
                    Button {
                        mainStack.append(.dm)
                    } label: {
                        
                        Image(systemName: "paperplane")
                        
                    
                    }

                    
                }
                
                ToolbarItem(placement:.navigationBarTrailing){
                    
                    Button {
                        mainStack.append(.camera)
                    } label: {
                        
                        Image(systemName: "camera")
                        
                    
                    }

                    
                }
                
                ToolbarItem(placement:.navigationBarLeading){
                    
                    Button {
                        mainStack.append(.home)
                    } label: {
                        
                        Image(systemName: "gear")
                        
                    
                    }

                    
                }
                
                
            }
            .navigationDestination(for: NavigationType.self) { value in
                
                
                switch value{
                    
                case.camera : MailView()
                    
                case .home : SettingView()
                    
                case .dm : CameraView()
                }
                
                
            }
            }
           
        }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum NavigationType : String,Hashable{
    case dm = "DM VIEW"
    case camera = "CAMERA VIEW"
    case home = "Home"
    
}
