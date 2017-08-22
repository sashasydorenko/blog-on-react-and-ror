class @Post extends React.Component
  @contextTypes =
    categories: React.PropTypes.array

  @propTypes =
    data: React.PropTypes.object
    handleSubmit: React.PropTypes.func

  constructor: (props) ->
    @state =
      editable: false
      postUpdating: false
      comments: null
      commentsCount: props.data.comments_count
      toggleComments: false

  # Post

  handleClickTitle: =>
    alertify.alert "Post: #{@props.data.name}"

  handleDelete: =>
    alertify.confirm "Do you really want to <span class='text-danger'>delete</span> <b>#{@props.data.name}</b>?", =>
      $.ajax
        method: 'DELETE'
        url: "/api/posts/#{@props.data.id}"
        success: =>
          alertify.success 'Post is successful deleted'
          do @props.handleSubmit

  handleUpdate: =>
    @setState postUpdating: true

    post =
      name: @refs.name.value
      content: @refs.content.value
      category_id: @refs.category.value

    $.ajax(
      method: 'PUT'
      data: post
      url: "/api/posts/#{@props.data.id}"
    ).done( =>
      do @handleToggleEdit
      do @props.handleSubmit
      alertify.success 'Post is successful updated'
    ).always( =>
      @setState postUpdating: false
    )

  handleToggleEdit: =>
    @setState editable: !@state.editable

  formEdit: ->
    categories = @context.categories && @context.categories.map (c) -> `<option value={c.id} key={c.id}>{c.name}</option>`

    `<div key={this.props.data.id}>
      <div className="form-group">
        <input className="form-control" ref='name' defaultValue={this.props.data.name} />
      </div>
      
      <div className="form-group">
        <textarea className="form-control" ref='content' defaultValue={this.props.data.content} rows="3" />
      </div>

      <div className="form-group">
        <select className="form-control" ref='category' defaultValue={this.props.data.category_id}>
          <option value="">- Select category -</option>
          {categories}
        </select>
      </div>
      
      <div className="form-group">
        {this.state.postUpdating ? (
          <button className="pull-right btn btn-sm btn-primary disabled">Saving...</button>
        ) : (
          <button onClick={this.handleUpdate} className="pull-right btn btn-sm btn-primary">Save</button>
        )}        
        <button onClick={this.handleToggleEdit} className="pull-right btn btn-sm btn-link">Cancel</button>
      </div>
    </div>`


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
    `<article className={'panel panel-default post'}>
      <div className="panel-body">
        {this.state.editable ? this.formEdit() : (<div>
          <header className="post-header">
            <div className="post-action-buttons">
              <a onClick={this.handleDelete}><i className="glyphicon glyphicon-remove"></i></a>
              <a onClick={this.handleToggleEdit}><i className="glyphicon glyphicon-pencil"></i></a>
            </div>

            <h1 className="post-title">
              <a onClick={this.handleClickTitle}>{this.props.data.name}</a>
              {name}
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
        </div>)}
      </div>
    </article>`
