AzScrape
========
### An unofficial read-only api for amazon products

## Installation

It's just a little sinatra app. Clone the repo, run `bundle`, run `shotgun`, and you're good to go.

## Usage

Just hit this page again with the url format `/query/number_of_pages`

So, for example, this query:

`http://azscrape.dev/ruby_on_rails/3`

...would return 3 pages of amazon's results of a search for "ruby on rails". As you can see here, underscores are converted into spaces if necessary.

The API currently will return the **product title**, **author**, **image url**, and **amazon.com** url.

This is a super simple project, and if you would like it to return anything else or act in a different way, let me know or drop a pull request!

#### Warning
The more pages you try to return, the slower it will load. I would very highly recommend not asking for more than 5 at a time - each page returns 18 results.