class @Navbar extends React.Component
  handlePageAbout: ->
    alertify.alert 'Page <b>About</b>'

  handlePageContact: ->
    alertify.alert 'Page <b>Contact</b>'

  render: ->
    `<nav className="navbar navbar-default navbar-static-top">
      <div className="container">
        <div className="navbar-header">
          <button className="navbar-toggle collapsed" aria-expanded="false" data-target="#navbar-collapse" data-toggle="collapse" type="button">
            <span className="sr-only">Toggle navigation</span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
          </button>

          <a className="navbar-brand">Blog</a>
        </div>

        <div id="navbar-collapse" className="collapse navbar-collapse">
          <ul className="nav navbar-nav navbar-right">
            <li><a onClick={this.handlePageAbout}>About</a></li>
            <li><a onClick={this.handlePageContact}>Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>`
