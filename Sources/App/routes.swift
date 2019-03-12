import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // MARK: Static Pages

    // '/about'
    router.get("about") { req in
//        let fm = FileManager.default
//        let currentDirectoryPath = fm.currentDirectoryPath
//        print("currentDirectoryPath = \(currentDirectoryPath)")
        return try req.view().render("About.leaf")
    }

    // '/contact'
    router.get("contact") { req in
        return try req.view().render("Contact.leaf")
    }
    
    //// '/search' :TBD: advanced search page
    //router.get("search") { req in
    //    return try req.view().render("search")
    //}
    
    //// '/subscribe' :TBD: ... or just a button? add to footer?
    //router.get("subscribe") { req in
    //    return try req.view().render("subscribe")
    //}

    // '/reference_bootstrap'
    router.get("reference_bootstrap") { req in
        return try req.view().render("RefBootstrap.leaf")
    }

    // '/reference_generated'
    router.get("reference_generated") { req in
        return try req.view().render("RefGenerated.leaf")
    }

    // '/reference_workflow'
    router.get("reference_workflow") { req in
        return try req.view().render("RefWorkflow.leaf")
    }
    
    // MARK: Generated Pages

    // '/' home (featured) page. based on bootstrap 'blog'
    router.get { req in
        return try req.view().render("Home.leaf")
    }

    // '/archives' :TBD: ... or maybe just the menu is generated
    router.get("archives") { req in
        return try req.view().render("Archives.leaf")
    }

    // '/category/name' :TBD: ... or maybe just the menu is generated
    // browse category tree. use post for specific article
    router.get("category") { req in
        return try req.view().render("Category.leaf")
    }

    // '/category_tree' :TBD: ... or maybe just the menu is generated
    router.get("category_tree") { req in
        return try req.view().render("CategoryTree.leaf")
    }

    // '/recent' :TBD: ... or maybe just the menu is generated
    // browse submit|update timeline. else, use post for specific article
    router.get("recent") { req in
        return try req.view().render("Recent.leaf")
    }

    // MARK: Posts
    
    // '/post/yyyy/mm/name'
    router.get("post", String.parameter, String.parameter, String.parameter) { req -> Future<View> in
        let year = try req.parameters.next(String.self)
        let month = try req.parameters.next(String.self)
        let name = try req.parameters.next(String.self)
        let path = "blog_m/\(year)/\(month)/\(name).leaf"
        return try req.view().render("\(path)")
    }

}
