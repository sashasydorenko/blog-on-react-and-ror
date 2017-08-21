class @SidebarSearchForm extends React.Component
  @propTypes =
    handleSearch: React.PropTypes.func

  handleSearch: =>
    $.ajax
      url: '/api/posts/search',
      data: query: @refs.query.value.trim()
      success: @props.handleSearch
      error: (xhr) => xhr.responseJSON.errors.map (error) -> console.error error

  render: ->
    `<input type="search"
            className="form-control"
            placeholder="Type search phrase here..."
            onChange={this.handleSearch}
            ref="query" />`
