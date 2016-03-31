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
      method: 'post',
      data: $(event.target).serialize()
    }).done(function(response){

      $('#question-comments').prepend(response)
    });

  });

});


