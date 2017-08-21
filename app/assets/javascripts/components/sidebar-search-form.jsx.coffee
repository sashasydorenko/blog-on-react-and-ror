class @SidebarSearchForm extends React.Component
  @propTypes =
    handleSearch: React.PropTypes.func

  handleSearch: =>
    $.get '/api/posts/search', query: @refs.query.value.trim(), @props.handleSearch

  render: ->
    `<input type="search"
            className="form-control input-sm"
            placeholder="Type search phrase here..."
            onChange={this.handleSearch}
            ref="query" />`
