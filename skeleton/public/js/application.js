$(document).ready(function() {
  $('#question_link').on('click', function(e){
    e.preventDefault();
    $('#new_question_partial').show();
  })

  $('#new_question_partial').on('submit',function(e){
    e.preventDefault();
    $('#new_question_partial').hide();
    debugger;
    $.ajax({
      url: $(e.target).attr('action'),
      type: 'post',
      data:$(this).serialize()
    }).done(function(response){
      debugger;
      // $('#question_container').prepend('<div><a href="/questions/<%=question.id%>"><%=question.headline %></a>
  // </div><br>'response)
    })
  })
});
