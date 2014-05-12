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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function () {
    $("#new_todo .panel-title").click(function(){
        $("#new_todo .panel-body").slideToggle('fast');
    });

    var finishTodo = function(todo) {
        $.post('/todos/'+ todo.data('id') +'/finish', function(){
            var finishedTodo = $('<a href="javascript:void(0)" class="list-group-item"></a>');
            finishedTodo.append($('<h4 class="list-group-item-heading"></h4>').text(todo.data('title')));
            finishedTodo.append($('<p class="list-group-item-text"></p>').text(todo.data('remark')));
            $("#finished_todos").find('.active').after(finishedTodo);
            todo.fadeOut('fast').remove();
        });
    }

    $('#container').on('click', '.done', function() {
        var todo = $(this).closest('.new-todo');
        finishTodo(todo);
    });

    $(".new-todo").draggable({
        revert: 'invalid',
        helper: "clone",
        cursorAt: {left: 5}
    });

    $("#finished_todos").droppable({
        accept: ".new-todo",
        drop: function (event, ui) {
            var todo = $(ui.draggable);
            finishTodo(todo);
        }
    });

    $('#container').on('click', '.remove', function() {
        var todo = $(this).closest('.new-todo');
        $.ajax({
            type: 'DELETE',
            url: '/todos/' + todo.data('id'),
            success: function() {
                todo.fadeOut('fast').remove();
            }
        });
    });

});
