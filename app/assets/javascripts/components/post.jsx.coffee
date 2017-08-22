class @Post extends React.Component
  @propTypes =
    data: React.PropTypes.object
    handleDelete: React.PropTypes.func

  constructor: (props) ->
    @state =
      comments: null
      commentsCount: props.data.comments_count
      toggleComments: false

  # Post

  handleClickTitle: =>
    alertify.alert "Post: #{@props.data.name}"

  handleEdit: =>
    # @setState edit: !@state.edit
    alertify.alert "Editing post <b>#{@props.data.name}</b>"

  handleDelete: =>
    alertify.confirm "Do you really want to <span class='text-danger'>delete</span> <b>#{@props.data.name}</b>?", =>
      $.ajax
        method: 'DELETE'
        url: "/api/posts/#{@props.data.id}"
        success: =>
          alertify.success 'Post is successful deleted'
          do @props.handleDelete

  # Comments

  getCommentsDataFromApi: =>
    $.get "/api/posts/#{@props.data.id}/comments", (comments) =>
      @setState comments: comments
      @setState commentsCount: comments.length

  handleClickComments: =>
    @setState toggleComments: !@state.toggleComments
    do @getCommentsDataFromApi unless @state.comments

  handleCommentDelete: =>
    do @getCommentsDataFromApi

  handleCommentSubmit: =>
    do @getCommentsDataFromApi

  comments: =>
    self = @
    @state.comments && @state.comments.map (comment) ->
     `<Comment data={comment}
               postId={self.props.data.id}
               handleDelete={self.handleCommentDelete}
               key={'comment' + comment.id} />`

  render: ->
    `<article className="panel panel-default post">
      <div className="panel-body">
        <header className="post-header">
          <div className="post-action-buttons">
            <a onClick={this.handleDelete}><i className="glyphicon glyphicon-remove"></i></a>
            <a onClick={this.handleEdit}><i className="glyphicon glyphicon-pencil"></i></a>
          </div>

          <h1 className="post-title">
            <a onClick={this.handleClickTitle}>{this.props.data.name}</a>
          </h1>

          <ul className="list-unstyled list-inline text-muted post-list">
            <li>{this.props.data.created_at}</li>
            <li>{this.props.data.category}</li>
          </ul>
        </header>

        <p className={'clearfix post-content' + (this.props.data.file ? ' post-content-has-image' : '')}>
          {this.props.data.file && (<img src={this.props.data.file} alt={this.props.data.name} className="post-image" />)}
          {this.props.data.content}
        </p>

        <footer className="post-footer">
          <a onClick={this.handleClickComments} className="post-comment">
            <i className="glyphicon glyphicon-comment"></i>
            {this.state.commentsCount}
          </a>
        </footer>

        <div className={this.state.toggleComments ? 'comments show' : 'comments hide'}>
          {this.comments()}
          <CommentForm handleCommentSubmit={this.handleCommentSubmit} postId={this.props.data.id} />
        </div>
      </div>
    </article>`
