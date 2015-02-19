REBOL [ Title: "MailSnail for Syllable" ]

view layout [
		backcolor black
		h1 "Send Email: "
		btn "Server Settings" [
					system/schemes/default/host: 
request-text/title "SMTP Server:"
					system/schemes/pop/host: request-text/title "POP Server:"
					system/schemes/default/user: request-text/title "SMTP User Name:"
					system/schemes/default/pass: request-text/title "SMTP Password:"
					system/user/email: to-email request-text/title "Your Email Address:"
		]

		address: field "username@domain.extension"
		subject: field "Subject"
		body: area "Body"
	
		btn "Send" [ 
				send/subject (to-email address/text) body/text subject/text
				alert "Sent!"
		]
]
