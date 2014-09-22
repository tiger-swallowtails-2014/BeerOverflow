var Question = {
  bindEvents: function() {
    var self = this;
    $('.show_container').on('ajax:success', '.new_comment', this.showCommentForm)
  },
  
  showCommentForm: function(e, data) {
    $(this).siblings('.comment_table').append(data)
  }
}


$(document).ready(function() {
  Question.bindEvents();
});

