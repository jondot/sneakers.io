---
title: Sneakers 1.0 - The New Website
layout: blog
authors: Dotan Nahum/jondotan@gmail.com/jondot
---

As you might have noticed, Sneakers got a refreshing facelift and a new website!

The goal was both to indicate we're going 1.0, and to set up a worthy go-to place for the now evolving Sneakers community. After a few weeks of fighting simple vs. complex, grand vs. elegant, we finally came at a simple, and elegant visual for Sneakers.

### Enjoy!

With the new website you can easily <a href="http://sneakers.io">quickstart</a>, track versions, read the <a href="http://sneakers.io/blog">blog</a>, browse our Wiki based <a href="https://github.com/jondot/sneakers/wiki">documentation</a>, and see what others are up to.

### Join in!

As with the spirit of Sneakers, as a member of the community, you can
change anything in the Sneakers landing page, blog, or add a blogpost of
your own through <a href="https://github.com/jondot/sneakers.io">submitting a pull request</a>.


#### Add a post on the Sneakers blog

We're using <a href="http://middlemanapp.com">Middleman</a>
and markdown-based blogging similar to Jekyll and Octopress.



Adding a post is a matter of <a
href="https://github.com/jondot/sneakers.io">submitting a
pull request</a> to the `sneakers.io` repo, after adding a markdown post of your choosing to `source/blog/`


One thing to note is that we have a custom support for attribution metadata.


```yaml
---
title: The New Website
layout: blog
authors: Dotan Nahum/jondotan@gmail.com
---

```

You should specify `Your Name/your-email@company.com` and that will
be picked up and rendered into your <a
href="http://gravatar.com">gravatar</a> and name.


#### Add yourself onto the front page

There's a section called 'comments', and if you're using Sneakers and
you're happy about it - please feel free to leave your mark.


Just add your own comment block in the `_comments.html.erb` partial:

```html
  <div class="comment">
    <div class="comment-image">
      <img src="<%= gravatar('foobar@gmail.com', 64) %>" alt=""/>
    </div>
    <div class="comment-content">
      <p>Sneakers is great!, able to deploy and go pro in around one day. We're processing around 1 billion events per day at Corpware.</p>
      <p class="comment-detail">
        John Singleton, CEO at Corpware
      </p>
    </div>
  </div>
```




