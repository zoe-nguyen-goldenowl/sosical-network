// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap'
import 'bootstrap-icons/font/bootstrap-icons.css'
import '../stylesheets'
import '../packs/posts'
import '../packs/users'

import logo from "../images/tiktok-logo-B9AC5FE794-seeklogo.com.png"

import '../packs/infinite_scroll'

window.jQuery = window.$ = require('jquery')

Rails.start()
Turbolinks.start()
ActiveStorage.start()



