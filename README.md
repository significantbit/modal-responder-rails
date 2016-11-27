# Modal Responder for Rails

This gem ease the use of modal in your Rails application thanks to a Responder.
This code is built based on [Dmitriy Dudkin](https://github.com/tmwh)'s
[article](http://www.jetthoughts.com/blog/tech/2014/08/27/5-steps-to-add-remote-modals-to-your-rails-app.html)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'modal-responder-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install modal-responder-rails

Add the JavaScript to your `app/assets/javascripts/application.js`:

```javascript
//= require modal-responder
```

Add the modal container to your layout file:

```html
<html>
  <head>...</head>
  <body>
    ...
    <div id="modal-holder"></div>
  </body>
</html>
```

By default, this gem is building the modal for Bootstrap 4 but it also
supports Bootstrap 3.
You can configure this by creating the new file
`config/initializers/modal_responder.rb` with the following:

```ruby
ModalResponder.configure do |config|
  config.bootstrap = 3
end
```

## Usage

Add `data: { modal: true }` to the link opening the modal:

```ruby
<%= link_to 'Create category', new_category_path, data: { modal: true } %>
```

In the controller generating the modal content, set the `resond_to` format to
`:json` and in the action uses the `respond_modal_with` helper:

```ruby
class CategoriesController < ApplicationController
  respond_to :html, :json

  def show
    @category = Category.first
    respond_modal_with @category
  end
end
```

Finally, in the `app/views/categories/show.html.erb` file set the modal title,
body and footer:

```ruby
<%= content_for :title, @category.name %>

<div class="modal-body">
  <%# Your code here ... %>
</div>
<div class="modal-footer">
  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  <button type="button" class="btn btn-primary">Save changes</button>
</div>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
