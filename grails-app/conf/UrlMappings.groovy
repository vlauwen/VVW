class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/user/unsubscribe/$id"{
            controller = 'User'
            action = 'unsubscribe'
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
