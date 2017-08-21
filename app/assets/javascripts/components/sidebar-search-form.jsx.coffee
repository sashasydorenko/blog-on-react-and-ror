class @SidebarSearchForm extends React.Component
  handleSearch: =>
    $.ajax
      url: '/api/posts/search',
      data: query: @refs.query.value.trim()
      success: (data) =>
        console.log @, data
        @props.handleSearch(data)
      error: (xhr, status, error) =>
        console.error "Search error: #{error}"

  render: ->
    `<input type="search"
            className="form-control"
            placeholder="Type search phrase here..."
            onChange={this.handleSearch}
            ref="query" />`
