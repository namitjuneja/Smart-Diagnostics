# Smart-Diagnostics

## Instructions for using
- requires Ruby >=2.1.5 Rails >=4.2.5
- there are 3 separate endpoints 
  - <ec2-52-36-92-7.us-west-2.compute.amazonaws.com:3000> ; returns json of 10 elements with their respective data
  - ec2-52-36-92-7.us-west-2.compute.amazonaws.com:3000/sec?id=[element_id] ; returns json containing secondary information of the specific element id 
  - <ec2-52-36-92-7.us-west-2.compute.amazonaws.com:3000/app>  ; the web app
- execute `rails s` in the root directory to start the server

## Looking at the Code
- app/controllers/main_controller.rb
  - Generates 10 random data points from a list of 20
- app/controllers/sec_controller.rb
  - Returns secondary information accessed using an AJAX request when a specific card is clicked.
- app/controllers/display_controller.rb
  - Renders the web application
  - Cards can be re-ordered by dragging
  - Cards are sorted in order of number of times clicked and and internal dependancy


## Questions?
Feel free to contact me!

### Namit Juneja
* <hello@namitjuneja.com>

