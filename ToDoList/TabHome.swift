//
//  TabHome.swift
//  ToDoList
//
//  Created by Abyl on 4/4/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import SwiftUI

struct TabHome: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "doc.plaintext")
                            .font(.system(size: 26))
                        //Text("List")
                    }
                }.tag(1)
            stView()
                .tabItem(){
                    VStack{
                        Image(systemName: "gear")
                            .font(.system(size: 26))
                        //Text("Settings")
                    }
            }
            
        }
    }
}

struct TabHome_Previews: PreviewProvider {
    static var previews: some View {
        TabHome()
    }
}
