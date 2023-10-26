// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require jquery_ujs

import "@hotwired/turbo-rails"
Turbo.session.drive = false

// ‘’’ data: { turbo: true } ‘’’

// $(document).on('turbo:load', function (){ alert("turbolinks on load event works") });

// esto antes estaba en el destroy.js.erb
$('#books').append("<%= j render partial: 'hola' %>")