class @CommentForm extends React.Component
  @propTypes =
    postId: React.PropTypes.number
    handleCommentSubmit: React.PropTypes.func

  handleSubmit: (e) =>
    e.preventDefault()

    comment =
      author: @refs.author.value
      content: @refs.content.value

    $.ajax
      method: 'POST'
      data: comment
      url: "/api/posts/#{@props.postId}/comments"
      success: (comment) =>
        @props.handleCommentSubmit comment
        @refs.author.value = ''
        @refs.content.value = ''
      error: (xhr) => xhr.responseJSON.errors.map (error) -> console.error error

  render: ->
    `<form className="comment-form" onSubmit={this.handleSubmit}>
      <input ref="author" type="text" className="form-control input-sm" placeholder="Author full name" />
      <textarea ref="content" className="form-control input-sm" placeholder="Write a comment..." />
      <button className="btn btn-primary btn-xs btn-block pull-right">Add comment</button>
    </form>`
