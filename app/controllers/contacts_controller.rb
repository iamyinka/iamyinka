class ContactsController < ApplicationController


	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save

			name = params[:contact][:name]
			email = params[:contact][:email]
			phone = params[:contact][:phone]
			budget = params[:contact][:budget]
			startdate = params[:contact][:startdate]
			description = params[:contact][:description]

			ContactMailer.contact_email(name, email, phone, budget, startdate, description).deliver

			flash[:success] = "Thank you for contacting me. I will get back to you as soon as I can."
			redirect_to hire_path
		else
			flash[:danger] = "Please check field(s) marked with red"
			render 'new'
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :phone, :budget, :startdate, :description)
	end
end
