class @SidebarCategory extends React.Component
  @propTypes =
    data: React.PropTypes.object
    handleDelete: React.PropTypes.func

  constructor: (props) ->
    @category = props.data

  handleClick: =>
    alertify.alert "Category <b>#{@category.name}</b>"

  handleDelete: =>
    alertify.confirm "Do you really want to <span class='text-danger'>delete</span> category <b>#{@category.name}</b>?", =>
      $.ajax
        method: 'DELETE'
        url: "/api/categories/#{@category.id}"
        success: =>
          alertify.success 'Category is successful deleted'
          do @props.handleDelete

  render: ->
    `<div>
      <a className="list-group-item" onClick={this.handleClick} key={this.category.id}>
        <h4 className="list-group-item-heading">
          {this.category.name}
        </h4>

        <p className="list-group-item-text">
          {this.category.description}
        </p>
      </a>

      <a className="btn-category-remove" onClick={this.handleDelete}>
        <i className="glyphicon glyphicon-remove"></i>
      </a>
    </div>`
