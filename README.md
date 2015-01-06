# Sneakers.io

This is the http://sneakers.io main repository. It contains the main
landing page, and the blog sub-site.


## Adding content

With a [Middleman](http://middlemanapp.com) based build and workflow
it's very easy to add content yourself:

#### To blogs

Simply add under `source/blog`. Pick an example blog page to work out
of, and name it based on the date you want it to appear (you can also
use middleman CLI to generate it).

#### Add your experiences

You can add your experiences (which will appear on the landing page) to
the `_comments.html.erb` partial.

_currently this element is disabled until we get people to opt-in and
share more experiences :)_


## Workflow

Use either `middleman` directly or `s` to serve a local http server.




