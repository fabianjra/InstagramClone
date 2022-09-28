//
//  TimelineView.swift
//  InstagramClone
//
//  Created by Fabian Josue Rodriguez Alvarez on 25/9/22.
//

import SwiftUI

struct TimelineView: View {
    
    let timeline: TimelineModel
    
    var body: some View {
        VStack{
            headerView
            postImage
            actionIncons
            likeSection
            commentSection
        }
    }
    
    //Vista del encabezado.
    var headerView: some View {
        HStack{
            Image(timeline.user.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2){
                
                HStack {
                    Text(timeline.user.username)
                        .font(.system(size: 13, weight: .bold))
                    
                    if timeline.user.isVerified {
                        Image("official-icon")
                            .resizable()
                            .frame(width: 10, height: 10)
                    }
                }
                
                Text(timeline.user.city)
                    .font(.system(size: 11))
            }
            
            //Correr el contenido a la izquierda
            Spacer()
            
            Button {
                //TODO: Action
            } label: {
                Image("more-icon")
                    .renderingMode(.template) //Permite usar un color diferente en darkMode.
                    .foregroundColor(Color("primary"))
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    //Vista de la imagen posteada
    var postImage: some View {
        Image(timeline.photo)
            .resizable()
        
        //Va a ser del ancho de la pantalla.
            .frame(height: UIScreen.main.bounds.width)
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
    }
    
    //Botones debajo de la foto.
    var actionIncons: some View {
        HStack(spacing: 17){
            Button {
                
            } label: {
                Image("like")
                    .renderingMode(.template) //Permite usar un color diferente en darkMode.
                    .foregroundColor(Color("primary"))
            }
            
            Button {
                
            } label: {
                Image("comment")
                    .renderingMode(.template) //Permite usar un color diferente en darkMode.
                    .foregroundColor(Color("primary"))
            }
            
            Button {
                
            } label: {
                Image("messenger")
                    .renderingMode(.template) //Permite usar un color diferente en darkMode.
                    .foregroundColor(Color("primary"))
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image("save")
                    .renderingMode(.template) //Permite usar un color diferente en darkMode.
                    .foregroundColor(Color("primary"))
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var likeSection: some View {
        HStack{
            Image(UserModel.getUsers().randomElement()!.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 17, height: 17)
                .clipShape(Circle())
            
            //El simbolo: + permite concatenar
            Text("Liked by ") +
            Text(UserModel.getUsers().randomElement()!.username).bold() +
            Text(" and ") +
            Text("44,000").bold() +
            Text(" others").bold()
        }
        .font(.system(size: 13))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var commentSection: some View {
        HStack{
            Text(timeline.user.username).bold() +
            Text(" \(CommentModel.getComments().randomElement()!.comment)")
        }
        .font(.system(size: 13))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(timeline: TimelineModel.getPost()[0])
        //.scaleEffect(CGSize(width: 2.0, height: 2.0)) //Zoom para ver la imagen en grande.
    }
}
