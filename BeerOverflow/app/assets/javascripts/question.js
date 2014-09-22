var Question = {
  bindEvents: function() {
    var self = this;
    $('body').on('ajax:success', '.new_comment', this.showCommentForm)
    $('body').on('ajax:success', '.button_to', this.upvote)
  },
  
  showCommentForm: function(e, data) {
    $(this).siblings('.comment_table').append(data)
  },
  
  upvote: function() {  
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


$(document).ready(function() {
  Question.bindEvents();
});

