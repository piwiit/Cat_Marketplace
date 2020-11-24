// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("packs/bootstrap.min");
require("packs/custom-rs");
require("packs/custom");
require("packs/html5shiv.min");
require("packs/jquery-ui");
require("packs/jquery.countdown.min");
require("packs/jquery.min");
require("packs/jquery.parallax-1.1.3");
require("packs/jquery.plugin.min");
require("packs/jquery.themepunch.revolution");
require("packs/jquery.themepunch.revolution.min");
require("packs/jquery.themepunch.tools.min");
require("packs/off-canvas");
require("packs/owl.carousel");
require("packs/respond.min");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context("../images", true);
const imagePath = (name) => images(name, true);
