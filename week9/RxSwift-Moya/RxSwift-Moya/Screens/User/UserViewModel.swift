//
//  UserViewModel.swift
//  RxSwift-Moya
//
//  Created by Kerim Çağlar on 27.04.2024.
//

import RxMoya
import RxSwift

final class UserViewModel {
    
    func fetchUsers() -> Observable<[User]> {
        return .create { observer in
            ForumNetworkManager.shared.getUsers()
                .subscribe { users in
                    observer.onNext(users)
                } onFailure: { error in
                    print(error.localizedDescription)
                    observer.onError(error)
                }
        }
    }
    
}
