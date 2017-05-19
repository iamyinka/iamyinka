class ContactMailer < ActionMailer::Base
  default to: "slankeyinc@gmail.com"
  layout 'mailer'

  def contact_email(name, email, phone, budget, startdate, description)
  	@name = name
  	@email = email
  	@phone = phone 
 		@budget = budget
 		@startdate = startdate
 		@description = description

 		mail(from: email, subject: "You are Hired!")
  end
end
