const NewUrl = (props) => {
    let formFields = {}
    return(
      <form>
        <div className="form-group">
          <input ref={input => formFields.original_url = input} className="form-control" placeholder='Enter the URL you want to shorten' required/>
        </div>
        <button onClick={ () => props.handleFormSubmit(formFields.original_url.value)} className="btn btn-default">Submit</button>
      </form>
    )
}