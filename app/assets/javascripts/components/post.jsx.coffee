class @Post extends React.Component
  @propTypes =
    name: React.PropTypes.string
    content: React.PropTypes.string
    category: React.PropTypes.string
    created_at: React.PropTypes.string
    comments_count: React.PropTypes.number

  constructor: ->
    @state =
      comments: null
      toggleComments: false

  # Post

  handleClickTitle: =>
    console.log 'Post: ', @props.data.name

  handleEdit: =>
    alert "Edit post `#{@props.data.name}`"
    # @setState edit: !@state.edit

  handleUpdate: =>
    alert "Edit post `#{@props.data.name}`"

  handleDelete: =>
    if confirm "Do you really want to delete `#{@props.data.name}`?"
      $.ajax
        method: 'DELETE'
        url: "/api/posts/#{@props.data.id}"
        success: (data) => @props.handleDeletePost(@props.data.id)
        error: (xhr, status, error) => console.error "Cannot delete requested record: #{error}"

  # Comments

  handleClickComment: =>
    @setState toggleComments: !@state.toggleComments
    do @getCommentsDataFromApi unless @state.comments

  getCommentsDataFromApi: =>
    $.ajax
      url: "/api/posts/#{@props.data.id}/comments"
      success: (comments) => @setState(comments: comments)
      error: (xhr, status, error) => console.error "Cannot get data from API: #{error}"

  render: ->
    self = @
    post = @props.data
    comments = @state.comments && @state.comments.map (comment) -> `<Comment data={comment} key={'comment' + comment.id} />`

    `<article className="panel panel-default post">
      <div className="panel-body">
        <header className="post-header">
          <div className="post-action-buttons">
            <a onClick={this.handleDelete}><i className="glyphicon glyphicon-remove"></i></a>
            <a onClick={this.handleEdit}><i className="glyphicon glyphicon-pencil"></i></a>
          </div>

          <h1 className="post-title">
            <a onClick={this.handleClickTitle}>{post.name}</a>
          </h1>

          <ul className="list-unstyled list-inline text-muted post-list">
            <li>{post.created_at}</li>
            <li>{post.category}</li>
          </ul>
        </header>

        <p className="post-content">
          {post.content}
        </p>

        <footer className="post-footer">
          <a onClick={this.handleClickComment} className="post-comment">
            <i className="glyphicon glyphicon-comment"></i>
            {post.comments_count}
          </a>
        </footer>

        <div className={this.state.toggleComments ? 'comments show' : 'comments hide'}>
          {comments}
          <CommentForm />
        </div>
      </div>
    </article>`
