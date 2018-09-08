// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

var FormStuff = {

    init: function() {
        this.applyConditionalRequired();
        this.bindUIActions();
    },

    bindUIActions: function() {
        $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
    },

    applyConditionalRequired: function() {

        $(".require-if-active").each(function() {
            var el = $(this);
            if ($(el.data("require-pair")).is(":checked")) {
                el.prop("required", true);
            } else {
                el.prop("required", false);
            }
        });

    }

};

FormStuff.init();