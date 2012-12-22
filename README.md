Style Guide [![Build Status](https://secure.travis-ci.org/pivotalexperimental/style-guide.png?branch=master)](https://travis-ci.org/pivotalexperimental/style-guide) [![Dependency Status](https://gemnasium.com/pivotalexperimental/style-guide.png)](https://gemnasium.com/pivotalexperimental/style-guide) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/pivotalexperimental/style-guide)
===

Style Guide is a mountable Rails engine where you curate and view your site's visual elements.

Tutorials on important topics, such as creating your own Style Guide sections, writing documentation for visual elements  and more can be found in the [Style Guide wiki](https://github.com/pivotalexperimental/style-guide/wiki).

## Usage

First, require the StyleGuide gem in `application.rb`:

    require "style_guide"


Then, append a directory of partials in `application.rb`:

    config.style_guide.partial_paths << Rails.root.join("app/views/styles")


Next, mount the StyleGuide application in `routes.rb`:

    mount StyleGuide::Engine => "/style-guide" unless Rails.env.production?


Finally, add `Rack::LiveReload` to `environments/development.rb`:

    config.middleware.insert_before(::Rack::Lock, ::Rack::LiveReload)


## Enhancing Your Experience

Running [Guard](https://github.com/guard/guard) is highly recommended:

    $ guard init
    INFO - livereload guard added to Guardfile, feel free to edit it
    $ guard
    INFO - LiveReload is waiting for a browser to connect.

Using [Foreman](https://github.com/ddollar/foreman) to manage the startup of
both your Rails app and Guard is an excellent idea.

First, turn off the Guard interactor so that it doesn't try to block output.
Add this line to the top of your `Guardfile`:

    interactor :off

Then add the following lines to `Procfile`, located in the root of your app:

    web: bundle exec rails s
    guard: bundle exec guard


## Best Practices

* Do not attempt to do layout in the Style Guide.  Attempting to make it lay
  out your pages will lead you down the road of madness.

* The canonical installation of Style Guide pulls in all of the
  directories under `app/views/style_guide`, like so:

      config.style_guide.partial_paths << Rails.root.join("app/views/style_guide/*")

* From here, the Style Guide is broken down into sections,
  like "Buttons", "Forms" and "Typography".

* You should only use static content in the partials you render
  to the Style Guide.


## Example

You can see an example of Style Guide at swivel's automatically-deployed
testing instance: [http://swivel.herokuapp.com](http://swivel.herokuapp.com)


## License

See `LICENSE` for more information.
