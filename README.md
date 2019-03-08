# URL shortener (Ruby on Rails)

URL shortening web page, which provides short aliases for redirection of long URLs.

### Challenge Details
- We must be able to put a URL into the home page and get back a URL of the shortest possible length.
- We must be redirected to the full URL when we enter the short URL (ex:http://myshortener.whatever/a => https://google.com).
- There must be an endpoint that returns the top 100 most frequently accessed URLs.
- There must be a background job that crawls the URL being shortened, pulls the <title> from the website and stores it.
- Display the title with the URL on the top 100 board.


## Prerequisites
- Ruby 2.5.3
- [Git](https://github.com/)
- Rails  5.2.2
- [Postgres](https://www.postgresql.org/)

A guide to setting up a Ruby on Rails development environment
[Install Ruby On Rails on Windows 10](https://gorails.com/setup/windows/10#final-steps)

## Built With
- [sidekiq](https://github.com/mperham/sidekiq/wiki/Active+Job) - Simple, efficient background processing for Ruby.
- [securerandom](https://ruby-doc.org/stdlib-2.5.0/libdoc/securerandom/rdoc/Random/Formatter.html) - SecureRandom.alphanumeric generates a random alphanumeric string.
- [nokogiri](https://github.com/sparklemotion/nokogiri) - Nokogiri is an HTML parser.

## Installing
### Clone
Clone this repo to your local machine using `git`
> cd URL-shortener

### Setup
```
$ rake db:migrate
$ rails s
```
Go to `http://localhost:3000/` in your web browser.