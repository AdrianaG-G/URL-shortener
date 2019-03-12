class Body extends React.Component {

    constructor(props) {
      super(props);
      this.state = {
        url_shorteners: []
      };
      this.handleFormSubmit = this.handleFormSubmit.bind(this)
      this.addNewUrl = this.addNewUrl.bind(this)
    }
  
    handleFormSubmit(original_url){
      if(original_url){
        let body = JSON.stringify({url: {original_url: original_url} })
    
        fetch('/api/v1/url_shorteners', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: body,
        }).then((response) => {return response.json()})
        .then((url)=>{
          this.addNewUrl(url)
        })
      }
    }
  
    addNewUrl(url){
      this.setState({
        url_shorteners: this.state.url_shorteners.concat(url)
      })
    }
  
    componentDidMount(){
      fetch('/api/v1/url_shorteners.json')
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ url_shorteners: data }) });
    }
  
    render(){
      return(
        <div>
          <NewUrl handleFormSubmit={this.handleFormSubmit}/>
          <h2>The 100 Most Visited Websites</h2>
          <Top100 url_shorteners={this.state.url_shorteners}/>
        </div>
      )
    }
  }