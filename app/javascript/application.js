// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import {turbo} from "@hotwired/turbo-rails"

turbo.session.drive = true
