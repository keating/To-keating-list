// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function () {
    $(".new-todo").draggable({
        revert: 'invalid',
        helper: "clone",
        cursorAt: {left: 5}
    });

    $("#finished_todos").droppable({
        accept: ".new-todo",
        drop: function (event, ui) {
            var ele = $(ui.draggable);
            var finishedTodo = $('<a href="#" class="list-group-item"></a>');
            finishedTodo.append($('<h4 class="list-group-item-heading"></h4>').text(ele.data('title')));
            finishedTodo.append($('<p class="list-group-item-text"></p>').text(ele.data('remark')));
            $(this).find('.active').after(finishedTodo);
            ele.fadeOut('fast').remove();
        }
    });

});
