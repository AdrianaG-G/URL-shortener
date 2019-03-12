const ShowUrl = (props) => {
    var url_shorteners = props.url_shorteners.map((url) => {
      return(
        <div>
            <p>{url.title}</p>
            <p>{window.location.origin}/{url.short_url}</p>
            <p>{url.visits}</p>
        </div>
      )
    })
    return(
      <div>{url_shorteners}</div>
    )
  }