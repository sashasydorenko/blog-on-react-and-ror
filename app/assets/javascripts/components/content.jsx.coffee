class @Content extends React.Component
  constructor: ->
    @state = posts: null

  componentDidMount: ->
    do @getDataFromApi

  getDataFromApi: =>
    $.ajax
      url: '/api/posts'
      success: (posts) => @setState(posts: posts)
      error: (xhr) => xhr.responseJSON.errors.map (error) -> console.error error

  handleSearch: (posts) =>
    @setState posts: posts

  render: ->
    self = @

    posts =
      if @state.posts and @state.posts.length > 0
        @state.posts.map (post) ->
          `<Post data={post}
                 key={post.id}
                 handleDelete={self.getDataFromApi} />`
      else
        `<div className="panel panel-default">
          <div className="panel-body text-center text-muted" style={{fontSize: '20px'}}>
            {this.state.posts === null ? <Loading /> : 'No post'}
          </div>
        </div>`

    `<div className="container">
      <div className="row">
        <div className="col-md-9">
          <div className="posts">
            {posts}
          </div>
        </div>

        <div className="col-md-3">
          <Sidebar handleSearch={this.handleSearch} />
        </div>
      </div>
    </div>`
