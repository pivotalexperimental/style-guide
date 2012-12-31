Style Guide [![Build Status](https://secure.travis-ci.org/pivotalexperimental/style-guide.png?branch=master)](https://travis-ci.org/pivotalexperimental/style-guide) [![Dependency Status](https://gemnasium.com/pivotalexperimental/style-guide.png)](https://gemnasium.com/pivotalexperimental/style-guide) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/pivotalexperimental/style-guide)
===

Style Guide is a mountable Rails engine where you curate and view your site's visual elements.

Tutorials on important topics, such as creating your own Style Guide sections, writing documentation for visual elements and more can be found in the [Style Guide wiki](https://github.com/pivotalexperimental/style-guide/wiki).


Features
--------

* Simple: just directories of partials
* Responsive: see how everything looks on a mobile device
* Live: file changes are presented immediately when using [LiveReload](http://livereload.com)
* Documentation-aware: each partial can be documented with an i18n scope


Anti-Features
-------------

* Not a Layout Guide: visual elements should not be composed
* Not a linting tool: no warnings or errors are displayed
* Curated, not magic: providing fake data for partials is not covered


Example
-------

You can see an example of Style Guide at swivel's automatically-deployed
testing instance: [http://swivel.herokuapp.com](http://swivel.herokuapp.com)


Installation
------------

The simplest way to install Style Guide is to use [Bundler](http://gembundler.com).

Add Style Guide to your `Gemfile`:

```ruby
group :development do
  gem 'style-guide'
end
```

Then, use Bundler to install the gem and its dependencies:

```bash
$ bundle install
```

Last, run the Rails generator to configure your app:

```bash
$ rails g style_guide:install
```

The generator will install [guard-livereload](https://github.com/guard/guard-livereload) and [rack-livereload](https://github.com/johnbintz/rack-livereload).

Consult the [Style Guide wiki](https://github.com/pivotalexperimental/style-guide/wiki) for more information about what the generator does.


Workflow
--------

Style Guide comes prepackaged with the Bootstrap Base CSS elements.  Naturally, you'll want to add your own sections, starting with Branding.

1. Go to your application directory.
1. Start your Rails server:

    ```bash
    $ rails s
    ```

1. Start Guard:

    ```bash
    $ guard
    ```

1. Open your Rails app's Style Guide: [http://localhost:3000/style-guide](http://localhost:3000/style-guide)
1. Create a directory in your Rails app called `app/views/style_guide`.
1. Create a directory called `app/views/style_guide/branding`.
1. Browse to the [Branding](http://localhost:3000/style-guide/branding) section.
1. Create a new file called `app/views/style_guide/branding/_colors.erb` containing:
    
    ```html
    <div class="branding-color-swatches">
      <div class="primary">Primary</div>
      <div class="secondary">Secondary</div>
      <div class="accent">Accent</div>
    </div>
    ```

1. Create a new file called `app/assets/stylesheets/_variables.scss` containing:

    ```scss
    $brandPrimary: #B90020;
    $brandSecondary: #6D99D3;
    $brandAccent: #C59E16;
    ```

1. Create a new directory called `app/assets/stylesheets/branding`.
1. Create a new file called `app/assets/stylesheets/branding/colors.css.scss` containing:

    ```scss
    @import "variables";
    .branding-color-swatches {
        .primary { background-color: $brandPrimary; }
        .secondary { background-color: $brandSecondary; }
        .accent { background-color: $brandAccent; }
    }
    ```

The likelihood of your ever using these swatch classes in a production application is very slight, but now you have some nice swatches.


Contributing
------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important because breaking your feature in a future version unintentionally is sad.
* Issue a pull request. Bonus points for topic branches.


Authors
-------

* Doc Ritezel
* Ofri Afek


Contributors
------------

* Rob Head
* Can Berk Güder


Special Thanks
--------------

* [@tildewill](https://twitter.com/TildeWill), [@emstar](https://twitter.com/emstar) and [@ajmurmann](https://twitter.com/ajmurmann) for fantastic input during the initial development process
* Dmitriy Kalinin for being himself


License
-------

See `LICENSE` for more information.
