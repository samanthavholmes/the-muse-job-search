== README

The Muse Job Search
==========

A web application that allows a user to search for job listings using.

Technologies
------------

- Ruby on Rails backend
- jQuery/AJAX to enhance user experience
- HTML5/CSS3
  - Bootstrap framework used to enhance design
- RSpec testing
- SQLite3 database

Steps
-----

- Download SQL file
- Create SQLite3 database from SQL file
- Create new rails app
- Open database when user hits search
- Start a queue that adds nodes based off direct connections
  - Uses a breadth-first search method
  - First-in, first-out
- Stops adding to the queue as soon as the target is found in it
- Finds the path of names to return to user


Process
-------

I initially thought a graph would be the best way to solve this problem. I created a graph class and a method "populate_graph", which created an adjacency list of every item linked to an array of their direct children connections. The issue I ran into was how much time it took to build this. It took ~8 minutes to build the graph of the entire database. I then thought about making an adjacency matrix but a matrix of ~5,700,000 x 5,700,000 took even longer. I also decided to create another application to build the graph and then push it into a CSV file that I could use in this application to search through, which cut the time in half. I tried using that graph to find the children connections, but it was no faster than making the sql queries. (I kept this code commented out in the graph.rb file under initalizers and included the create_csv app in the zip file). That is when I created my own solution using a breadth-first search queue.

I was deciding between using a breadth-first search or a depth-first search because I wasn't sure if recursion or iteration would be the best way to go. I decided with breadth-first because since there are over 100 million connections, getting to the last children of each id before finding the target would take an exponential amount of time.

My solution works quickly for some queries, but others take a lot of time. Some working examples are:
  - Michael Jackson to Hotel
  - The Beatles to Elvis
  - ! to 1979

I also researched about the graph database neo4j, which seems like it could be a viable solution to seraching through a big database, such as this one.
