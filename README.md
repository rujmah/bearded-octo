## bearded-octo

Rails web-app playing with Devise and Mongoid. 

Just a place to play with some of the things Devise can do for User models. In this case using Mongoid as a personal preference, but also to see what it can do.  

### Models

Currently, Admin and Company. For 'Company' read 'regular User'.

Wanted to set up a User model that allowed for overall SuperAdmin/Access-All-Areas for Admin and restricted areas for other groups of users.

Several ways to go from here, but I have implemented (this round at least) a system where the controllers before filters figure out who gets access.

Quick but messy as I had to define methods on each controller (see below).  

Will be looking at other ways of doing this going forward. (Probably from looking at the Devise example apps: https://github.com/plataformatec/devise/wiki/Example-Applications)

Would welcome suggestions and pull requests.

### Example method on app/controllers/company_controller.rb
Uses the Devise method `[user_model]_signed_in?` and declare the `before_filter`

```ruby 
	def is_company_unless_admin
	  unless admin_signed_in? or company_user_signed_in?
	    redirect_to new_company_user_session_path, alert: "You must be logged in to access this Corporate Hospitality area"
	  end
	end
```