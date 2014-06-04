/** @jsx React.DOM */
var HelloApp = React.createClass({
  getInitialState: function() {
    return {
      text: "Hello, world!!!",
      items: []
    };
  },

  handleChange: function(e) {
    this.setState({ text: e.target.value });
  },

  handleSubmit: function() {
    var q = this.state.text;
    this.setState({ items: [] })

    var result = getFlickrPhotos(q);
    component = this;
    NProgress.start();
    result.then(function(data){
      component.setState({ items: data.photos })
      NProgress.done();
    });
  },

  render: function() {
    var createItem = function(item) {
      return <img src={item.url} />;
    }

    return(
      <div>
        <h1>Поиск: {this.state.text}</h1>
        <input onChange={this.handleChange} value={this.state.text} />
        <button onClick={this.handleSubmit}>Искать</button>
        <div className="row">
          <div className="col-xs-6">
            {this.state.items.map(createItem)}
          </div>
        </div>
      </div>
    );
  }
});
