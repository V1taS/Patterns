//
//  CourseListViewController.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

// InputView
protocol CourseListViewProtocol: class {
    func reloadData()
}

// OutputProtocol
protocol CourseListOutputProtocol: class {
    var coursesCount: Int { get }
    var course: Course? { get }
    init(view: CourseListViewProtocol)
    func showCourses()
    func selectRow(at indexPath: IndexPath)
    func showCourseDetails()
}

class CourseListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    var presenter: CourseListOutputProtocol!
    
    private let configurator: CourseListConfiguratorProtocol = CourseListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.showCourses()
        tableView.rowHeight = 100
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        let configurator: CourseDetailsConfiguratorProtocol = CourseDetailsConfigurator()
        configurator.cofigure(with: detailVC, and: sender as! Course)
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.coursesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell",
                                                 for: indexPath) as! CourseTableViewCell
        presenter.selectRow(at: indexPath)
        cell.configure(with: presenter.course)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.selectRow(at: indexPath)
        presenter.showCourseDetails()
    }
}

// MARK: - CourseListViewProtocol
extension CourseListViewController: CourseListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
