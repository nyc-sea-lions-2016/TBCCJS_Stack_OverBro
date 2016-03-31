$(document).ready(function() {
  $('#question_link').on('click', function(e){
    e.preventDefault();
    $('#new_question_partial').show();
  })

  $('#new_question_partial').on('submit',function(e){
    e.preventDefault();
    $('#new_question_partial').hide();
    $.ajax({
      url: '/questions',
      type: 'post',
      data: $(this).serialize()
    }).done(function(response){

      $('#questions_container').prepend(response);
      $('#new_question_partial').trigger('reset');
    })
  })
});


