/// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"

import Rails from '@rails/ujs';
Rails.start();

//= require jquery
//= require jquery_ujs

// import "@hotwired/turbo-rails"
// Turbo.session.drive = false
// ‘’’ data: { turbo: true } ‘’’
$(document).on('turbo:load', function (){ alert("turbo on load event works") });


// config.action_view.form_with_generates_remote_forms = true