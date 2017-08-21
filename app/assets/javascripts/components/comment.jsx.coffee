class @Comment extends React.Component
  @propTypes =
    data: React.PropTypes.object
    postId: React.PropTypes.number
    handleDelete: React.PropTypes.func

  handleDelete: =>
    $.ajax
      method: 'DELETE'
      url: "/api/posts/#{@props.postId}/comments/#{@props.data.id}"
      success: @props.handleDelete

  render: ->
    comment = @props.data

    `<div className="comment">
      <h5 className="comment-author">{comment.author}</h5>
      <p className="comment-content">{comment.content}</p>

      <footer className="comment-footer">
        <time>{comment.created_at} ago</time>
        <a onClick={this.handleDelete}>Remove</a>
      </footer>
    </div>`
