# Demo App

## User Stories:

- [ ] Site Wide After Logged In: 2 hrs
  - [ ] help and about buttons
  - [ ] all hosts index page button
  - [ ] back button
  - [ ] search button
  - [ ] my traveler profile
  - [ ] my family profile

- [ ] Home page: 3 hrs

  - [ ] Traveler bkg image
  - [ ] Host Family search filters
  - [ ] Sign up, login buttons

  ORRRRRR

  - [ ] If cookies[:herebefore] is empty
    - [ ] Welcome/info page

- [ ] Sign up page: 3 hrs

  - [ ] Hello! Thank you for using ""! <br> As we establish our new company as the best way to exchange students, you can have one traveler per home for free!

  - [ ] Name
  - [ ] Email
  - [ ] Country
  - [ ] Create, redirect to login page notice: "You have been sent an email with a temporary password"

- [ ] First Login Page
  - [ ] Email
  - [ ] Temp pwd
  - [ ] New pwd
  - [ ] Confirm new pwd
  - [ ] Redirect to Profile Set up

- [ ] Payment page
  - [ ] yadadada
  - [ ] redirect to setup profile


- [ ] Login page: 2 hrs

  - [ ] Email
  - [ ] Password
  - [ ] Redirect to Logged in Search


- [ ] Logged in Search Page: 1 hr

  - [ ] Traveler bkg image
  - [ ] Host Family Search Filters

- [ ] After Search: 6 hrs

  - [ ] Search Filters/ search again up top
  - [ ] Index Page of hosts
  - [ ] Each host:
    - [ ] Location
    - [ ] "The Adams Family"
    - [ ] Family picture
    - [ ] House picture
    - [ ] Brief description: "Our 16 y/o son wants to travel to the US, we would love to treat your kid as our own!"
    - [ ] Filter selections
    - [ ] Link to profile
  - [ ] User must be logged in to access full profiles:
      - [ ] Popup with buttons to signup and login

- [ ] Host Profile: 4 hrs

  - [ ] "The Adams Family"
    - [ ] If User.family is blank, "This is my family" link to request acceptance
  - [ ] Family Picture
  - [ ] House Picture
  - [ ] House feature checkbox
  - [ ] Nearby Attractions
  - [ ] Host Owner Name
  - [ ] Brief description of family
  - [ ] Prof picture, name, age, dates of potential traveler(s)
    - [ ] Link to Potential Traveler page
  - [ ] Looking to host:
    - [ ] Gender: boy, girl, any
    - [ ] Age range
    - [ ] Dates
  - [ ] Other relevant info:
    - [ ] Requests of traveler
    - [ ] Pets
    - [ ] Smokers?
    - [ ] More in- [ ] depth family bio
    - [ ] Favorite family activities
    - [ ] Hosting Experience:
      - [ ] Picture, name, and age of previously hosted
      - [ ] Brief review of hosted's experience
      - [ ] Links to profile
      - [ ] Non-site hostings:
        - [ ] Description
        - [ ] Request contact info link
      - [ ] Connect page link
      - [ ] Clickable thumbnails of more pictures


- [ ]  Traveler profile 2 hrs

  - [ ] "Brick Hamlin, age 17 (mentally lol)"
  - [ ] Profile picture
  - [ ] Travel goals:
    - [ ] Brief Description: I.E. "I would love to travel to Europe for my Spring Break!"
    - [ ] Goal Filters:
      - [ ] Locations
      - [ ] Travel dates
      - [ ] Rural/suburban/urban
  - [ ] Brief Description of ideal host family
  - [ ] Bio
  - [ ] My Family:
      - [ ] Location
      - [ ] "The Adams Family"
      - [ ] Family picture
      - [ ] House picture
      - [ ] Brief description: "Our 16 y/o son wants to travel to the US, we would love to treat your kid as our own!"
      - [ ] Filter selections
      - [ ] Link to profile
    - [ ] Previously hosted by:
      - [ ] "The Adams Family"
    - [ ] Picture
    - [ ] Smokes?
    - [ ] Location
    - [ ] Brief description of Brick's experience:
      - [ ] "Brick was a pleasure to have! Polite and intelligent!"
    - [ ] Link to their page
    - [ ] Clickable thumbnails of any other pictures

- [ ] Setup Profile 2 hr

  - [ ] form
  - [ ] redirect to payment page


- [ ] My Traveler Profile: 3 hrs

    - [ ] Show Profile
    - [ ] If section is blank, "Add #{section}!" link to edit
      - [ ] Blank My Family Section:
        - [ ] Add or create your family buttons at TOP
          - [ ] Add:
            - [ ] Search for family profile by Host Profile Name
            - [ ] Show matching families with Host Name, Family Name, Family Picture
            - [ ] Each family has button "This is my family"
              - [ ] if traveler.user != family.user send request
              - [ ] else add family
            - [ ] Return to Profile
          - [ ] Create
            - [ ] Popup
              - [ ] If you are not the owner/renter of this property, please seek their permission.
              - [ ] Do you have permission to add your home?
    - [ ] Edit button


- [ ]  My Family Profile: 3 hrs

    - [ ] Show Profile
    - [ ] If section is blank, "Add #{section}!" link to edit
    - [ ] Edit button
    - [ ] My Travelers Section:
      - [ ] Add or create travelers
        - [ ] If host.travelers > 0, redirect to payment page
        - [ ] Add:
          - [ ] search by name in popup
          - [ ] index of names with pictures
          - [ ] "Add to My Family"
            - [ ] if traveler.user != family.user send request
            - [ ] else add traveler
        - [ ] Create: redirect to traveler profile setup

- [ ]  Connect Page: 3 hrs

    - [ ] Write a message

    - [ ] For Family:
      - [ ] Select preferred reference types checkboxes:
        - [ ] Friend, relative, school official, athletic coach, former travelers, former hosts, school counselor, teacher
      - [ ] Request reference number dropdown:
        - [ ] 0, 1, 2, 3, 4, 5
      - [ ] Require phone number for refs:
        - [ ] 0, 1, 2, 3, 4, 5

    - [ ] For Traveler
      - [ ] Select preferred reference types checkboxes:
        - [ ] Friend, relative, school official, athletic coach, former travelers, former hosts, school counselor, teacher
      - [ ] Request reference number dropdown:
        - [ ] 0, 1, 2, 3, 4, 5
      - [ ] Require phone number for refs:
        - [ ] 0, 1, 2, 3, 4, 5



## Controllers:

  - [ ] Users

## Models:

  - [ ] User:

has_many :travelers
belongs_to :family

has_many_and_belongs_to :users

has_secure_password

- [ ] attrs:
    - [ ] Name
    - [ ] Email
    - [ ] Password Digest

- [ ]  Traveler

belongs_to :family
belongs_to :hosted, class_name: "family"
belongs_to :user

attrs:
    - [ ] Name
    - [ ] Age
    - [ ] Location interests
    - [ ] brief info
    - [ ] bio
    - [ ] Prof pic
    - [ ] Other pics
    - [ ] User ID
    - [ ] MyFamily ID
    - [ ] Previous Hosts ID

- [ ]  Family

has_many :users
has_many :travelers
has_many :hosteds, class_name "Travelers", foreign_key: "host_id"

attrs:
    - [ ] Name
    - [ ] Prof Pic
    - [ ] House pic
    - [ ] brief info
    - [ ] bio


## MAILERS

- [ ] Sign up Mailer
  - [ ] Send custom link with username in params, username populates form field

- [ ]




Notes:

For home page:

Have necessary search filters, Age, Country they live in, Destination
