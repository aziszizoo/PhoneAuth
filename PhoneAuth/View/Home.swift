//
//  Home.swift
//  PhoneAuth
//
//  Created by ZISACHMAD on 19/05/21.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @State var selectedCategory : Category = categories.first!
    @AppStorage("log_Status") var status = false
    var white: Color = .white.opacity(0.75)
    @State var isSmall = UIScreen.main.bounds.height < 750
    
    func Header(title: String) -> HStack<TupleView<(Text, Spacer)>> {
        return
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(white)
                Spacer()
            }
    }
    
    var body: some View {
        VStack {
            // TOP BUTTON
            HStack {
                
                Button(action: {
                    try? Auth.auth().signOut()  // logout
                        withAnimation{status = false}
                }, label: {
                    Image(systemName: "power")
                        .font(isSmall ? .subheadline : .headline)
                        .padding(10)
                        .foregroundColor(Color.white)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(8)
                })
                
                Spacer()
                
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "person.fill")
//                        .font(.title2)
//                        .padding(10)
//                        .foregroundColor(Color.white)
//                        .background(Color.black.opacity(0.5))
//                        .cornerRadius(8)
//                })
                
            }
            .overlay(HStack {
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "location.fill")
                    Text("Harapan Raya, Pekanbaru")
                        .font(isSmall ? .caption2 : .caption)
                })
                .foregroundColor(white)
                .font(.callout)
                
            })
            .padding(.horizontal)
            .padding(.top)
            // TOP BUTTON
            
            
            ScrollView(.vertical, showsIndicators: true, content: {
                
                // hero
                HStack(spacing: 5) {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Meet Your New")
                            .font(isSmall ? .subheadline : .headline)
                            .foregroundColor(.white)
                        Text("BARBERSHOP")
                            .font(isSmall ? .title3 : .title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        
                        Divider()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Get Started")
                                .font(isSmall ? .subheadline : .headline)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 9, weight: .heavy))
                        })
                        .padding(.vertical,4)
                        .padding(.horizontal,9)
                        .background(white)
                        .cornerRadius(5)
                    }
                    
                    Spacer(minLength: 5)
                    
                    Image("hero")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: getRect().width / 2.2)
                }
                .padding([.vertical,.leading], 20)
                .background(LinearGradient(gradient: .init(colors: [Color("g1"),Color("g2")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                .cornerRadius(20)
                                .padding(.vertical,35)
                                .padding(.trailing,45)
                )
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                .padding(.horizontal)
                // hero
                
                
                // SERVICES CATEGORY
                Header(title: "Services")
                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 15) {
                        ForEach(categories) {Category in
                            
                            HStack(spacing: 10) {
                                Image(systemName: Category.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .padding(6)
                                    .background(selectedCategory.id == Category.id ? Color.white : Color.white.opacity(0.5))
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.black)
                                
                                Text(Category.title)
                                    .foregroundColor(selectedCategory.id == Category.id ? .white : white)
                            }
                            .padding(.vertical,9)
                            .padding(.horizontal)
                            .background(selectedCategory.id == Category.id ? Color.black : Color.gray)
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedCategory = Category
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                })
                // SERVICES CATEGORY
                
                // POPULAR
                HStack {
                    Text("Popular Now")
                        .font(.callout)
                        .foregroundColor(.white)
                    Spacer()
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing: 6) {
//                            Text("View All")
//                                .font(.footnote)
//                                .foregroundColor(.white)
                            Image(systemName: "chevron.right")
                                .font(.footnote)
                                .foregroundColor(.black)
                                .padding(.vertical,4)
                                .padding(.horizontal,6)
                                .background(white)
                                .cornerRadius(5)
                        }
                        .padding(.top,10)
//                    })
                }
                .padding(.horizontal)
                .padding()
                
                // popular now
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(popular_items) { item in
                            PopularItemRowView(item: item)
                        }
                    }
                    .padding()
                    .padding(.leading,10)
                })
                .padding(.top,-20)
            })
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
