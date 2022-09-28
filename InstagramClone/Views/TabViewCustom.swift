//
//  TabViewCustom.swift
//  InstagramClone
//
//  Created by Fabian Josue Rodriguez Alvarez on 25/9/22.
//

import SwiftUI

enum TabViewIcons: String, CaseIterable {
    case home
    case magnifier
    case plusIcon = "plus-icon"
    case heart
    case profile
}

struct TabViewCustom: View {
    
    @State private var selectedTab: TabViewIcons = .home
    
    init() {
        //UITabBar.appearance().backgroundColor = UIColor.systemGray6
        UITabBar.appearance().isHidden = true
    }
    
    //Valida que la pantalla presente tenga insets. Esto para validar en pantallas de iPhone 13 o iphone 8, se muestre el padding del bottom o no.
    let insets = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first(where: {$0.isKeyWindow})?.safeAreaInsets ?? .zero
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            //Los tabView siempre estan cargadas en memoria, su totalidad de vistas, en este caso las 5 vistas estan cargadas en memoria.
            //Por eso, se se hace scroll en la vista principal, se cambia de vista y luego vuelve, la vista permanece como quedó.
            TabView(selection: $selectedTab) {
                ContentView()
                    .tag(TabViewIcons.home)
                    .ignoresSafeArea()
                
                Color.red
                    .tag(TabViewIcons.magnifier)
                    .ignoresSafeArea()
                
                Color.blue
                    .tag(TabViewIcons.plusIcon)
                    .ignoresSafeArea()
                
                Color.purple
                    .tag(TabViewIcons.heart)
                    .ignoresSafeArea()
                
                Color.green
                    .tag(TabViewIcons.profile)
                    .ignoresSafeArea()
            }
            
            tabView
        }
    }
    
    var tabView: some View {
        VStack(spacing: 0) {
            
            Divider()
                .overlay(Color("primary"))
                .frame(height: 1)
            
            HStack{
                ForEach(TabViewIcons.allCases, id: \.self) { item in
                    
                    if item == .profile {
                        
                        Button {
                            selectedTab = .profile
                        } label: {
                            Image("person-3")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 23, height: 23)
                                .clipShape(Circle())
                                .overlay{
                                    Circle()
                                        .stroke(Color("primary"))
                                        .opacity(selectedTab == .profile ? 1 : 0.1)
                                        .padding(.all, -4)
                                }
                        }
                        
                    } else {
                        
                        Button {
                            selectedTab = item
                        } label: {
                            
                            //Validar si el icono esta seleccionado
                            let selected = item == selectedTab ? "-selected" : ""
                            
                            Image(item.rawValue + selected)
                                .renderingMode(.template)
                                .foregroundColor(Color("primary"))
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, insets.bottom == 0 ? 10 : 0) //Agrega el padding cuando es pantalla como el del iPhone 8.
            .padding(.horizontal, 26)
            .background(Color("tabBar-bg"))
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct TabViewCustom_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCustom()
    }
}
