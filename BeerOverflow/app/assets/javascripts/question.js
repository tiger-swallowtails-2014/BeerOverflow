var ready;
ready = function() {
    var Question = {
      bindEvents: function() {
        var self = this;
        $('body').on('ajax:success', '.new_comment', this.appendAnswerComment)
        $('body').on('ajax:success', '.question_comment', this.appendQuestionComment)
        $('body').on('ajax:success', '.button_to', this.vote)
      },
      
      appendAnswerComment: function(e, data) {
        $(this).siblings('.comment_table').append(data)
      },
      
      appendQuestionComment: function(e, data) {
        console.log("sup shit")
      },
      
      vote: function(e, data) { 
      if (data.indexOf("Success") === 0) {
          start_count = $(this).parent().siblings().find('.sud_count')
          button = $(this).children().find('input')
          start_count_text = start_count.text().replace("suds", "")
          
          if ( button.attr("class") === "positive") {
            new_count = parseInt(start_count_text) + 1
            start_count.text( new_count + " suds" ) 
          } else {
            new_count = parseInt(start_count_text) - 1
            start_count.text( new_count + " suds" ) 
          }
        }
      }
    }

  Question.bindEvents();
}


$(document).ready(ready);
$(document).on('page:load', ready);
