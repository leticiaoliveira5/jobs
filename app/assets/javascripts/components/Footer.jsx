var Footer = createReactClass({
  propTypes: {
    footer_text: PropTypes.string
  },

  render: function() {
    return (
      <React.Fragment>
        <div><a href="https://github.com/leticiaoliveira5">leticiaoliveira5</a> {this.props.footer_text}</div>
      </React.Fragment>
    );
  }
});

