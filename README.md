# Outline:

- A very basic world-time app where the user can choose a city from a list of locations and then be shown the 12 hour time in that city using the [WorldTime API](http://worldtimeapi.org/timezones).
- The app has 3 main pages:
    - A home page where the time, location name, country flag as well as a changing background image based on the time of day are displayed.

    ![alt text](https://github.com/akashvshroff/Flutter_World_Time_App/blob/master/runtime_images/home_screen.png "Day-Time")

    ![alt text](https://github.com/akashvshroff/Flutter_World_Time_App/blob/master/runtime_images/home_night.png "Night-Time")

    - A location page where the user can change the location for which they want the data.

    ![alt text](https://github.com/akashvshroff/Flutter_World_Time_App/blob/master/runtime_images/choose_location.png "Locations")

    - A loading page that is displayed when the app starts up, it consists of a spinner widget built using the flutter_spinkit package.

    ![alt text](https://github.com/akashvshroff/Flutter_World_Time_App/blob/master/runtime_images/loading.png "Loading")

- A detailed description of the application lies below.

# Purpose:

- I've always been extremely interested in the seemingly magical process through which apps are conjured and when I heard about Flutter, a framework through which I could build cross platform apps using just one codebase, I was extremely intrigued.
- Using the [helpful beginner course](https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ) by NetNinja, I slowly came to grips with the basics of the framework and in the course, we built a very simply time app, which I tweaked slightly in this repository.
- The language dart, was a lot more inviting that I had initially expected and it came easily to me given my experience in OOP through python and java.
- After more research into app-making with Flutter, I realise that I am not even scratching the tip of the iceberg with this application and am looking to learn how to use packages such as Firebase to make more useful apps and incorporate databases through Firestore and sqflite3.

# Description:

- The app itself is very simple, there are 3 routes for each of the pages described above and the main object used throughout the app is the instance of a WorldTime class (the file for each lies in the services folder in lib).
- This class consists of the following parameters:

    ```dart
    class WorldTime{
    	String location; //location name displayed to users
    	String time; //formatted 12 hour that is displayed
    	String url; //API endpoint string
    	String flag; //path for flag image in assets folder
    	bool isDaytime; //determines the background image depending on time
    	WorldTime({this.location, this.url, this.flag});

      Future <void> getTime() async{
        //api request here
      }
    }
    ```

- The class also consists of a getTime method which handles the API request using the http package and decodes the JSON to a dart map. The datetime is converted to a dart DateTime object and since DateTime is not timezone aware, the offset is calculated and added or subtracted (via Duration objects) based on the offset sign to give the accurate local time. The isDaytime bool is also calculated now.
- All API requests are made using asynchronous functions to ensure that they do not slow down the app by blocking other code from running.
- The choose_locations file stores a list of objects for all the locations that are in the app as of now and is used by the ListView widget to display and allow users to pick the specific location.
- The time for some cities, such as Calgary and Bangalore, which do not have separate endpoints in the worldtime API, is calculated by using the endpoints for another city which they share a timezone with which is available using the API.
- All the routing in the app is handled using the Navigator object and its specific methods and depending on what method is used, the data is passed accordingly.
- When the user opens the app, they are met by the loading screen and then the home screen where some default time and then they can edit the location and access the locations via the edit location icon and oscillate between the home and location screens.
