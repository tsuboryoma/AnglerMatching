// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require bootstrap-sprockets

// import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "controllers"
import './custom/location_filter';
import './custom/auto_reload';
import './custom/btn_control';
import 'bootstrap'
