# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    - User, Entry
- [x] Include at least one has_many relationship on your User model 
    - A User has many entries
- [x] Include at least one belongs_to relationship on another model 
    - Entry belongs_to User
- [x] Include user accounts with unique login attribute
    - Username and email require unique login attributes
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - User has full CRUD on volunteer entries
- [x] Ensure that users can't modify content created by other users
    - Users are redirected to login if they try to edit another users entries. Users cannot view 'delete' links or options of other user's volunteer entries. 
- [x] Include user input validations
    - Cannot create a blank user or blank volunteer entry.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - Sinatra Flash was used to display validation failures in the app, this doesn't necessarily integrate with     sidebar links. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - Present in Readme file

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message