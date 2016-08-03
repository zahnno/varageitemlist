#Set up Api

- Unzip Tar file
- Access computers terminal
- Navigate to the unzipped directories parent directory in terminal

*in terminal*
- cd varageitemlist
- bundle install
- rake db:migrate
- rake db:seed

##To access from browser

*in terminal*
- rails s

*desktop*
- open a browser(Mozilla, Chrome..etc)
- In url
    localhost:3000

*side note*

After the Api response is received in the browser, you must hit the browsers back button and refresh the page to see the initial menu.

##Running test suite

bundle exec rspec
