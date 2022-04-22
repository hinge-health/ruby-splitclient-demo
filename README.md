# ruby-splitclient-demo

This is a demo rails app that reproduces an issue with the Split.io Ruby SDK.

Using ruby version `2.6.9` and bundler `2.3.6`.

To reproduce the problem, add `.env` file with split API key

```
SPLIT_IO_API_KEY=<api key>
```

And then run `bundle install` and `bundle exec puma`.  The server will block on startup for 10 seconds and then exit.  The Split.io client log will be in `logfile.log`.
