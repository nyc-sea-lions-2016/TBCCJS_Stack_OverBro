$(document).ready(function() {

  $('#question-link').on('click', function(e){
    e.preventDefault();
    $('#new-question-partial').show();
    $('#question-link').hide();
  })


  $('#new-question-partial').on('submit',function(e){
    e.preventDefault();
    $('#new-question-partial').hide();
    $('#question-link').show();

    $.ajax({
      url: '/questions',
      type: 'post',
      data: $(this).serialize()
    }).done(function(response){

      $('#questions-container').prepend(response);
      $('#new-question-partial').trigger('reset');
    })
  })


  $('#question-comment-link').on('click', function(e){
    e.preventDefault();
    $('#question-comment-form').show();
    $('#question-comment-link').hide();
  });


  $('#question-comment-form').on('submit', function(e){
    e.preventDefault();
    $('#question-comment-form').hide();
    $('#question-comment-link').show();

    $.ajax({
      url: '/comments',
      type: 'post',
      data: $(event.target).serialize()
    }).done(function(response){

      $('#question-comments').prepend(response)
    });
  });


  $('#answers-container').on('click', '.answer-comment-button', function(event){
    event.preventDefault();

    var answer_div = $(event.target).parent()

    $.ajax({
      url: $(event.target).attr('href'),
      type: 'get',
      dataType: 'html'
    }).done(function(response){

      $('.answer-comment-button').hide();

      $(answer_div).prepend(response);
    });
  });

  $('#answers-container').on('submit', '#answer-comment-form', function(event){
    event.preventDefault();
    var answer_div = $(event.target).parent().find('#answer-comments')

    $.ajax({
      url: $(event.target).attr('action'),
      type: 'POST',
      data: $(event.target).serialize()
    }).done(function(response){

      $('.answer-comment-button').show();

      $(answer_div).prepend(response)
      $('#answer-comment-form').remove()
    });
  });
});


