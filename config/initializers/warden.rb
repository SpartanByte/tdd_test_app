# set the cookie for the signed in user and makes it available for custom methods
Warden::Manager.after_set_user do |user, auth, opts| 
    scope = opts[:scope] 
    auth.cookies.signed["#{scope}.id"] = user.id
end
   
# clears out the cookie when the user signs out
Warden::Manager.before_logout do |user, auth, opts| 
    scope = opts[:scope] 
    auth.cookies.signed["#{scope}.id"] = nil
end