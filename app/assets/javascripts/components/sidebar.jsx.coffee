class @Sidebar extends React.Component
  @propTypes =
    handleSearch: React.PropTypes.func

  render: ->
    `<aside>
      <div className="panel panel-default">
        <div className="panel-body">
          <SidebarSearchForm handleSearch={this.props.handleSearch} />
        </div>
      </div>

      <div className="panel panel-default">
        <div className="panel-heading">
          <h3 className="panel-title">Categories</h3>
        </div>

        <div className="panel-body">
          <SidebarCategories />
        </div>
      </div>

      <div className="panel panel-default">
        <div className="panel-heading">
          <h3 className="panel-title">Tags</h3>
        </div>

        <div className="panel-body">
          <SidebarTags />
        </div>
      </div>
    </aside>`
