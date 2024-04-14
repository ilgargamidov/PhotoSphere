//
//  MainScreenPresenter.swift
//  PhotoSphere
//
//  Created by Илгар Гамидов on 12.04.2024.
//

import UIKit

protocol MainScreenPresenterProtocol: AnyObject{
  init(view: MainScreenViewProtocol)
  // var posts: [PostDate]? { get set }
  func getPosts()
}
class MainScreenPresenter{
  weak var view: MainScreenViewProtocol?
  // var posts: [PostDate]?
  required init(view: MainScreenViewProtocol) {
    self.view = view
    getPosts()
  }
}
extension MainScreenPresenter: MainScreenPresenterProtocol{
  func getPosts() {
    // self.posts = PostDate.getMockData()
    view?.showPosts()
  }
}
