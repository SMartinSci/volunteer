# Charlottesville Community Volunteer Log Application

Volunteer is a CRUD (Create, Read, Update, and Delete), Model-View-Controller web application using the Sinatra framework. The Front-end of the application is styled with Javascript, HTML5 + CSS3 using a modified version of a HTML5Up responsive template design. The Charlottesville Community Volunteer application allows a user the ability to create an account, add and edit their own volunteer entries and view all users' volunteer entries. A user has many entries and entries belongs to a user. For user authentication, username and password validators were created with a combination of Ruby and RegEx. Logged in users can create entries and edit or delete their entries. 

For more information on how to use the app, watch my walkthrough: [![Demo video](http://i3.ytimg.com/vi/bdTiA8WLf-s/maxresdefault.jpg)](https://www.youtube.com/watch?v=bdTiA8WLf-s&feature=youtu.be)
And for more information on how this app was created, you can view my [blogpost](http://sherrymartin.info/sinatra_mvc_application_volunteer).

## Installation

You can install this app by running in your terminal git clone [git@github.com:SMartinSci/volunteer.git](git@github.com:SMartinSci/volunteer.git)

## Usage

After cloning, change directory to Volunteer 'cd volunteer', and run the following:

    $ bundle install
    $ rake db:migrate
    $ shotgun

## Contributing

Bug reports and pull requests are welcome on GitHub at `https://github.com/'diligent-markup-7911'/volunteer`. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GlobalFoodFestivals project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/SMartinSci/volunteer/blob/master/CODE_OF_CONDUCT.md).

## Credits

Bootstrap references were obtained from [here](https://getbootstrap.com/). Project structure developed with Corneal gem.