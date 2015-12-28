// var Search = React.createClass({
//
//   getInitialState() {
//     return {
//       inputSearch: "taylor+swift"
//     }
//   },
//
//   componentDidMount(){
//     console.log("Search componentDidMount");
//   },
//
//   handleSearch() {
//     console.log("handleSearch triggered");
//     // the jquery way
//     // var theValue = $("#buttonInputExtravaganza").val();
//     var theValue = this.refs.search.getDOMNode().value;
//     this.setState({inputSearch: theValue});
//   },
//
//   render() {
//     console.log("Search is rendering");
//     return <div>
//       <div className="well">
//         <input type="text" ref="search"></input>
//         <button onClick={this.handleSearch}>Search</button>
//       </div>
//
//       <MarkAsPickup searchTerm={this.state.inputSearch}></MarkAsPickup>
//
//     </div>
//   }
// });
