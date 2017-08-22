class @Sidebar extends React.Component
  @propTypes =
    categories: React.PropTypes.array
    handleSearch: React.PropTypes.func
    handleCategorySubmit: React.PropTypes.func
    handleCategoryDelete: React.PropTypes.func

  emptyForm: ->
    @refs.name.value = ''
    @refs.description.value = ''

  handleModalCategoryForm: =>
    alertify.modalForm 'Add new category', '#categoryForm', (e) =>
      category = 
        name: @refs.name.value
        description: @refs.description.value

      $(e.button.element)
        .addClass 'disabled'
        .text 'Sending...'

      $.post '/api/categories', category, =>
        do @emptyForm
        do @props.handleCategorySubmit

        alertify.success 'Category is successful created'
        alertify.modalForm().close()

        $(e.button.element)
          .removeClass 'disabled'
          .text 'Save'

      false

  categoriesList: =>
    return `<Loading />` unless @props.categories

    if @props.categories.length > 0
      self = @
      @props.categories.map (c) => `<SidebarCategory data={c} handleDelete={self.props.handleCategoryDelete} key={c.id} />`
    else
      `<small>No categories</small>`

  render: ->
    `<aside>
      <div className="panel panel-default">
        <div className="panel-body">
          <SidebarSearchForm handleSearch={this.props.handleSearch} />
        </div>
      </div>

      <div className="panel panel-default">
        <div className="panel-heading">
          <a className="btn-category-new"
             title="Add new category"
             data-toggle="tooltip"
             data-placement="left"
             onClick={this.handleModalCategoryForm}>+</a>

          <h3 className="panel-title">Categories</h3>
        </div>

        <div className="panel-body">
          <div className="list-group">
            {this.categoriesList()}
          </div>
        </div>

        <div id="categoryForm" className="hidden">
          <div className="form-group">
            <input ref="name" type="text" className="form-control" placeholder="Type here the name category..." />
          </div>

          <div className="form-group">
            <textarea ref="description" className="form-control" placeholder="Type here the description of category..." rows="2" />
          </div>
        </div>
      </div>
    </aside>`
