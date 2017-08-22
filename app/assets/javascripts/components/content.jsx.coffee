class @Content extends React.Component
  @childContextTypes =
    posts: React.PropTypes.array
    categories: React.PropTypes.array
  
  constructor: ->
    @state =
      posts: null
      categories: null

  getChildContext: ->
    posts: @state.posts
    categories: @state.categories

  componentDidMount: ->
    do @getPostsFromApi
    do @getCategoriesFromApi

  getPostsFromApi: =>
    $.get '/api/posts', (data) => @setState(posts: data)

  getCategoriesFromApi: =>
    $.get '/api/categories', (data) => @setState(categories: data)

  handleSearch: (posts) =>
    @setState posts: posts

  handleCategoryDelete: =>
    do @getPostsFromApi
    do @getCategoriesFromApi

  render: ->
    self = @

    posts =
      if @state.posts and @state.posts.length > 0
        @state.posts.map (post) ->
          `<Post data={post}
                 key={post.id}
                 handleSubmit={self.getPostsFromApi} />`
      else
        `<div className="panel panel-default">
          <div className="panel-body text-center text-muted" style={{fontSize: '20px'}}>
            {this.state.posts === null ? <Loading /> : 'No post'}
          </div>
        </div>`

    `<div className="container">
      <div className="row">
        <div className="col-md-9">
          <PostForm handleSubmit={this.getPostsFromApi} />

          <div className="posts">
            {posts}
          </div>
        </div>

        <div className="col-md-3">          
          <Sidebar handleSearch={this.handleSearch}
                   handleCategoryDelete={this.handleCategoryDelete}
                   handleCategorySubmit={this.getCategoriesFromApi} />
        </div>
      </div>
    </div>`
