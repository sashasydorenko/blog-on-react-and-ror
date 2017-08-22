class @PostForm extends React.Component
  @propTypes =
    categories: React.PropTypes.array
    handleSubmit: React.PropTypes.func

  emptyForm: ->
    @refs.name.value = ''
    @refs.content.value = ''
    @refs.file.value = ''
    @refs.category.value = ''

  handleModalForm: =>
    alertify.modalForm 'Add new post', '#innerForm', =>
      formData = new FormData()
      formData.append('name', @refs.name.value)
      formData.append('content', @refs.content.value)
      formData.append('file', @refs.file.files[0])
      formData.append('category_id', @refs.category.value)

      $.ajax
        method: 'POST'
        url: '/api/posts'
        cache: false
        contentType: false
        processData: false
        data: formData
        success: =>
          do @emptyForm
          do @props.handleSubmit
          alertify.success 'Post is successful created'
          alertify.modalForm().close()

      false

  render: ->
    categories = @props.categories && @props.categories.map (c) -> `<option value={c.id} key={c.id}>{c.name}</option>`

    `<div>
      <div className="text-center">
        <a className="btn-new-post" onClick={this.handleModalForm}>+<span className="btn-new-post-text">Add new post</span></a>
      </div>

      <div id="innerForm" className="hidden">
        <div className="form-group">
          <input ref="name" type="text" className="form-control" placeholder="Type here the title post..." />
        </div>

        <div className="form-group">
          <textarea ref="content" className="form-control" placeholder="Type here the content of post..." rows="4" />
        </div>

        <div className="form-group">
          <input ref="file" type="file" className="form-control" accept="image/*" />
          <small className="text-muted">Available extensions: jpg, jpeg, gif, png</small>
        </div>

        <div className="form-group">
          <select className="form-control" ref="category">
            <option value="">- Select category -</option>
            {categories}
          </select>
        </div>
      </div>
    </div>`

