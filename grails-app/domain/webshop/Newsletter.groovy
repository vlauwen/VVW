package webshop

class Newsletter {

    String title
    String content
    Date dateSendMail

    static hasMany = [receivers : Receiver]

    static mapping = {
        receivers cascade: "all"
    }

    static constraints = {
        content(maxSize : 1200, nullable: false)
        receivers(nullable: false)
    }
}
