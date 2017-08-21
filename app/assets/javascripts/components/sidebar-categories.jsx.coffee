class @SidebarCategories extends React.Component
  constructor: ->
    @state = categories: false

  componentDidMount: ->
    do @getDataFromApi

  getDataFromApi: ->
    $.get '/api/sidebar/categories', (data) => @setState(categories: data)

  handleClick: ->
    console.log('Category: ' + @props.name)

  renderList: ->
    @state.categories.map (category) ->
      `<a className="list-group-item" key={category.id}>
        <h4 className="list-group-item-heading">
          {category.name}
        </h4>

        <p className="list-group-item-text">
          {category.description}
        </p>
      </a>`

  render: ->
    `<div className="list-group">
      {this.state.categories ? (
        this.renderList()
      ) : (
        <Loading />
      )}
    </div>`
