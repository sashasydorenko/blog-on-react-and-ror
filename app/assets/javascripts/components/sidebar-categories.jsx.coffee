class @SidebarCategories extends React.Component
  @propTypes =
    categories: React.PropTypes.array

  handleClick: ->
    console.log('Category: ' + @props.name)

  renderList: ->
    @props.categories.map (category) ->
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
      {this.props.categories ? (
        this.renderList()
      ) : (
        <Loading />
      )}
    </div>`
