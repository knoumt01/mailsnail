REBOL [ 
    Title: "MailSnail for Syllable"
    Name: 'MailSnail
    File: %mailsnail.reb
    Author: "Matt Knouff"
    Version: 0.0.1
]

view layout [
    h1 "Mail Snail v0.1 "
        btn "Server Settings" [
            system/schemes/default/host: request-text/title "SMTP Server:"
            system/schemes/pop/host: request-text/title "POP Server:"
            system/schemes/default/user: request-text/title "SMTP User Name:"
            system/schemes/default/pass: request-text/title "SMTP Password:"
            system/user/email: to-email request-text/title "Your Email Address:"
        ]

        btn "New E-mail" [
        	view layout 
        	[ 
            	address: field "username@domain.extension"
            	subject: field "Subject"
            	body: area "Body"

            	btn "Send" [ 
                	send/subject (to-email address/text) body/text subject/text
                	alert "Sent!"
            	]
            
            	btn "Save" [ 

            	]

            	btn "Load" [

            	]            
            ]
        ]

        btn "Receive mail" [
	    mailbox: open pop://user:pass@host
            mailbox: tail mailbox
	    while [not head? mailbox] [
	        mailbox: back mailbox
                print first mailbox
            ]

            btn "Close" [
                close mailbox
            ]
        ]
]
