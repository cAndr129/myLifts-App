myLifts App

This is a simple iOS app that allows the user to keep track of the major lifts they perform at the gym!
How to install:
  Seeing as this isnt a published iPhone app, one will have to dowload a copy of the app by opening xcode and having it download it via wired connection to 
  the desired iPhone for a 7 day trial. Seeing as this app is for practice developing software, there are no plans to publish the app at any time in the
  future. :(

Main View:
  When first opening the app, the user is presented with the main screen that shows all their stored lifts as cards. To add a new lift,
  the user should press the plus button in the top right corner of the screen.(See New Lifts) For each new lift that is added, the user
  can see basic information about in the card presented on the main screen, such as the name of the lift, the most recent weight for that lift, and their
  goal weight for that specific lift. If a user should decide to delete that lift, all they need do is swipe the card for that lift to the right and tap
  the trash can icon. To get more information about a specific lift,the user can click on any of the cards to enter the detailed view for that lift (See
  detail view for more infomration).

Detail View:
  When a user selects one of their lifts, they will primarily be greeted by the graph showing off their progress. This graph is the bread and butter of
  what this app is all about. It is a very simple graph, imported from the SwiftUI charts repo by AppPear. (See chart section for more information)This
  chart will show you the progression of that lift over time with an interactable line to see where your progress was at any given point. In the top corner
  of this view is an edit button to allow the user to make changes to this lift and its settings. (See Edit Detail View) At the bottom of the view is a
  button to record a new lift in the system (See Record a Lift).
  
Edit Detail View:
  
  
Chart:
  The line charts used to track the user's lift over time comes from the SwiftUI ChartView repo by AppPear. It is the best repository I could find that
  would chart user data the way I wanted it to. However, it does not mesh well with the flow of the rest of the view and will be replaced in the coming
  months with Apple's announcement about native chart development coming to SwiftUI!
  Link to AppPear's SwiftUI Charts:   https://github.com/AppPear/ChartView
