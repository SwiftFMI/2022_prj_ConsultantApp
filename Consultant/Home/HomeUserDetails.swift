////
////  HomeUserDetails.swift
////  Consultant
////
//
//import Foundation
//import Firebase
//
//struct User {
//    let id: String
//    let firstName: String
//    let lastName: String
//    let isEmplyer: Bool
//    let isConsultant: Bool
//}
//
//class UserService: ObservableObject {
//    @Published var user: User
//
//    func getUser(completion: @escaping(User) -> Void) async {
//        guard let user = Auth.auth().currentUser else { return }
//        let db = Firestore.firestore()
//
//        db.collection("Users").document(user.uid).getDocument { (snapshot, error) in
//
//            if error != nil {
//                print("Error fetching user data: \(error.localizedDescription)")
//                return
//            }
//
//            let currentUser: User
//            if let data = snapshot?.data() {
//
//            }
//            completion(currentUser)
//        }
//    }
//
//    func fetchUser() async {
//        await self.getUser { [weak self] user in
//            DispatchQueue.main.async {
//                self?.user = user;
//            }
//        }
//    }
//}
