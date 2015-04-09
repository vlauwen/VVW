class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/receiver/unsubscribe/$id"{
            controller = 'Receiver'
            action = 'unsubscribe'
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
