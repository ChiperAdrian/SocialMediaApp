//
//  EditProfileView.swift
//  SocialMediaAppV2
//
//  Created by Adrian Gabriel Chiper on 16.11.2022.
//

import SwiftUI
import PhotosUI
import Kingfisher

struct EditProfileView: View {
    // These are used to change the database in the onDisappear function
    var viewModel: ViewModel
    @State var name: String
    @State var quote: String
    @State var location: String
    @State var link: String
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    //@State var selectedImage: Image = Image(systemName: "person")

    
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                HStack {
                    if let photo = selectedPhotoData {
                        let img = UIImage(data: photo)
                        Image(uiImage: img!)
                            .resizable()
                            .frame(width:50, height:50)
                            .cornerRadius(30)
                    }
                    else {
                        if let currentUser = viewModel.currentUser {
                            if currentUser.profilePhotoUrl != "" {
                                KFImage(URL(string: currentUser.profilePhotoUrl))
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width:50, height:50)
                            }
                            else {
                                Circle()
                                    .frame(width:50, height: 50)
                            }
                        }
                    }
                    PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                        Image(systemName: "photo.circle")
                            .foregroundColor(.blue)
                            .padding(.bottom, 30)
                            .font(.title2)
                    }

                }
                VStack(alignment:.leading, spacing:5) {
                    Text("\(name)").font(.headline)
                    Text("@\(viewModel.currentUser?.fullname ?? "")").font(.caption).foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "person.text.rectangle").foregroundColor(.gray)
                    Text("Name:").font(.subheadline).fontWeight(.semibold)
                    TextField("Name", text: $name).foregroundColor(.blue)
                }.padding(.vertical)
                HStack {
                    Image(systemName: "quote.bubble").foregroundColor(.gray)
                    Text("Quote:").font(.subheadline).fontWeight(.semibold)
                    TextField("Quote", text: $quote).foregroundColor(.blue)
                }.padding(.vertical)
                HStack {
                    Image(systemName: "mappin.and.ellipse").foregroundColor(.gray)
                    Text("Location:").font(.subheadline).fontWeight(.semibold)
                    TextField("Location", text: $location).foregroundColor(.blue)
                }.padding(.vertical)
                HStack {
                    Image(systemName: "link").foregroundColor(.gray)
                    Text("Link:").font(.subheadline).fontWeight(.semibold)
                    TextField("Link", text: $link).foregroundColor(.blue)
                }.padding(.vertical)
                HStack {
                    Button {
                        viewModel.signOut()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left.square").foregroundColor(.gray)
                            Text("Logout").font(.subheadline).foregroundColor(.black).fontWeight(.semibold)
                        }
                    }
                }.padding(.vertical)
                Spacer()
            }.padding()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            if let user = viewModel.currentUser, let id = user.id {
                if user.fullname != name {
                    viewModel.databaseManager.updateUser(withId: id, field: "fullname", value: name)
                }
                if user.quote != quote {
                    viewModel.databaseManager.updateUser(withId: id, field: "quote", value: quote)
                }
                if user.location != location {
                    viewModel.databaseManager.updateUser(withId: id, field: "location", value: location)
                }
                if user.link != link {
                    viewModel.databaseManager.updateUser(withId: id, field: "link", value: link)
                }
            }
        }
        .onChange(of: selectedPhoto) { newPhoto in
            Task {
                if let data = try? await newPhoto?.loadTransferable(type: Data.self) {
                    selectedPhotoData = data
                    viewModel.uploadImage(imageData: data)
                }
            }
        }
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView(name: "", quote: "", location: "", link: "", selectedPhoto: "")
//    }
//}
