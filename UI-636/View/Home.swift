//
//  Home.swift
//  UI-636
//
//  Created by nyannyan0328 on 2022/08/07.
//

import SwiftUI
import Lottie

struct Home: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab : Tab = .home
    
    @Environment(\.self) var env
    
    @State var animatedIcon : [AnimatedIcon] = {
        
        var tabs : [AnimatedIcon] = []
        
        for tab in Tab.allCases{
            
            tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue,bundle: .main)))
            
            
        }
        
        return tabs
        
        
        
    }()
    var body: some View {
       
            
            TabView(selection: $currentTab) {
                
                
                Text("Home")
                    .setBG()
                    .tag(Tab.home)
                
                Text("Message")
                    .setBG()
                    .tag(Tab.chat)
                
                Text("Saved")
                    .setBG()
                    .tag(Tab.notifications)
                
                Text("Profile")
                    .setBG()
                    .tag(Tab.account)
            }
            
            if #available(iOS 16, *){
                
                TabBar()
                    .toolbar(.hidden, for: .tabBar)
                
                
            }
            else{
                
                
            }
            
            
        
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            ForEach(animatedIcon){icon in
                
                let tabColor : SwiftUI.Color = currentTab == icon.tabIcon ? (env.colorScheme == .dark ? .white : .red) : .gray
                
                ResizebleLottieView(lottieView: icon.lottieView,color: tabColor)
                    .font(.title2)
                    .frame(width: 45,height: 45)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        
                        currentTab = icon.tabIcon
                        icon.lottieView.play{_ in}
                        
                    }
            }
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .background{
         
            (env.colorScheme == .dark ? Color.black : Color.white)
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View{
    @ViewBuilder
    func setBG()->some View{
        
        self
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background{
           
              Color.primary.opacity(0.1)
                  .ignoresSafeArea()
          }
    }
}
