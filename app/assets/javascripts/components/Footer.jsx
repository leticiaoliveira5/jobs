class Footer extends React.Component {
  render() {
    return (
      <div>
        <a href="https://github.com/leticiaoliveira5">leticiaoliveira5</a>
        {this.props.footer_text}
      </div>
    );
  }
}

Footer.propTypes = {
  footer_text: PropTypes.string
};
