# StyleGuide

Quickly see the styled output of your application.

## Usage

First, require the StyleGuide gem in your application.rb file:

    Bundler.require
    require "style_guide"

Next, mount the StyleGuide application in your `routes.rb` file:

    mount StyleGuide::Engine => "/style-guide"

By default, StyleGuide will attempt to load directories full of partials and render them at its mounted path.  Here's how to add your own directory full of partials:

    config.style_guide.partial_paths << Rails.root.join("app/views/styles")

You could, however, just display only your partials (note the assignment):

    config.style_guide.partial_paths = [Rails.root.join("app/views/styles")]

## License

See `LICENSE` for more information.
