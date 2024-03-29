// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//issues were prevalent because ujs was not imported 
import Rails from '@rails/ujs';
Rails.start();