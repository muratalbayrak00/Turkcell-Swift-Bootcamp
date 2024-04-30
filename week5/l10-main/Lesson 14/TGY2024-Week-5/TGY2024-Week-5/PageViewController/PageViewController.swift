import UIKit

class OnboardingViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    var pageTitles: [String] = ["Hoş Geldiniz!", "İleri Adımlara Geçelim!"]
    var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
    }

    func createPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self

        let startingViewController = viewControllerAtIndex(0)
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: false, completion: nil)

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }

    func viewControllerAtIndex(_ index: Int) -> UIViewController {
        if index >= 0 && index < pageTitles.count {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red

            // Buraya her sayfanın içeriğini ekleyebilirsiniz, örneğin bir resim veya metin.

            return viewController
        }

        return UIViewController()
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController ).view.tag
        if index == 0 || index == NSNotFound {
            return nil
        }

        index -= 1
        return viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! UIViewController).view.tag
        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == pageTitles.count {
            return nil
        }

        return viewControllerAtIndex(index)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
}

/*
X 1000 BASAMAKLI BIR SAYI OLSUN
Y 1000 BASAMAKLI BIR SAYI OLSUN
 
 Divide & Conquer
 
 K = 1234 = 12.100 + 34 = 12.10^(n/2)+34
 
 X = AB = A.10^n/2 + B
 Y = CD = C.10^n/2 + D
 
 
*/
