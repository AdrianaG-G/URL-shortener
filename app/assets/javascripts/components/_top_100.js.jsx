const Top100 = (props) => {
  var url_shorteners = props.url_shorteners.map((url) => {
    return(
      <tr key={url.id}>
        <td>{url.title}</td>
        <td>{window.location.origin}/{url.short_url}</td>
        <td>{url.visits}</td>
      </tr>
      
    )
  })
  return(
    <table className="table">
      <thead>
        <tr>
          <th>Site</th>
          <th>URL</th>
          <th>Visits</th>  
        </tr>
      </thead>
      <tbody>{url_shorteners}</tbody>
    </table>
  )
}