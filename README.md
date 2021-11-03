# Weblog

A fabulous weblog parser.

Run the following to output the total views and unique views for a log file:
```
./bin/parser webserver.log
```

## Dev Notes

This was a slightly tricky problem to solve in an overly OO-way, in my opinion. I've broken things out into a few classes to meet to goals of the test, but I feel it would otherwise lend itself to a data-processing style of approach.

Obviously if the goal was to handle terabytes of logs, you would want to handle this in a different way, processing the text once on ingress and building out a data structure, probably with tree-based indices (or use a database that already implements this for you).
