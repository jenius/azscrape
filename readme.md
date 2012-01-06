AzScrape
========

### What is it?

A quick and easy way to integrate amazon product search results into your web app. It functions much like an API - you put in a search query, how many pages of results you want, and it returns the list of products and details formatted as json.

### Example

Threw up a quick example of how it works here: http://www.azscrape.jenius.me/

### Installation

It's just a little sinatra app. Clone the repo, run `bundle`, run `shotgun`, and you're good to go.

### Usage

Once running, just hit the page with this url structure `/query/number_of_pages`

So, for example, this query:

`http://www.azscrape.jenius.me/ruby_on_rails/3`

...would return 3 pages of amazon's results of a search for "ruby on rails" (18 results per page). As you can see here, underscores are converted into spaces if necessary.

The API currently will return the **product title**, **author**, **image url**, and **amazon.com url**.

This is a super simple project, and if you would like it to return anything else or act in a different way, let me know or drop a pull request!

#### Warning
The more pages you try to return, the slower it will load. I would very highly recommend not asking for more than 5 at a time.