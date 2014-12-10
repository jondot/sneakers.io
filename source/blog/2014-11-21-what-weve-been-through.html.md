---
title: What We've Been Trough
layout: blog
authors: Dotan Nahum/jondotan@gmail.com/jondot
---

I think it's safe to say: Sneakers is production grade.
At all of my production deployments, Sneakers outlived and far exceeded it's original goal. On of them, it's been almost 2 years, 4 BILLION jobs processed, supporting 5 completely different use cases.


I'm humbled that a lot of smart people contributed to this project and major companies adopted it. All I hope for, is that it has saved you time, and made your job easier and more fun to do. 

That it solved a problem for you.

With that in mind - I'd like to share with you the news, and what's coming.


## The Numbers

Sneakers 0.7 (the latest stable release), and the `pre` versions did a lot so far:

* Over 4 BILLION jobs processed at 2 mission-critical deployments (one is touching money).
* At least 5 major companies have Sneakers running in production.
* Almost 900 stars, 29 watchers, and 86 forks.
* 35 pull requests merged
* Dozens of contributors!



## New and Notable Features

Since Sneakers 0.7, there's been a lot of community work which resulted
in excellent quality contributions. Here's a list of new and notable
features.

##### Rails ActiveJob

Sneakers is now supported with Rails' new [ActiveJob queueing API](http://edgeapi.rubyonrails.org/classes/ActiveJob/QueueAdapters.html).


To set Sneakers in your app:

```ruby
Rails.application.config.active_job.queue_adapter = :sneakers
```

Thanks Rails Team!


##### RetryHandler [PR-73](https://github.com/jondot/sneakers/pull/73)

You can now set up a retry handler - failing jobs will get retried up to a maximum number of times, afterwhich they'll be sent to an error queue.


This is a well known, healthy pattern, to promote self-healing and
reliability; which is why RabbitMQ supports dead letter policies.

To enable, add these to your worker options:

```ruby
:arguments => {
                  :'x-dead-letter-exchange' => 'downloads-retry'
              }
```

And configure your policy:

```ruby
Sneakers.configure(:handler => Sneakers::Handlers::Maxretry,
  :
  :
```

Through sophisticated message header juggling, we've got some awesome work by @imothee, led by @justin-yeswere with contributions by @lkang to make this happen.

Thanks guys!


##### Bunny Logger Sharing [PR-71](https://github.com/jondot/sneakers/pull/71)

Bunny is the RabbitMQ driver behind Sneakers. Sneakers will now share your main logger, and redirect core Bunny logs into your main logger.

Thanks @trungpham!

##### Internal/External API Improvements [PR-56](https://github.com/jondot/sneakers/pull/56), [PR-54](https://github.com/jondot/sneakers/pull/54), [PR-53](https://github.com/jondot/sneakers/pull/56), [PR-47](https://github.com/jondot/sneakers/pull/47)

Excellent pull requests from @norman who single-handedly crafted a better API for those of you building handlers and/or doing a bit more involved worker configuration.

Thanks @norman!

##### Better RabbitMQ Configuration [PR-52](https://github.com/jondot/sneakers/pull/52)

Sneakers now respects `RABBITMQ_URL` - thanks @norman!.

##### Publisher Persistence [PR-40](https://github.com/jondot/sneakers/pull/40)

Although `Sneakers::Publisher` weren't the focus of Sneakers, it
received some love from @jkogara, and you can now specify persistence:

```ruby
my_publisher.publish('test msg', routing_key: 'downloads', persistence: true)
```

Thanks @jkogara!

##### Use NewRelic for Metrics [PR-37](https://github.com/jondot/sneakers/pull/37)

You can now configure NewRelic for metrics:

```ruby
Sneakers.configure metrics: Sneakers::Metrics::NewrelicMetrics.new
```

Thanks @arielze!


#### Many More Additions

There's many more additions such as specifying routing keys explicitely,
enqueing via worker, etc.

You can take a look at the entire [list of additions](https://github.com/jondot/sneakers/pulls?q=is%3Apr+is%3Aclosed)

Thanks everyone!!



