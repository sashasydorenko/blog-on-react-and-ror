class @Comment extends React.Component
  render: ->
    comment = this.props.data

    `<div className="comment">
      <h5 className="comment-author">{comment.author}</h5>
      <p className="comment-content">{comment.content}</p>
      <footer className="comment-footer">
        <time>{comment.created_at} ago</time>
        <a>Remove</a>
      </footer>
    </div>`
