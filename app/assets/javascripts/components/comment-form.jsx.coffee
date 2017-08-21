class @CommentForm extends React.Component
  @propTypes =
    author: React.PropTypes.string
    content: React.PropTypes.string

  render: ->
    `<form className="comment-form">
      <input type="text" className="form-control input-sm" placeholder="Author full name" />
      <textarea type="text" className="form-control input-sm" placeholder="Write a comment..." />
      <button className="btn btn-primary btn-xs btn-block pull-right">Add comment</button>
    </form>`
