class @Navbar extends React.Component
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
            <li><a>Home</a></li>
            <li><a>About</a></li>
            <li><a>Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>`
